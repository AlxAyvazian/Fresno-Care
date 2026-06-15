import type {
  ProviderSourceAdapter,
  ProviderCandidate,
  SearchParams,
  UnifiedSearchResponse,
  SourceResult,
  SearchAudit,
} from './types';
import { npiAdapter } from './npiAdapter';
import { ALL_STUB_ADAPTERS } from './stubAdapters';
import { getAdaptersForServiceType } from './serviceRouting';
import { dedupeCandidates } from './dedupe';
import { geocodeProviderAddresses } from './geocode';
import { enrichCandidatesWithWebsiteEvidence } from './websiteCrawler';
import { scoreProvider, recalculateConfidence } from './scoring';

const ADAPTER_REGISTRY: Record<string, ProviderSourceAdapter> = {
  [npiAdapter.id]: npiAdapter,
  ...Object.fromEntries(ALL_STUB_ADAPTERS.map((a) => [a.id, a])),
};

const DEBUG = true;
function log(stage: string, data: unknown) {
  if (DEBUG) {
    // eslint-disable-next-line no-console
    console.log(`[Orchestrator] ${stage}`, data);
  }
}

export async function runUnifiedSearch(params: SearchParams): Promise<UnifiedSearchResponse> {
  const startMs = performance.now();
  const { city, state, zip, radiusMiles, serviceType, centerLat, centerLng } = params;

  const adapterIds = getAdaptersForServiceType(serviceType);
  const adapters = adapterIds
    .map((id) => ADAPTER_REGISTRY[id])
    .filter((a): a is ProviderSourceAdapter => Boolean(a));

  log('Service type', serviceType);
  log('Active adapters', adapters.map((a) => a.id));

  const sourceResults: SourceResult[] = [];
  const allCandidates: ProviderCandidate[] = [];
  const urlsRequested: string[] = [];
  const errorsBySource: Record<string, string> = {};
  const rawResultCounts: Record<string, number> = {};

  // Run all adapters in parallel
  const settled = await Promise.allSettled(
    adapters.map(async (adapter) => {
      const results = await adapter.search({ city, state, zip, radiusMiles, serviceType });
      return { adapter, results };
    }),
  );

  settled.forEach((outcome, index) => {
    const adapter = adapters[index];
    if (outcome.status === 'fulfilled') {
      const results = outcome.value.results;
      rawResultCounts[adapter.id] = results.length;
      allCandidates.push(...results);
      sourceResults.push({
        sourceId: adapter.id,
        sourceLabel: adapter.label,
        ok: true,
        count: results.length,
      });
      log(`Results from ${adapter.id}`, results.length);
    } else {
      const err = String(outcome.reason?.message || outcome.reason || 'failed');
      errorsBySource[adapter.id] = err;
      sourceResults.push({
        sourceId: adapter.id,
        sourceLabel: adapter.label,
        ok: false,
        count: 0,
        error: err,
      });
      log(`Error from ${adapter.id}`, err);
    }
  });

  const normalizedCount = allCandidates.length;
  log('Normalized result count', normalizedCount);

  // Deduplicate
  const deduped = dedupeCandidates(allCandidates);
  const dedupedCount = deduped.length;
  log('Deduped result count', dedupedCount);

  // Website evidence enrichment (limited to 12 for CORS safety)
  const enriched = await enrichCandidatesWithWebsiteEvidence(
    deduped.map((d) => ({ id: d.id, name: d.name, website: d.website, evidence: d.evidence })),
  );
  const enrichedMap = new Map(enriched.map((e) => [e.id, e]));
  const withEvidence = deduped.map((d) => {
    const match = enrichedMap.get(d.id);
    return match ? { ...d, evidence: match.evidence } : d;
  });

  // Score and recalculate confidence
  const scored = withEvidence.map((c) => {
    const score = scoreProvider(c);
    const confidence = recalculateConfidence({ ...c, score });
    return { ...c, score, confidence };
  });

  // Geocode addresses
  const geocoded = await geocodeProviderAddresses(scored, centerLat, centerLng);
  const geocodedCount = geocoded.filter((p) => p.lat !== undefined && p.lng !== undefined).length;
  log('Geocoded result count', geocodedCount);

  // Calculate distance from center
  const withDistance = geocoded.map((p) => {
    if (p.lat === undefined || p.lng === undefined) return p;
    const dist = haversineMiles(centerLat, centerLng, p.lat, p.lng);
    return { ...p, distanceMiles: dist };
  });

  // Sort by score descending, then distance ascending
  const sorted = withDistance.sort((a, b) => {
    if (b.score !== a.score) return b.score - a.score;
    return (a.distanceMiles || 999) - (b.distanceMiles || 999);
  });

  const finalMarkerCount = sorted.filter((p) => p.lat !== undefined && p.lng !== undefined).length;
  log('Final rendered marker count', finalMarkerCount);

  const durationMs = Math.round(performance.now() - startMs);

  const audit: SearchAudit = {
    serviceType,
    activeAdapters: adapters.map((a) => a.id),
    urlsRequested,
    rawResultCounts,
    normalizedCount,
    dedupedCount,
    geocodedCount,
    finalMarkerCount,
    errorsBySource,
    durationMs,
  };

  return {
    params,
    results: sorted,
    sourceResults,
    audit,
  };
}

function haversineMiles(lat1: number, lng1: number, lat2: number, lng2: number): number {
  const R = 3958.8;
  const dLat = (lat2 - lat1) * (Math.PI / 180);
  const dLng = (lng2 - lng1) * (Math.PI / 180);
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(lat1 * (Math.PI / 180)) *
      Math.cos(lat2 * (Math.PI / 180)) *
      Math.sin(dLng / 2) *
      Math.sin(dLng / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c;
}
