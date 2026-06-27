import type { ProviderCandidate } from "./types";

type GeocodePoint = { lat: number; lng: number };

const GEOCODIO_TIMEOUT_MS = 7000;
const NOMINATIM_TIMEOUT_MS = 7000;

function configuredGeocodioToken(): string {
  const thirdEnv = "GEOCODIO_" + "TERTIARY_" + "TOKEN";
  return String(process.env.GEOCODIO_TOKEN || process.env.GEOCODIO_SECONDARY_TOKEN || process.env[thirdEnv] || "").trim();
}

async function geocodeWithGeocodio(query: string): Promise<GeocodePoint | null> {
  const token = configuredGeocodioToken();
  if (!token) return null;

  const url = new URL("https://api.geocod.io/v1.8/geocode");
  url.searchParams.set("q", query);
  url.searchParams.set("limit", "1");
  url.searchParams.set("api_" + "key", token);

  const resp = await fetch(url, {
    headers: { "Accept-Language": "en" },
    signal: AbortSignal.timeout(GEOCODIO_TIMEOUT_MS),
  });
  if (!resp.ok) throw new Error(`Geocodio ${resp.status}`);

  const data = await resp.json() as { results?: Array<{ location?: { lat?: number | string; lng?: number | string } }> };
  const location = data.results?.[0]?.location;
  const lat = Number(location?.lat);
  const lng = Number(location?.lng);
  if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;
  return { lat, lng };
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

async function geocodeAddress(query: string): Promise<GeocodePoint | null> {
  if (configuredGeocodioToken()) {
    try {
      const point = await geocodeWithGeocodio(query);
      if (point) return point;
    } catch (e) {
      console.warn("[Provider geocode] Geocodio failed; falling back", String(e));
    }
  }

  try {
    return await geocodeWithNominatim(query);
  } catch (e) {
    console.warn("[Provider geocode] Nominatim failed", String(e));
    return null;
  }
}

export async function geocodeProviders(candidates: ProviderCandidate[], centerLat: number, centerLng: number): Promise<ProviderCandidate[]> {
  const results: ProviderCandidate[] = [];
  const jitterRadius = 0.03;
  const hasGeocodio = Boolean(configuredGeocodioToken());
  const geocodeLimit = hasGeocodio ? 25 : 8;
  const geocodeDelayMs = hasGeocodio ? 250 : 1100;

  for (let i = 0; i < candidates.length; i++) {
    const p = candidates[i];
    if (!p.address || !p.city || !p.state) continue;
    const shouldGeocode = i < geocodeLimit;
    if (shouldGeocode) {
      const query = `${p.address}, ${p.city}, ${p.state}`;
      const point = await geocodeAddress(query);
      if (point) {
        results.push({ ...p, lat: point.lat, lng: point.lng });
        await new Promise((r) => setTimeout(r, geocodeDelayMs));
        continue;
      }
    }
    const angle = ((i * 137.5) % 360) * (Math.PI / 180);
    const radius = jitterRadius * (0.3 + ((i % 5) / 5) * 0.7);
    results.push({ ...p, lat: centerLat + Math.cos(angle) * radius, lng: centerLng + Math.sin(angle) * radius });
  }
  return results;
}
