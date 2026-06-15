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
    // Find the [ that comes after = (the actual array start)
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

// ── 2. Load BlueHive providers from JSONL ────────────────────────────────
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

// ── 3. Map providers to coordinates ────────────────────────────────────────
// Try exact city match first, then fuzzy
interface MapProvider extends BlueHiveProvider {
  lat: number | null;
  lng: number | null;
}

const mapped: MapProvider[] = [];
let matched = 0;
let unmatched = 0;
const unmatchedCities = new Map<string, number>();

for (const p of providers) {
  const cityNorm = p.city.toLowerCase().trim();
  const stateNorm = p.state.toLowerCase().trim();
  const key = `${cityNorm}, ${stateNorm}`;

  const coords = cityCoords.get(key);
  if (coords) {
    // Add small jitter so overlapping markers don't stack perfectly
    const jitterLat = (Math.random() - 0.5) * 0.008;
    const jitterLng = (Math.random() - 0.5) * 0.012;
    mapped.push({
      ...p,
      lat: coords.lat + jitterLat,
      lng: coords.lng + jitterLng,
    });
    matched++;
  } else {
    mapped.push({ ...p, lat: null, lng: null });
    unmatched++;
    const ukey = `${p.city}, ${p.state}`;
    unmatchedCities.set(ukey, (unmatchedCities.get(ukey) || 0) + 1);
  }
}

console.log(`Matched: ${matched} / ${providers.length}`);
console.log(`Unmatched: ${unmatched} / ${providers.length}`);
console.log(`\nTop 20 unmatched cities:`);
[...unmatchedCities.entries()]
  .sort((a, b) => b[1] - a[1])
  .slice(0, 20)
  .forEach(([city, count]) => console.log(`  ${city}: ${count}`));

// ── 4. Write output ──────────────────────────────────────────────────────
const output = {
  version: '1.0',
  generated: new Date().toISOString(),
  total: mapped.length,
  matched,
  unmatched,
  providers: mapped,
};

fs.writeFileSync('public/bluehive-map-data.json', JSON.stringify(output));
console.log('\nWrote public/bluehive-map-data.json');
