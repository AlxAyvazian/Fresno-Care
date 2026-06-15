import type { ProviderCandidate, SearchParams, SourceResult, SearchAudit, UnifiedSearchResponse } from "./types";
import { searchNpi } from "./adapters/npi";
import { searchFmcsa } from "./adapters/fmcsa";
import { searchClinicImports } from "./adapters/clinicImportsDb";
import { dedupeCandidates } from "./dedupe";
import { geocodeProviders } from "./geocode";
import { scoreProvider } from "./scoring";

const SERVICE_ROUTING: Record<string, string[]> = {
  dotExam: ["npi", "fmcsa", "clinicimports"],
  faamedical: ["npi", "clinicimports"],
  physicalExam: ["npi", "clinicimports"],
  urgentCare: ["npi", "clinicimports"],
  mammogram: ["npi", "clinicimports"],
  radiology: ["npi", "clinicimports"],
  stressTest: ["npi", "clinicimports"],
  drugscreen: ["npi", "clinicimports"],
  lab: ["npi", "clinicimports"],
  audiology: ["npi", "clinicimports"],
  dental: ["npi", "clinicimports"],
  physio: ["npi", "clinicimports"],
  chiropractic: ["npi", "clinicimports"],
  behavioral: ["npi", "clinicimports"],
  pulmonary: ["npi", "clinicimports"],
  occupational: ["npi", "clinicimports"],
  primaryCare: ["npi", "clinicimports"],
};

const ADAPTER_REGISTRY: Record<string, (city: string, state: string, serviceType: string) => Promise<ProviderCandidate[]>> = {
  npi: (c, s, st) => searchNpi(c, s, st),
  fmcsa: (c, s) => searchFmcsa(c, s),
  clinicimports: (c, s) => searchClinicImports(c, s),
};

export async function runUnifiedSearch(params: SearchParams): Promise<UnifiedSearchResponse> {
  const startMs = performance.now();
  const { city, state, radiusMiles, serviceType, centerLat, centerLng } = params;
  const adapterIds = SERVICE_ROUTING[serviceType] || ["npi"];
  const adapters = adapterIds
    .map((id) => ({ id, fn: ADAPTER_REGISTRY[id] }))
    .filter((a): a is { id: string; fn: (c: string, s: string, st: string) => Promise<ProviderCandidate[]> } => Boolean(a.fn));

  const sourceResults: SourceResult[] = [];
  const allCandidates: ProviderCandidate[] = [];
  const errorsBySource: Record<string, string> = {};
  const rawResultCounts: Record<string, number> = {};

  const settled = await Promise.allSettled(
    adapters.map(async ({ id, fn }) => {
      const results = await fn(city, state, serviceType);
      return { id, results };
    }),
  );

  settled.forEach((outcome, i) => {
    const { id } = adapters[i];
    const labelMap: Record<string, string> = { npi: "NPI Registry", fmcsa: "FMCSA National Registry", clinicimports: "Imported Clinics (DB)" };
    if (outcome.status === "fulfilled") {
      rawResultCounts[id] = outcome.value.results.length;
      allCandidates.push(...outcome.value.results);
      sourceResults.push({ sourceId: id, sourceLabel: labelMap[id] || id, ok: true, count: outcome.value.results.length });
    } else {
      const err = String(outcome.reason?.message || outcome.reason || "failed");
      errorsBySource[id] = err;
      sourceResults.push({ sourceId: id, sourceLabel: labelMap[id] || id, ok: false, count: 0, error: err });
    }
  });

  const normalizedCount = allCandidates.length;
  const deduped = dedupeCandidates(allCandidates);
  const dedupedCount = deduped.length;

  const scored = deduped.map((c) => {
    const score = scoreProvider(c);
    let confidence: "high" | "medium" | "low" = "low";
    if (score >= 100) confidence = "high";
    else if (score >= 50) confidence = "medium";
    return { ...c, score, confidence };
  });

  const geocoded = await geocodeProviders(scored, centerLat, centerLng);
  const geocodedCount = geocoded.filter((p) => p.lat !== undefined && p.lng !== undefined).length;

  const withDistance = geocoded.map((p) => {
    if (p.lat === undefined || p.lng === undefined) return p;
    return { ...p, distanceMiles: haversineMiles(centerLat, centerLng, p.lat, p.lng) };
  });

  const sorted = withDistance.sort((a, b) => {
    if (b.score !== a.score) return b.score - a.score;
    return (a.distanceMiles || 999) - (b.distanceMiles || 999);
  });

  const finalMarkerCount = sorted.filter((p) => p.lat !== undefined && p.lng !== undefined).length;
  const durationMs = Math.round(performance.now() - startMs);

  return {
    params,
    results: sorted,
    sourceResults,
    audit: {
      serviceType,
      activeAdapters: adapters.map((a) => a.id),
      urlsRequested: [],
      rawResultCounts,
      normalizedCount,
      dedupedCount,
      geocodedCount,
      finalMarkerCount,
      errorsBySource,
      durationMs,
    },
  };
}

function haversineMiles(lat1: number, lng1: number, lat2: number, lng2: number): number {
  const R = 3958.8;
  const dLat = (lat2 - lat1) * (Math.PI / 180);
  const dLng = (lng2 - lng1) * (Math.PI / 180);
  const a = Math.sin(dLat / 2) ** 2 + Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) * Math.sin(dLng / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}
