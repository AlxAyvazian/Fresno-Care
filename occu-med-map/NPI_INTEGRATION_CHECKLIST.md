# NPI Registry Integration — Manual Verification Checklist

## Setup
1. Build the app: `npm run build` or `npx vite build`
2. Start the dev server: `npm run dev`
3. Open the app in a browser with DevTools console visible

## Category Tab → NPI Search Flow
- [ ] Open the **Live Finder** panel (📡 LIVE FINDER button)
- [ ] Click anywhere on the US map to set a search center
- [ ] Click the **"All"** chip — clears any NPI category and shows OSM facilities
- [ ] Click **"Urgent Care"** chip
  - [ ] Console shows `[NPI Search] Selected provider category: urgent`
  - [ ] Console shows mapped taxonomy terms
  - [ ] Console shows generated NPI API URL(s)
  - [ ] Console shows number of raw results
  - [ ] Console shows number of normalized results
  - [ ] Console shows number of deduped results
  - [ ] Console shows number of geocoded results
  - [ ] Console shows number of rendered markers
  - [ ] Map updates to show ⚡ markers (not clinic names on pins)
  - [ ] Results panel shows NPI verified provider cards
- [ ] Repeat for each category:
  - [ ] Occupational Medicine
  - [ ] Primary Care
  - [ ] Dentistry
  - [ ] Radiology / Imaging
  - [ ] Pulmonary / PFT
  - [ ] Labs / Phlebotomy
  - [ ] Physical Therapy
  - [ ] Chiropractic
  - [ ] Audiology
  - [ ] Behavioral Health

## Privacy / Public-Facing Pins
- [ ] Click any map pin while an NPI category is active
- [ ] Popup shows: "{Category} available" — **not** the clinic name
- [ ] Popup shows "NPI VERIFIED" badge
- [ ] Popup shows city/state/zip — no exact street address
- [ ] Popup does **not** show the provider's organization name

## Error & Edge Cases
- [ ] Click a category chip **before** clicking the map
  - [ ] App shows: "Click the map first to set a search location."
- [ ] Click a rural/remote area where Nominatim can't resolve city/state
  - [ ] App shows: "Could not determine city/state from map location..."
- [ ] Search a category in a very small town with few providers
  - [ ] If no results: "No NPI providers found for {Category} in this area..."
  - [ ] No crash; UI stays responsive
- [ ] Verify loading spinner appears while NPI query is in flight
- [ ] Verify results panel shows debug pipeline counts: `raw → norm → geo → markers`

## Map Marker Behavior
- [ ] Switching from "All" to a category clears OSM markers and shows NPI markers
- [ ] Switching back to "All" clears NPI markers and restores OSM markers
- [ ] NPI markers use the correct category color (e.g., orange for Urgent Care)
- [ ] NPI markers use the correct category icon
- [ ] Map does not crash if geocoding fails for some providers

## Data Integrity
- [ ] NPI results are deduplicated by NPI number (no duplicate providers)
- [ ] Providers without addresses are skipped with a logged reason
- [ ] Both individual (NPI-1) and organization (NPI-2) providers appear where applicable
- [ ] Taxonomy description in the card matches the selected category

## Browser Console (DevTools)
Expected log sequence when clicking a category:
```
[NPI Search] Selected provider category: <category>
[NPI Search] Mapped taxonomy terms/codes: [...]
[NPI Search] Generated NPI API URL: https://npiregistry.cms.hhs.gov/api/?...
[NPI Search] Number of raw NPI results: <n>
[NPI Search] Number of normalized results: <n>
[NPI Search] Number of deduped results: <n>
[NPI Search] Number of geocoded results: <n>
[NPI Search] Number of rendered markers: <n>
```
