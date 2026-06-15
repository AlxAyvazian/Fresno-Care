import { getTaxonomiesForCategory, type NormalizedNpiProvider } from './npiTaxonomies';

const DEBUG = true; // always log in dev; Vite strips in prod if desired

function log(stage: string, data: unknown) {
  if (DEBUG) {
    // eslint-disable-next-line no-console
    console.log(`[NPI Search] ${stage}`, data);
  }
}

export interface NpiSearchParams {
  category: string;
  city: string;
  state: string;
  centerLat: number;
  centerLng: number;
  limit?: number;
}

export interface NpiSearchResponse {
  results: NormalizedNpiProvider[];
  rawCount: number;
  normalizedCount: number;
  geocodedCount: number;
  finalMarkerCount: number;
  apiUrls: string[];
  error?: string;
}

export async function searchNpiByCategory(params: NpiSearchParams): Promise<NpiSearchResponse> {
  const { category, city, state, centerLat, centerLng, limit = 200 } = params;
  const taxonomies = getTaxonomiesForCategory(category);

  log('Selected provider category', category);
  log('Mapped taxonomy terms/codes', taxonomies);

  if (!taxonomies.length) {
    const msg = `No taxonomies mapped for category: ${category}`;
    log('Error', msg);
    return {
      results: [],
      rawCount: 0,
      normalizedCount: 0,
      geocodedCount: 0,
      finalMarkerCount: 0,
      apiUrls: [],
      error: msg,
    };
  }

  const apiUrls: string[] = [];
  const allRaw: unknown[] = [];

  // Query NPI for each taxonomy in parallel
  const batches = await Promise.allSettled(
    taxonomies.map(async (taxonomy) => {
      const query = new URLSearchParams({
        version: '2.1',
        city: city.trim(),
        state: state.trim().toUpperCase(),
        taxonomy_description: taxonomy,
        limit: String(limit),
      });

      const url = `https://npiregistry.cms.hhs.gov/api/?${query.toString()}`;
      apiUrls.push(url);
      log('Generated NPI API URL', url);

      const resp = await fetch(url, { signal: AbortSignal.timeout(10000) });
      if (!resp.ok) throw new Error(`NPI ${resp.status}`);
      const data = (await resp.json()) as { results?: unknown[] };
      return data.results || [];
    }),
  );

  batches.forEach((batch) => {
    if (batch.status === 'fulfilled') {
      allRaw.push(...batch.value);
    } else {
      log('Taxonomy batch failed', batch.reason);
    }
  });

  log('Number of raw NPI results', allRaw.length);

  // Normalize
  const normalized = normalizeNpiResults(allRaw);
  log('Number of normalized results', normalized.length);

  // Dedupe by NPI
  const deduped = dedupeByNpi(normalized);
  log('Number of deduped results', deduped.length);

  // Geocode addresses
  const withCoords = await geocodeProviders(deduped, centerLat, centerLng);
  const geocodedCount = withCoords.filter((p) => p.lat !== null && p.lng !== null).length;
  log('Number of geocoded results', geocodedCount);

  const finalMarkerCount = withCoords.length;
  log('Number of rendered markers', finalMarkerCount);

  return {
    results: withCoords,
    rawCount: allRaw.length,
    normalizedCount: normalized.length,
    geocodedCount,
    finalMarkerCount,
    apiUrls,
  };
}

function normalizeNpiResults(raw: unknown[]): NormalizedNpiProvider[] {
  const results: NormalizedNpiProvider[] = [];

  for (const r of raw) {
    if (!r || typeof r !== 'object') continue;
    const row = r as Record<string, unknown>;

    const basic = (row.basic as Record<string, string>) || {};
    const taxonomies = (row.taxonomies as Array<{ code?: string; desc?: string; primary?: boolean }>) || [];
    const addresses = (row.addresses as Array<Record<string, string>>) || [];

    const tax = taxonomies.find((t) => t.primary) || taxonomies[0] || {};
    const addr = addresses.find((a) => a.address_purpose === 'LOCATION') || addresses[0] || {};

    const enumerationType = String(row.enumeration_type || '');
    const isOrg = enumerationType === 'NPI-2';

    const name = isOrg
      ? (basic.organization_name || basic.organization_name_2 || 'Unknown Organization')
      : [basic.first_name, basic.middle_name, basic.last_name].filter(Boolean).join(' ').trim() || 'Unknown Provider';

    const npi = String(row.number || '');
    if (!npi) continue;

    const addressParts = [addr.address_1, addr.city, addr.state, addr.postal_code].filter(Boolean);
    if (!addressParts.length) {
      log('Skipping provider — no usable address', { npi, name });
      continue;
    }

    results.push({
      npi,
      name,
      providerType: isOrg ? 'organization' : 'individual',
      taxonomyCode: tax.code || '',
      taxonomyDescription: tax.desc || '',
      address: addressParts.join(', '),
      city: addr.city || '',
      state: addr.state || '',
      postalCode: addr.postal_code || '',
      phone: addr.telephone_number || '',
      lat: null,
      lng: null,
      source: 'NPI Registry',
    });
  }

  return results;
}

function dedupeByNpi(results: NormalizedNpiProvider[]): NormalizedNpiProvider[] {
  const seen = new Map<string, NormalizedNpiProvider>();
  for (const r of results) {
    if (!seen.has(r.npi)) {
      seen.set(r.npi, r);
    }
  }
  return Array.from(seen.values());
}

async function geocodeProviders(
  providers: NormalizedNpiProvider[],
  centerLat: number,
  centerLng: number,
): Promise<NormalizedNpiProvider[]> {
  const results: NormalizedNpiProvider[] = [];
  const jitterRadius = 0.03; // roughly 2-3 km at mid latitudes

  for (let i = 0; i < providers.length; i++) {
    const p = providers[i];

    if (!p.address || !p.city || !p.state) {
      log('Skipping provider — no usable address for geocoding', { npi: p.npi, name: p.name });
      continue;
    }

    // Try to geocode first 8 individually; jitter the rest
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
            // Nominatim rate limit: ~1 req/sec
            await new Promise((resolve) => setTimeout(resolve, 1100));
            continue;
          }
        }
      } catch (e) {
        log('Geocoding failed for provider', { npi: p.npi, error: String(e) });
      }
    }

    // Fallback: city center with deterministic jitter based on index
    const angle = ((i * 137.5) % 360) * (Math.PI / 180); // golden angle for even spread
    const radius = jitterRadius * (0.3 + ((i % 5) / 5) * 0.7);
    results.push({
      ...p,
      lat: centerLat + Math.cos(angle) * radius,
      lng: centerLng + Math.sin(angle) * radius,
    });
  }

  return results;
}
