import type { ProviderCandidate, TrustTier } from "./types";

export function scoreProvider(c: ProviderCandidate): number {
  let score = 0;
  const sourceScores: Record<string, number> = {
    "Occu-Med Confirmed": 100, "Manual Import": 95, "Patients First": 90,
    "Imported Clinics (DB)": 90, "clinicimports": 90, FMCSA: 50, FAA: 50,
    Concentra: 40, "AFC Urgent Care": 40, "Fast Pace Health": 40,
    WellNow: 40, CareNow: 40, "Nova Medical Centers": 40,
    WorkCare: 40, "Premise Health": 40, "Marathon Health": 40,
    Quest: 40, Labcorp: 40, CRL: 30, eScreen: 30, FormFox: 30, DISA: 30,
    ACR: 30, "FDA MQSA": 30, IAC: 30, NPI: 20, OpenStreetMap: 5,
  };
  for (const src of c._rawSources || [c.source]) {
    for (const [key, val] of Object.entries(sourceScores)) {
      if (src.toLowerCase().includes(key.toLowerCase())) { score += val; break; }
    }
  }
  if (c.evidence.length > 0) score += Math.round(Math.max(...c.evidence.map((e) => e.confidence)) * 0.35);
  if (c.phone) score += 5;
  if (c.fax) score += 10;
  return Math.min(score, 250);
}

/**
 * Assign trust tier based on source data.
 * verified: Occu-Med confirmed, manual imports, trusted internal records
 * registry: NPI, FMCSA, FAA, official registries
 * directory: OpenStreetMap, chain locators, public directories
 * lead: web hints, search engine results, weak discovered pages
 */
export function assignTrustTier(c: ProviderCandidate): TrustTier {
  const sources = (c._rawSources || [c.source]).map((s) => s.toLowerCase());
  const hasVerified = sources.some((s) =>
    s.includes("occu-med") || s.includes("manual import") || s.includes("patients first") || s.includes("database"),
  );
  if (hasVerified) return "verified";

  const hasRegistry = sources.some((s) =>
    s.includes("npi") || s.includes("fmcsa") || s.includes("faa"),
  );
  if (hasRegistry) return "registry";

  const hasDirectory = sources.some((s) =>
    s.includes("openstreetmap") || s.includes("osm") || s.includes("concentra") ||
    s.includes("afc") || s.includes("quest") || s.includes("labcorp"),
  );
  if (hasDirectory) return "directory";

  return "lead";
}
