import type { ProviderCandidate } from "../types";
import { searchLangSearchWeb, isLangSearchConfigured, type LangSearchWebPage } from "../../lib/langSearchClient";

const SERVICE_LABELS: Record<string, string> = {
  dotExam: "DOT physical exam",
  faamedical: "FAA medical exam",
  physicalExam: "occupational physical exam",
  urgentCare: "urgent care",
  mammogram: "mammogram imaging",
  radiology: "x-ray imaging radiology",
  stressTest: "cardiac stress test",
  drugscreen: "drug screen collection",
  lab: "lab draw collection",
  audiology: "audiogram hearing test occupational health",
  dental: "dental exam",
  physio: "physical therapy",
  chiropractic: "chiropractic clinic",
  behavioral: "behavioral health clinic",
  pulmonary: "spirometry PFT pulmonary function test",
  occupational: "occupational medicine clinic",
  primaryCare: "primary care clinic",
};

function stableId(input: string): string {
  let hash = 0;
  for (let i = 0; i < input.length; i++) {
    hash = ((hash << 5) - hash + input.charCodeAt(i)) | 0;
  }
  return `langsearch-${Math.abs(hash)}`;
}

function cleanTitle(title: string): string {
  return title
    .replace(/\s*[|\-–—:]\s*(pricing|prices|cost|fee schedule|self pay|urgent care|occupational medicine).*$/i, "")
    .replace(/\s+/g, " ")
    .trim()
    .slice(0, 160) || "LangSearch web lead";
}

function pageToCandidate(page: LangSearchWebPage, city: string, state: string, serviceType: string): ProviderCandidate {
  const serviceDetected = SERVICE_LABELS[serviceType] || serviceType;
  const snippet = page.summary || page.snippet || page.displayUrl || page.url;

  return {
    id: stableId(page.url || page.name),
    name: cleanTitle(page.name || page.displayUrl || page.url),
    address: "",
    city,
    state,
    postalCode: "",
    phone: "",
    website: page.url,
    coordinateStatus: "unverified",
    source: "LangSearch",
    sourceDetail: "Web evidence lead",
    sourceUrl: page.url,
    confidence: "low",
    trustTier: "lead",
    score: 8,
    badges: ["WEB"],
    evidence: [
      {
        serviceDetected,
        evidenceUrl: page.url,
        evidenceTextSnippet: snippet.slice(0, 1200),
        confidence: 45,
        source: "LangSearch",
      },
    ],
    _rawSources: ["LangSearch"],
  };
}

export async function searchLangSearchEvidence(city: string, state: string, serviceType: string): Promise<ProviderCandidate[]> {
  if (!isLangSearchConfigured()) return [];

  const service = SERVICE_LABELS[serviceType] || serviceType;
  const query = `${service} provider ${city} ${state} clinic service pricing evidence`;

  const response = await searchLangSearchWeb({
    query,
    freshness: "noLimit",
    summary: true,
    count: Number(process.env.LANGSEARCH_PROVIDER_EVIDENCE_COUNT || 5),
    timeoutMs: Number(process.env.LANGSEARCH_PROVIDER_EVIDENCE_TIMEOUT_MS || 2500),
  });

  const seen = new Set<string>();
  const candidates: ProviderCandidate[] = [];
  for (const page of response.results) {
    if (!page.url || seen.has(page.url)) continue;
    seen.add(page.url);
    candidates.push(pageToCandidate(page, city, state.toUpperCase(), serviceType));
  }

  return candidates;
}
