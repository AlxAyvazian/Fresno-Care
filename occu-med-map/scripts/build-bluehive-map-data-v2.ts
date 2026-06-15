import * as fs from 'fs';

// ── 1. Load LOCS from data.ts ─────────────────────────────────────────────
const dataTs = fs.readFileSync('src/lib/data.ts', 'utf-8');
const lines = dataTs.split('\n');
let inLocs = false;
const locsLines: string[] = [];
for (const line of lines) {
  const trimmed = line.trim();
  if (trimmed.startsWith('export const LOCS')) {
    inLocs = true;
    const eqIdx = line.indexOf('=');
    const bracketIdx = eqIdx !== -1 ? line.indexOf('[', eqIdx) : line.lastIndexOf('[');
    if (bracketIdx !== -1) locsLines.push(line.slice(bracketIdx));
    continue;
  }
  if (!inLocs) continue;
  if (trimmed === '];') {
    locsLines.push('];');
    break;
  }
  locsLines.push(line);
}
const LOCS = eval(locsLines.join('\n')) as Array<any>;

// Build city+state -> {lat, lng} map
const cityCoords = new Map<string, { lat: number; lng: number }>();
for (const loc of LOCS) {
  const [name, state, lat, lng] = loc;
  const key = `${name.toLowerCase()}, ${state.toLowerCase()}`;
  cityCoords.set(key, { lat, lng });
}

// ── 2. Load existing geocode cache if any ──────────────────────────────────
const CACHE_FILE = 'scripts/bluehive-city-coords-cache.json';
let geocodeCache: Record<string, { lat: number; lng: number }> = {};
if (fs.existsSync(CACHE_FILE)) {
  geocodeCache = JSON.parse(fs.readFileSync(CACHE_FILE, 'utf-8'));
  console.log(`Loaded ${Object.keys(geocodeCache).length} cached city coordinates`);
}

// ── 3. Load BlueHive providers ────────────────────────────────────────────
interface BlueHiveProvider {
  clinic_name: string;
  address_1: string;
  address_2: string;
  city: string;
  state: string;
  zip: string;
  phone: string;
  fax: string;
  website: string;
  hours: string;
  services: string;
  service_categories: string;
  accepts_new_patients: string;
  telehealth: string;
  source_url: string;
  source_city_url: string;
  source_state_url: string;
}

const jsonlLines = fs.readFileSync('bluehive_providers.jsonl', 'utf-8').trim().split('\n');
const providers: BlueHiveProvider[] = jsonlLines.map((l) => JSON.parse(l));

// ── 4. Collect unique unmatched cities ─────────────────────────────────────
const unmatchedCities = new Map<string, { city: string; state: string; count: number }>();
for (const p of providers) {
  const cityNorm = p.city.toLowerCase().trim();
  const stateNorm = p.state.toLowerCase().trim();
  const key = `${cityNorm}, ${stateNorm}`;
  if (!cityCoords.has(key) && !geocodeCache[key]) {
    const existing = unmatchedCities.get(key);
    if (existing) {
      existing.count++;
    } else {
      unmatchedCities.set(key, { city: p.city, state: p.state, count: 1 });
    }
  }
}

console.log(`\nTotal providers: ${providers.length}`);
console.log(`Cities in LOCS: ${cityCoords.size}`);
console.log(`Cities already cached: ${Object.keys(geocodeCache).length}`);
console.log(`Cities to geocode: ${unmatchedCities.size}`);

// ── 5. Geocode unmatched cities ────────────────────────────────────────────
const citiesToGeocode = [...unmatchedCities.values()];
let geocoded = 0;
let failed = 0;

for (const { city, state } of citiesToGeocode) {
  const key = `${city.toLowerCase()}, ${state.toLowerCase()}`;
  if (geocodeCache[key]) continue;

  const query = `${city}, ${state}, USA`;
  try {
    const res = await fetch(
      `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(query)}&limit=1`,
      { headers: { 'Accept-Language': 'en', 'User-Agent': 'OccuMed-Map/1.0' } }
    );
    const data = await res.json();
    if (data?.[0]) {
      geocodeCache[key] = {
        lat: parseFloat(data[0].lat),
        lng: parseFloat(data[0].lon),
      };
      geocoded++;
      console.log(`  [${geocoded}/${citiesToGeocode.length}] ${city}, ${state} -> ${data[0].lat}, ${data[0].lon}`);
    } else {
      failed++;
      console.log(`  FAIL: ${city}, ${state} - no results`);
    }
  } catch (e) {
    failed++;
    console.log(`  FAIL: ${city}, ${state} - ${e}`);
  }

  // Save cache after each geocode
  fs.writeFileSync(CACHE_FILE, JSON.stringify(geocodeCache, null, 2));

  // Nominatim rate limit: 1 req/sec
  await new Promise((r) => setTimeout(r, 1100));
}

console.log(`\nGeocoded: ${geocoded}, Failed: ${failed}`);

// ── 6. Map all providers to coordinates ────────────────────────────────────
interface MapProvider extends BlueHiveProvider {
  lat: number | null;
  lng: number | null;
}

const mapped: MapProvider[] = [];
let matched = 0;
let cacheHit = 0;
let noCoord = 0;

for (const p of providers) {
  const key = `${p.city.toLowerCase()}, ${p.state.toLowerCase()}`;
  let coords = cityCoords.get(key);
  if (!coords) coords = geocodeCache[key];

  if (coords) {
    const jitterLat = (Math.random() - 0.5) * 0.008;
    const jitterLng = (Math.random() - 0.5) * 0.012;
    mapped.push({
      ...p,
      lat: coords.lat + jitterLat,
      lng: coords.lng + jitterLng,
    });
    if (cityCoords.has(key)) matched++;
    else cacheHit++;
  } else {
    mapped.push({ ...p, lat: null, lng: null });
    noCoord++;
  }
}

console.log(`\nMapped: ${mapped.length}`);
console.log(`  LOCS match: ${matched}`);
console.log(`  Geocoded: ${cacheHit}`);
console.log(`  No coords: ${noCoord}`);

// ── 7. Write output ────────────────────────────────────────────────────────
const output = {
  version: '1.0',
  generated: new Date().toISOString(),
  total: mapped.length,
  withCoords: matched + cacheHit,
  withoutCoords: noCoord,
  providers: mapped,
};

fs.writeFileSync('public/bluehive-map-data.json', JSON.stringify(output));
console.log('\nWrote public/bluehive-map-data.json');
