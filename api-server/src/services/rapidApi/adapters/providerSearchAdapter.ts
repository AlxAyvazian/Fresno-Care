export interface RapidApiProviderSearchParams {
  location: string;
  lat?: number;
  lng?: number;
  radiusMiles?: number;
  serviceKeywords?: string[];
  city?: string;
  state?: string;
  limit?: number;
}

export interface RapidApiProviderResult {
  id?: string;
  name: string;
  address?: string;
  city?: string;
  state?: string;
  postalCode?: string;
  phone?: string;
  website?: string;
  lat?: number;
  lng?: number;
  sourceUrl?: string;
  confidence: number;
  evidence: string[];
  distanceMiles?: number;
}

export interface RapidApiProviderSearchResult {
  providers: RapidApiProviderResult[];
  debug: {
    succeeded?: string;
    failed: string[];
  };
}

function normalizeString(value: unknown): string {
  return typeof value === "string" ? value.trim() : "";
}

function normalizeNumber(value: unknown): number | undefined {
  const num = typeof value === "number" ? value : Number(value);
  return Number.isFinite(num) ? num : undefined;
}

function firstString(...values: unknown[]): string {
  for (const value of values) {
    const normalized = normalizeString(value);
    if (normalized) return normalized;
  }
  return "";
}

function providerSearchUrl(): string | null {
  const explicitUrl = process.env.RAPIDAPI_PROVIDER_SEARCH_URL?.trim();
  if (explicitUrl) return explicitUrl;

  const host = process.env.RAPIDAPI_PROVIDER_SEARCH_HOST?.trim();
  const path = process.env.RAPIDAPI_PROVIDER_SEARCH_PATH?.trim() || "/search";
  if (!host) return null;

  return `https://${host}${path.startsWith("/") ? path : `/${path}`}`;
}

function providerSearchHost(): string | null {
  return process.env.RAPIDAPI_PROVIDER_SEARCH_HOST?.trim() || null;
}

function mapProvider(item: Record<string, unknown>, fallback: RapidApiProviderSearchParams): RapidApiProviderResult | null {
  const name = firstString(item.name, item.title, item.business_name, item.providerName, item.placeName);
  if (!name) return null;

  const address = firstString(item.address, item.formatted_address, item.fullAddress, item.streetAddress, item.vicinity);
  const city = firstString(item.city, fallback.city);
  const state = firstString(item.state, fallback.state);
  const postalCode = firstString(item.postalCode, item.postal_code, item.zip, item.zipCode);
  const phone = firstString(item.phone, item.phoneNumber, item.telephone, item.formatted_phone_number);
  const website = firstString(item.website, item.url, item.websiteUrl);
  const sourceUrl = firstString(item.sourceUrl, item.source_url, item.url, website);
  const lat = normalizeNumber(item.lat ?? item.latitude ?? (item.location as Record<string, unknown> | undefined)?.lat);
  const lng = normalizeNumber(item.lng ?? item.lon ?? item.longitude ?? (item.location as Record<string, unknown> | undefined)?.lng);
  const confidence = normalizeNumber(item.confidence) ?? (address || phone || website ? 65 : 45);

  const evidence = [
    firstString(item.snippet, item.description, item.category, item.type),
    address ? `Address: ${address}` : "",
    phone ? `Phone: ${phone}` : "",
    website ? `Website: ${website}` : "",
  ].filter(Boolean);

  return {
    id: firstString(item.id, item.place_id, item.providerId, sourceUrl, name),
    name,
    address,
    city,
    state,
    postalCode,
    phone,
    website,
    lat,
    lng,
    sourceUrl,
    confidence,
    evidence: evidence.length ? evidence : [`RapidAPI provider result for ${name}`],
    distanceMiles: normalizeNumber(item.distanceMiles ?? item.distance_miles ?? item.distance),
  };
}

function extractItems(payload: unknown): Record<string, unknown>[] {
  if (!payload || typeof payload !== "object") return [];
  const record = payload as Record<string, unknown>;

  const candidates = [
    record.providers,
    record.results,
    record.items,
    record.data,
    record.businesses,
    record.places,
  ];

  for (const candidate of candidates) {
    if (Array.isArray(candidate)) return candidate.filter((item): item is Record<string, unknown> => Boolean(item) && typeof item === "object");
  }

  return [];
}

export async function searchProviders(params: RapidApiProviderSearchParams): Promise<RapidApiProviderSearchResult> {
  const apiKey = process.env.RAPIDAPI_KEY?.trim();
  const url = providerSearchUrl();
  const host = providerSearchHost();

  if (!apiKey) {
    return { providers: [], debug: { failed: ["RAPIDAPI_KEY not configured"] } };
  }

  if (!url) {
    return {
      providers: [],
      debug: {
        failed: ["RAPIDAPI_PROVIDER_SEARCH_URL or RAPIDAPI_PROVIDER_SEARCH_HOST is required for provider search"],
      },
    };
  }

  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-RapidAPI-Key": apiKey,
        ...(host ? { "X-RapidAPI-Host": host } : {}),
      },
      body: JSON.stringify({
        query: params.serviceKeywords?.join(" ") || "provider",
        location: params.location,
        lat: params.lat,
        lng: params.lng,
        radiusMiles: params.radiusMiles,
        city: params.city,
        state: params.state,
        limit: params.limit ?? 20,
      }),
      signal: AbortSignal.timeout(Number(process.env.RAPIDAPI_PROVIDER_SEARCH_TIMEOUT_MS || 8000)),
    });

    if (!response.ok) {
      return { providers: [], debug: { failed: [`RapidAPI provider search HTTP ${response.status}`] } };
    }

    const payload = await response.json() as unknown;
    const providers = extractItems(payload)
      .map((item) => mapProvider(item, params))
      .filter((provider): provider is RapidApiProviderResult => Boolean(provider))
      .slice(0, params.limit ?? 20);

    return {
      providers,
      debug: {
        succeeded: host || url,
        failed: [],
      },
    };
  } catch (error) {
    return {
      providers: [],
      debug: {
        failed: [`RapidAPI provider search failed: ${String(error)}`],
      },
    };
  }
}
