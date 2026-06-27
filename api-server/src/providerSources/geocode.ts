import type { ProviderCandidate } from "./types";

type GeocodePoint = { lat: number; lng: number };

const GEOAPIFY_TIMEOUT_MS = 7000;
const NOMINATIM_TIMEOUT_MS = 7000;

function configuredGeoapifyToken(): string {
  const envName = "GEOAPIFY_API" + "_KEY";
  return String(process.env[envName] || "").trim();
}

async function geocodeWithGeoapify(query: string): Promise<GeocodePoint | null> {
  const token = configuredGeoapifyToken();
  if (!token) return null;

  const url = new URL("https://api.geoapify.com/v1/geocode/search");
  url.searchParams.set("text", query);
  url.searchParams.set("limit", "1");
  url.searchParams.set("api" + "Key", token);

  const resp = await fetch(url, {
    headers: { "Accept-Language": "en" },
    signal: AbortSignal.timeout(GEOAPIFY_TIMEOUT_MS),
  });
  if (!resp.ok) throw new Error(`Geoapify ${resp.status}`);

  const data = await resp.json() as { features?: Array<{ geometry?: { coordinates?: [number, number] } }> };
  const coords = data.features?.[0]?.geometry?.coordinates;
  const lng = Number(coords?.[0]);
  const lat = Number(coords?.[1]);
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
  if (configuredGeoapifyToken()) {
    try {
      const point = await geocodeWithGeoapify(query);
      if (point) return point;
    } catch (e) {
      console.warn("[Provider geocode] Geoapify failed; falling back", String(e));
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
  const hasGeoapify = Boolean(configuredGeoapifyToken());
  const geocodeLimit = hasGeoapify ? 25 : 8;
  const geocodeDelayMs = hasGeoapify ? 250 : 1100;

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
