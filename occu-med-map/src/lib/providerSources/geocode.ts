import type { ProviderCandidate } from './types';

export async function geocodeProviderAddresses(
  candidates: ProviderCandidate[],
  centerLat: number,
  centerLng: number,
): Promise<ProviderCandidate[]> {
  const results: ProviderCandidate[] = [];
  const jitterRadius = 0.03; // ~2-3 km

  for (let i = 0; i < candidates.length; i++) {
    const p = candidates[i];

    if (!p.address || !p.city || !p.state) {
      // eslint-disable-next-line no-console
      console.log('[Geocode] Skipping provider — no usable address', { name: p.name });
      continue;
    }

    const shouldGeocode = i < 8;

    if (shouldGeocode) {
      try {
        const query = encodeURIComponent(`${p.address}, ${p.city}, ${p.state}`);
        const url = `https://nominatim.openstreetmap.org/search?format=json&limit=1&countrycodes=us&q=${query}`;
        const resp = await fetch(url, {
          headers: { 'Accept-Language': 'en' },
          signal: AbortSignal.timeout(7000),
        });
        if (resp.ok) {
          const data = (await resp.json()) as Array<{ lat: string; lon: string }>;
          if (data?.[0]) {
            results.push({
              ...p,
              lat: Number(data[0].lat),
              lng: Number(data[0].lon),
            });
            await new Promise((resolve) => setTimeout(resolve, 1100));
            continue;
          }
        }
      } catch (e) {
        // eslint-disable-next-line no-console
        console.log('[Geocode] Failed for provider', { name: p.name, error: String(e) });
      }
    }

    // Fallback: deterministic jitter around city center
    const angle = ((i * 137.5) % 360) * (Math.PI / 180);
    const radius = jitterRadius * (0.3 + ((i % 5) / 5) * 0.7);
    results.push({
      ...p,
      lat: centerLat + Math.cos(angle) * radius,
      lng: centerLng + Math.sin(angle) * radius,
    });
  }

  return results;
}
