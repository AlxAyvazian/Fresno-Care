import type { ProviderCandidate, CoordinateStatus } from "./types";
import { getCachedGeocode, cacheGeocode } from "./persistence";
import { isPersistenceConfigured } from "../lib/networkMapPersistence";

type GeocodePoint = { lat: number; lng: number };

const GEOCODIO_TIMEOUT_MS = 7000;
const NOMINATIM_TIMEOUT_MS = 7000;

function configuredGeocodioKeys(): string[] {
  const thirdEnv = "GEOCODIO_" + "TERTIARY_" + "TOKEN";
  const fourthEnv = "GEOCODIO_" + "QUATERNARY_" + "TOKEN";
  return [
    process.env.GEOCODIO_TOKEN,
    process.env.GEOCODIO_SECONDARY_TOKEN,
    process.env[thirdEnv],
    process.env[fourthEnv],
  ]
    .map((key) => String(key || "").trim())
    .filter((key, index, allKeys) => Boolean(key) && allKeys.indexOf(key) === index);
}

async function geocodeWithGeocodioKey(query: string, key: string): Promise<GeocodePoint | null> {
  const url = new URL("https://api.geocod.io/v1.8/geocode");
  url.searchParams.set("q", query);
  url.searchParams.set("limit", "1");
  url.searchParams.set("api_" + "key", key);

  const resp = await fetch(url, {
    headers: { "Accept-Language": "en" },
    signal: AbortSignal.timeout(GEOCODIO_TIMEOUT_MS),
  });
  if (!resp.ok) return null;

  const data = await resp.json() as { results?: Array<{ location?: { lat?: number | string; lng?: number | string } }> };
  const location = data.results?.[0]?.location;
  const lat = Number(location?.lat);
  const lng = Number(location?.lng);
  if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;
  return { lat, lng };
}

async function geocodeWithGeocodio(query: string): Promise<GeocodePoint | null> {
  const keys = configuredGeocodioKeys();
  for (const key of keys) {
    const point = await geocodeWithGeocodioKey(query, key);
    if (point) return point;
  }
  return null;
}

async function geocodeWithNominatim(query: string): Promise<GeocodePoint | null> {
  const url = new URL("https://nominatim.openstreetmap.org/search");
  url.searchParams.set("format", "json");
  url.searchParams.set("limit", "1");
  url.searchParams.set("countrycodes", "us");
  url.searchParams.set("q", query);

  const resp = await fetch(url, {
    headers: { "Accept-Language": "en" },
    signal: AbortSignal.timeout(NOMINATIM_TIMEOUT_MS),
  });
  if (!resp.ok) throw new Error(`Nominatim ${resp.status}`);

  const data = await resp.json() as Array<{ lat: string; lon: string }>;
  const lat = Number(data?.[0]?.lat);
  const lng = Number(data?.[0]?.lon);
  if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;
  return { lat, lng };
}

export async function geocodeAddress(query: string): Promise<GeocodePoint | null> {
  // Check geocode_cache first (if DB is configured)
  if (isPersistenceConfigured()) {
    try {
      const cached = await getCachedGeocode(query);
      if (cached) return cached;
    } catch {
      // Cache miss or DB error — fall through to live geocoding
    }
  }

  let point: GeocodePoint | null = null;
  let provider = "nominatim";

  if (configuredGeocodioKeys().length) {
    point = await geocodeWithGeocodio(query);
    if (point) provider = "geocodio";
  }

  if (!point) {
    try {
      point = await geocodeWithNominatim(query);
    } catch (e) {
      console.warn("[Provider geocode] Nominatim failed", String(e));
    }
  }

  // Save result to cache (if DB is configured)
  if (isPersistenceConfigured()) {
    try {
      await cacheGeocode(query, point?.lat ?? null, point?.lng ?? null, provider, point !== null);
    } catch {
      // Ignore cache write failures
    }
  }

  return point;
}

/**
 * Geocode providers — NO jittering. Providers without verified coordinates
 * remain with lat/lng undefined and coordinateStatus="unverified".
 */
export async function geocodeProviders(candidates: ProviderCandidate[], _centerLat: number, _centerLng: number): Promise<ProviderCandidate[]> {
  const results: ProviderCandidate[] = [];
  const hasGeocodio = configuredGeocodioKeys().length > 0;
  const geocodeLimit = hasGeocodio ? 25 : 8;
  const geocodeDelayMs = hasGeocodio ? 250 : 1100;

  for (let i = 0; i < candidates.length; i++) {
    const p = candidates[i];

    // Already has coordinates from import — keep as-is
    if (p.lat !== undefined && p.lng !== undefined && p.coordinateStatus === "imported") {
      results.push(p);
      continue;
    }

    // Try geocoding if within limit and has address data
    if (i < geocodeLimit && p.address && p.city && p.state) {
      const query = `${p.address}, ${p.city}, ${p.state}`;
      const point = await geocodeAddress(query);
      if (point) {
        results.push({ ...p, lat: point.lat, lng: point.lng, coordinateStatus: "geocoded" as CoordinateStatus });
        await new Promise((r) => setTimeout(r, geocodeDelayMs));
        continue;
      }
    }

    // No jittering — leave as unverified with no coordinates
    results.push({ ...p, lat: undefined, lng: undefined, coordinateStatus: "unverified" as CoordinateStatus });
  }
  return results;
}
