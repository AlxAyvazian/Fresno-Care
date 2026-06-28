export type LangSearchFreshness = "oneDay" | "oneWeek" | "oneMonth" | "oneYear" | "noLimit";

export interface LangSearchWebPage {
  id?: string;
  name: string;
  url: string;
  displayUrl?: string;
  snippet?: string;
  summary?: string;
  datePublished?: string | null;
  dateLastCrawled?: string | null;
}

interface LangSearchApiResponse {
  code?: number;
  msg?: string | null;
  data?: {
    _type?: string;
    queryContext?: { originalQuery?: string };
    webPages?: {
      webSearchUrl?: string;
      totalEstimatedMatches?: number | null;
      value?: LangSearchWebPage[];
      someResultsRemoved?: boolean;
    };
  };
}

export interface LangSearchRequest {
  query: string;
  freshness?: LangSearchFreshness;
  summary?: boolean;
  count?: number;
  timeoutMs?: number;
}

export interface LangSearchResponse {
  query: string;
  webSearchUrl?: string;
  results: LangSearchWebPage[];
  totalEstimatedMatches?: number | null;
  someResultsRemoved?: boolean;
}

const DEFAULT_ENDPOINT = "https://api.langsearch.com/v1/web-search";
const VALID_FRESHNESS = new Set<LangSearchFreshness>(["oneDay", "oneWeek", "oneMonth", "oneYear", "noLimit"]);

export function isLangSearchConfigured(): boolean {
  return Boolean(process.env.LANGSEARCH_API_KEY?.trim());
}

function getLangSearchEndpoint(): string {
  return process.env.LANGSEARCH_ENDPOINT?.trim() || DEFAULT_ENDPOINT;
}

function normalizeFreshness(value?: string): LangSearchFreshness {
  if (value && VALID_FRESHNESS.has(value as LangSearchFreshness)) return value as LangSearchFreshness;
  return "noLimit";
}

function normalizeCount(value?: number): number {
  const fallback = Number(process.env.LANGSEARCH_DEFAULT_COUNT || 10);
  const count = Number.isFinite(value) ? Number(value) : fallback;
  return Math.min(Math.max(Math.round(count || 10), 1), 10);
}

export async function searchLangSearchWeb(request: LangSearchRequest): Promise<LangSearchResponse> {
  const apiKey = process.env.LANGSEARCH_API_KEY?.trim();
  const query = request.query.trim();

  if (!query) throw new Error("LangSearch query is required");
  if (!apiKey) throw new Error("LANGSEARCH_API_KEY is not configured");

  const resp = await fetch(getLangSearchEndpoint(), {
    method: "POST",
    headers: {
      Authorization: `Bearer ${apiKey}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      query,
      freshness: normalizeFreshness(request.freshness),
      summary: request.summary ?? true,
      count: normalizeCount(request.count),
    }),
    signal: AbortSignal.timeout(request.timeoutMs ?? 15000),
  });

  const payload = (await resp.json().catch(() => null)) as LangSearchApiResponse | null;
  if (!resp.ok) {
    throw new Error(payload?.msg || `LangSearch request failed with HTTP ${resp.status}`);
  }
  if (payload?.code && payload.code !== 200) {
    throw new Error(payload.msg || `LangSearch request failed with code ${payload.code}`);
  }

  return {
    query,
    webSearchUrl: payload?.data?.webPages?.webSearchUrl,
    totalEstimatedMatches: payload?.data?.webPages?.totalEstimatedMatches,
    someResultsRemoved: payload?.data?.webPages?.someResultsRemoved,
    results: payload?.data?.webPages?.value || [],
  };
}
