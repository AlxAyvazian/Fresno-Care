# Network-Map Search System: Architecture Assessment & Repair Plan

## 1. Architecture Map — Current Search System

### 1A. Backend API Routes (7 search endpoints)

| Route | File | Data Sources | What It Does |
|-------|------|-------------|--------------|
| `POST /api/provider-sources/search` | `api-server/src/routes/providerSources.ts` | NPI Registry, FMCSA (attempted), Imported Clinics (DB), Patients First (hardcoded) | **Newest orchestrator.** Runs adapters in parallel → dedupe → score → geocode (Geocodio+Nominatim fallback) → distance-sort. Returns `UnifiedSearchResponse` with full audit trail. |
| `GET /api/providers/search` | `api-server/src/routes/providerSearch.ts` | NPI Registry (direct), OpenStreetMap/Overpass, WebHints (DuckDuckGo links) | **Older unified search.** Parallel NPI + OSM + web hints → merge/dedupe → score. Uses its **own** NPI taxonomy map, scoring, and dedupe logic — separate from the provider-sources orchestrator. |
| `GET /api/price-finder` (non-dental) | `api-server/src/routes/priceFinderUnified.ts` | Delegates to `runUnifiedProviderSearch` from `providerSearch.ts` | Wraps the **older** `/api/providers/search` pipeline, converts results to clinic format. Skips dental. |
| `GET /api/price-finder` (dental) | `api-server/src/routes/dentalProviderDiscovery.ts` | NPI Registry (dental taxonomies only) | Standalone dental-specific NPI search with its **own** taxonomy list, dedupe, and formatting. |
| `GET /api/price-finder` (fallback) | `api-server/src/routes/priceFinder.ts` | NPI Registry (NPI-2 orgs only) | **Oldest** price finder — falls through when unified doesn't handle the request. Has its own NPI search, formatting, and taxonomy maps. |
| `GET /api/price-hunt` | `api-server/src/routes/priceFinder.ts` + `dentalProviderDiscovery.ts` | NPI Registry + Serper/Tavily/DuckDuckGo + Gemini query expansion + web scraping | Searches NPI for clinics, then hunts their websites for price signals. Dental has its own handler. |
| `GET /api/occ-hunt` | `api-server/src/routes/priceFinder.ts` | NPI Registry (occ-med taxonomies) | Searches NPI for occupational medicine partners, scores by taxonomy relevance. |
| `GET /api/live-finder/search` | `api-server/src/routes/liveFinder.ts` | OpenStreetMap/Overpass (4 mirrors) | Pure OSM radius search by lat/lng. Returns classified facilities with distance. |
| `GET /api/search-history` | `api-server/src/routes/searchHistory.ts` | PostgreSQL (search snapshots) | Lists past search snapshots for auditing. |
| `POST /api/provider-sources/import` | `api-server/src/routes/providerSourcesImport.ts` | CSV upload → PostgreSQL `clinic_imports` table | Imports clinics from CSV. |
| `GET /api/provider-sources/imported` | `api-server/src/routes/providerSourcesImport.ts` | PostgreSQL `clinic_imports` table | Lists imported clinics by state/source tag. |

### 1B. Frontend Search Implementations (3 separate paths)

| Module | File | What It Does |
|--------|------|--------------|
| **Frontend NPI Search** | `occu-med-map/src/lib/npiSearch.ts` | **Directly calls `npiregistry.cms.hhs.gov`** from the browser. Has its own geocoding (Nominatim, first 8 results), its own jitter logic, its own dedupe-by-NPI. Called from `App.tsx` for the custom NPI search panel. |
| **Frontend Provider-Sources Orchestrator** | `occu-med-map/src/lib/providerSources/orchestrator.ts` | **A parallel copy** of the backend orchestrator — runs NPI adapter + stub adapters + website crawler + scoring + geocoding + distance calc — all from the **browser**. Has its own geocode.ts, dedupe.ts, scoring.ts, types.ts. |
| **Frontend Live Finder** | `occu-med-map/src/features/liveFinder/liveFinderSearch.ts` | Directly queries Overpass API from the browser. Duplicates the backend Live Finder logic. |
| **Frontend Provider Search Client** | `occu-med-map/src/features/providerSearch/providerSearchClient.ts` | Thin client that calls `GET /api/providers/search` (the **older** backend route). |
| **Frontend Price Finder Client** | `occu-med-map/src/features/priceFinder/priceFinderClient.ts` | Thin client that calls `GET /api/price-finder`, `/api/price-hunt`, `/api/occ-hunt`. |
| **Neon DB Medical Providers** | `occu-med-map/src/lib/neon-client.ts` + `NeonMedicalProviders.tsx` | **Directly queries Neon PostgreSQL** from the browser for scraped/imported medical provider data by map bounds. Separate layer overlay. |

### 1C. Backend Provider-Source Adapter System

```
api-server/src/providerSources/
├── orchestrator.ts      ← Backend orchestrator (runUnifiedSearch)
├── types.ts             ← ProviderCandidate, SearchParams, etc.
├── dedupe.ts            ← Dedupe logic
├── geocode.ts           ← Geocodio → Nominatim fallback
├── scoring.ts           ← Score by source + evidence + contact signals
└── adapters/
    ├── npi.ts           ← NPI Registry search (200 per taxonomy)
    ├── fmcsa.ts         ← FMCSA scraping (often blocked by ViewState)
    ├── clinicImportsDb.ts ← PostgreSQL imported clinics by state
    └── patientsFirst.ts ← Hardcoded Patients First clinic list
```

### 1D. Frontend Provider-Source System (DUPLICATE)

```
occu-med-map/src/lib/providerSources/
├── orchestrator.ts      ← Frontend orchestrator (identical structure)
├── types.ts             ← Same ProviderCandidate type (copy)
├── dedupe.ts            ← Same dedupe logic (copy)
├── geocode.ts           ← Nominatim only (no Geocodio — runs in browser)
├── scoring.ts           ← Same scoring (copy + extra buildExplanation)
├── serviceRouting.ts    ← Adapter routing (NPI + 18 stub adapters)
├── stubAdapters.ts      ← 18 stub adapters (all return empty [])
├── npiAdapter.ts        ← NPI adapter (calls NPI API from browser)
└── websiteCrawler.ts    ← Website evidence crawler (CORS-blocked in browser)
```

---

## 2. Duplicate / Conflicting Logic

### Critical Issue: 4 separate NPI search implementations

| # | Location | Calls NPI API From | Taxonomy Map | Dedupe | Geocode |
|---|----------|-------------------|--------------|--------|---------|
| 1 | `api-server/src/providerSources/adapters/npi.ts` | **Backend** | Own `NPI_TAXONOMY_MAP` | Backend dedupe | Backend geocode (Geocodio+Nominatim) |
| 2 | `api-server/src/routes/providerSearch.ts` → `searchNpi()` | **Backend** | Own `SERVICE_TAXONOMIES` | Own `mergeCandidates()` | City-level geocode only |
| 3 | `occu-med-map/src/lib/npiSearch.ts` | **Frontend (browser)** | Uses `npiTaxonomies.ts` | Own `dedupeByNpi()` | Own Nominatim (first 8) + jitter |
| 4 | `occu-med-map/src/lib/providerSources/npiAdapter.ts` | **Frontend (browser)** | Uses `npiTaxonomies.ts` | Via frontend orchestrator | Via frontend `geocode.ts` + jitter |

**Each has slightly different taxonomy mappings**, dedupe keys, score values, and geocoding behavior.

### Other Duplications

| What | Where it appears (duplicated) |
|------|-------------------------------|
| `haversine()` | `App.tsx`, `networkMapUtils.ts`, `radiusExtractor.ts`, `liveFinder.ts` (backend), `liveFinderSearch.ts` (frontend), `providerSearch.ts`, `orchestrator.ts` (backend) — **7 copies** |
| `classifyFacility()` | `liveFinder.ts` (backend), `networkMapUtils.ts` (frontend) — **2 copies** |
| Overpass/OSM query builder | `liveFinder.ts` (backend), `liveFinderSearch.ts` (frontend), `radiusExtractor.ts`, `providerSearch.ts` (searchOsm) — **4 copies** |
| Price Finder taxonomy maps | `priceFinder.ts`, `App.tsx` (`PF_TAXONOMY_MAP`), `dentalProviderDiscovery.ts` — **3 copies** |
| Transparent network listings | `priceFinder.ts` (`TRANSPARENT_NETWORKS`), `App.tsx` (`PF_NETWORKS`), `dentalProviderDiscovery.ts` (`DENTAL_NETWORKS`) — **3 copies** |
| Provider dedupe logic | `api-server/providerSources/dedupe.ts`, `occu-med-map/providerSources/dedupe.ts`, `providerSearch.ts` → `mergeCandidates`, `dentalProviderDiscovery.ts` → `dedupeProviders`, `npiSearch.ts` → `dedupeByNpi` — **5 implementations** |
| Geocode + jitter | `api-server/providerSources/geocode.ts`, `occu-med-map/providerSources/geocode.ts`, `npiSearch.ts` → `geocodeProviders` — **3 implementations** |

---

## 3. Specific Problem Findings

### 3.1 — Frontend acts as its own NPI search engine

**Confirmed.** Two frontend files directly call `npiregistry.cms.hhs.gov`:
- `npiSearch.ts` — used by `App.tsx` for the custom NPI search panel
- `providerSources/npiAdapter.ts` — used by the frontend orchestrator

Both bypass the backend entirely. The frontend orchestrator (`providerSources/orchestrator.ts`) is a full copy of the backend orchestrator's structure but runs in the browser, where its websiteCrawler is CORS-blocked and its geocoding hits Nominatim rate limits much faster.

### 3.2 — Coordinate Jittering Creates Fake Map Pins

**Confirmed in 3 locations:**
1. `occu-med-map/src/lib/npiSearch.ts:279-325` — Only geocodes first 8 providers; all others get **jittered fake coordinates** around city center (`jitterRadius = 0.03`, ~2-3 km)
2. `occu-med-map/src/lib/providerSources/geocode.ts:9-55` — Same jitter pattern
3. `api-server/src/providerSources/geocode.ts:86-106` — Backend does the same (geocodes first 8 or 25 with Geocodio; jitters the rest)

**Result:** Providers that couldn't be geocoded appear as real map pins scattered around the city center. There is no field marking whether coordinates are real or jittered.

### 3.3 — Radius Filtering is NOT Enforced

**Confirmed.** The `radiusMiles` parameter is accepted and passed through but:
- **Backend `/api/provider-sources/search`:** NPI search is city+state only (no radius). FMCSA is city+state only. Imported clinics are **state-wide** (no city or radius filter). `distanceMiles` is calculated but results are never filtered by radius — all results are returned regardless of distance.
- **Backend `/api/providers/search`:** NPI search is city+state only. OSM Overpass uses radius correctly. But the merged results are not filtered by radius.
- **Backend `/api/price-finder`:** No radius filtering at all.
- **Frontend NPI search:** City+state only, no radius filter.
- Only `radiusExtractor.ts:28` (used for the LOCS city-tier data) actually filters by radius.

### 3.4 — Price Finder Uses Older Search Path

**Confirmed.** `priceFinderUnified.ts` calls `runUnifiedProviderSearch` from `providerSearch.ts` (the **older** route), not the newer `runUnifiedSearch` from `api-server/providerSources/orchestrator.ts`. This means Price Finder doesn't benefit from imported clinics, Patients First data, FMCSA data, or Geocodio geocoding.

### 3.5 — Source Labels / Trust Labels

Currently all providers get generic labels:
- NPI results get `confidence: "medium"`, `badges: ["NPI"]`
- OSM results get `confidence: "low"`, score 18-26
- WebHints get `confidence: "low"`, score 5
- Imported clinics get `confidence: "high"`, score 95

**Issues:**
- No `coordinateStatus` field to distinguish real vs. jittered coordinates
- No distinction between "successfully geocoded" vs. "jittered fallback"
- WebHints (DuckDuckGo search links) appear in the same results list as verified NPI providers
- The older `providerSearch.ts` route labels everything as just `"NPI"`, `"OpenStreetMap"`, or `"WebHint"` with no fine-grained trust tiers

---

## 4. Recommended Target Architecture

### Single authoritative search pipeline:

```
Frontend (React App)
  └── POST /api/provider-sources/search  ← single entry point
        └── api-server/src/providerSources/orchestrator.ts
              ├── adapters/npi.ts          (NPI Registry)
              ├── adapters/fmcsa.ts        (FMCSA, when available)
              ├── adapters/clinicImportsDb.ts (imported clinics)
              ├── adapters/patientsFirst.ts (hardcoded clinics)
              ├── [future] adapters/osm.ts  (OpenStreetMap)
              ├── [future] adapters/google.ts (not this phase)
              └── [future] other adapters
              │
              ├── dedupe.ts → scoring.ts → geocode.ts
              │
              └── Response includes:
                    - results[] with coordinateStatus, source labels, trust tier
                    - sourceResults[] with adapter status
                    - audit{} with full pipeline metrics
```

### What each frontend feature calls:

| Feature | Backend Route | Notes |
|---------|---------------|-------|
| Provider Search (main) | `POST /api/provider-sources/search` | Drop `GET /api/providers/search` |
| Price Finder | `POST /api/provider-sources/search` | Drop `priceFinderUnified.ts` dependency on old route |
| Price Hunt | `GET /api/price-hunt` (keep) | Refactor to get clinic list from provider-sources pipeline |
| Occ Hunt | `GET /api/occ-hunt` (keep) | Refactor to get clinic list from provider-sources pipeline |
| Live Finder | `GET /api/live-finder/search` (keep) | OSM-only radius search — keep separate |
| NPI Custom Search | New `POST /api/provider-sources/npi-custom` | Move frontend `npiSearch.ts` logic to backend |
| Neon DB Overlay | Keep as-is (separate layer) | This is a data overlay, not a search path |

---

## 5. Step-by-Step Repair Plan (Small Safe PRs)

### PR 1: Add `coordinateStatus` field + stop jittering
**Goal:** Providers with unverifiable coordinates get `lat: undefined, lng: undefined` and `coordinateStatus: 'unverified'` instead of fake jittered coords. Map only renders pins for `'imported' | 'geocoded'` statuses. Unverified results still appear in the list panel.

**Files changed:**
- `api-server/src/providerSources/types.ts` — add `coordinateStatus: 'imported' | 'geocoded' | 'unverified'` to `ProviderCandidate`
- `api-server/src/providerSources/geocode.ts` — remove jitter fallback; set `coordinateStatus: 'unverified'` when geocoding fails; set `'geocoded'` on success
- `api-server/src/providerSources/adapters/clinicImportsDb.ts` — set `coordinateStatus: 'imported'` for rows with existing lat/lng
- `api-server/src/providerSources/adapters/npi.ts` — set `coordinateStatus: 'unverified'` (NPI has no coords)
- `api-server/src/providerSources/adapters/patientsFirst.ts` — set `coordinateStatus: 'unverified'`
- `occu-med-map/src/lib/providerSources/types.ts` — mirror the type change

**Risks:** Map may show fewer pins. Mitigate by ensuring list panel prominently displays unverified results with a "No verified location" label.
**Test:** Search a city. Verify no jittered pins appear. Verify unverified providers appear in the list.

---

### PR 2: Add radius enforcement to backend orchestrator
**Goal:** Filter results by actual distance from search center.

**Files changed:**
- `api-server/src/providerSources/orchestrator.ts` — after geocoding + distance calc, filter out results where `distanceMiles > radiusMiles` (keep unverified results in a separate `unplacedResults` array)
- `api-server/src/providerSources/types.ts` — add `unplacedResults: ProviderCandidate[]` to `UnifiedSearchResponse`
- `api-server/src/providerSources/adapters/clinicImportsDb.ts` — filter by city OR within radius (not just state-wide)

**Risks:** May reduce result counts in sparse areas. Mitigate by using generous default radius (50mi) and returning unplaced results separately.
**Test:** Search "Austin, TX" with 10mi radius. Verify no results from Dallas appear. Verify unverified results without coords still appear in unplaced list.

---

### PR 3: Move NPI custom search to backend
**Goal:** Remove the frontend's direct NPI API calls. Create a backend route that handles custom NPI search.

**Files changed:**
- `api-server/src/routes/providerSources.ts` — add `POST /provider-sources/npi-custom` route
- `api-server/src/providerSources/adapters/npi.ts` — add `searchNpiCustom()` function
- `occu-med-map/src/App.tsx` — replace `searchNpiCustom(params)` call with `fetch('/api/provider-sources/npi-custom', ...)` 
- `occu-med-map/src/lib/npiSearch.ts` — mark as deprecated (keep types/interfaces for now)

**Risks:** Slight latency increase (browser→backend→NPI vs browser→NPI). Acceptable for consistency.
**Test:** Use custom NPI search panel in the UI. Verify results match previous behavior. Verify no direct NPI API calls from browser (check Network tab).

---

### PR 4: Retire the older `/api/providers/search` route
**Goal:** Route Price Finder and any remaining callers through `/api/provider-sources/search`.

**Files changed:**
- `api-server/src/routes/priceFinderUnified.ts` — change to call backend `runUnifiedSearch` (from `providerSources/orchestrator.ts`) instead of `runUnifiedProviderSearch` (from `providerSearch.ts`)
- `api-server/src/routes/providerSearch.ts` — add deprecation warning log, keep alive but log usage
- `occu-med-map/src/features/providerSearch/providerSearchClient.ts` — update to call `POST /api/provider-sources/search`
- `occu-med-map/src/App.tsx` — verify it uses `searchProviderSources()` (already does for main search)

**Risks:** Price Finder results may change slightly (different taxonomy mappings, scoring). Mitigate by comparing results side-by-side in testing.
**Test:** Use Price Finder for several service types. Verify results include imported clinics. Verify source labels are present.

---

### PR 5: Retire frontend orchestrator + frontend NPI adapter
**Goal:** Remove the duplicate frontend provider-sources system. All provider search goes through the backend.

**Files changed:**
- Delete `occu-med-map/src/lib/providerSources/orchestrator.ts`
- Delete `occu-med-map/src/lib/providerSources/npiAdapter.ts`
- Delete `occu-med-map/src/lib/providerSources/geocode.ts`
- Delete `occu-med-map/src/lib/providerSources/dedupe.ts`
- Delete `occu-med-map/src/lib/providerSources/stubAdapters.ts`
- Delete `occu-med-map/src/lib/providerSources/serviceRouting.ts`
- Delete `occu-med-map/src/lib/providerSources/websiteCrawler.ts`
- Keep `occu-med-map/src/lib/providerSources/types.ts` (shared types used by UI)
- Keep `occu-med-map/src/lib/providerSources/scoring.ts` (has `buildExplanation()` used by UI)
- Delete `occu-med-map/src/lib/npiSearch.ts` (fully replaced by backend route from PR 3)
- Update any imports in `App.tsx` or other files that referenced deleted modules

**Risks:** If any UI component directly called the frontend orchestrator, it would break. Verify all callers are migrated first.
**Test:** Build the app. Verify no import errors. Verify all search features work through backend routes.

---

### PR 6: Refactor Price Hunt and Occ Hunt to use provider-sources pipeline
**Goal:** Price Hunt and Occ Hunt get their clinic list from the backend orchestrator instead of their own NPI search.

**Files changed:**
- `api-server/src/routes/priceFinder.ts` — refactor `searchNpi()` in price-hunt and occ-hunt handlers to call `searchNpi()` from `providerSources/adapters/npi.ts` or call `runUnifiedSearch()`
- Consolidate the duplicate `TAXONOMY_MAP` constants

**Risks:** May return more or fewer clinics for price hunt. Mitigate by testing with specific cities.
**Test:** Run price-hunt for several service types + cities. Verify clinic discovery still works. Verify Serper/Tavily/web-scraping price extraction still works.

---

### PR 7: Honest source labels + trust tiers
**Goal:** Every result carries a clear source label and trust tier.

**Files changed:**
- `api-server/src/providerSources/types.ts` — add `trustTier: 'verified' | 'registry' | 'directory' | 'lead'` to `ProviderCandidate`
- `api-server/src/providerSources/scoring.ts` — assign trust tiers based on source
- `api-server/src/providerSources/adapters/*.ts` — set appropriate trust tiers
- Frontend rendering in `App.tsx` — display trust tier badge with appropriate styling

**Trust tier mapping:**
| Trust Tier | Sources | Color |
|-----------|---------|-------|
| `verified` | Occu-Med Confirmed, Manual Import, Patients First | Green |
| `registry` | NPI, FMCSA, FAA | Blue |
| `directory` | OpenStreetMap, Chain Locators | Yellow |
| `lead` | WebHint, Web Search | Gray |

**Risks:** Low. Additive change.
**Test:** Search and verify each source type displays the correct trust badge.

---

### PR 8: Clean up dental-specific route
**Goal:** Dental price finder uses the main provider-sources pipeline.

**Files changed:**
- `api-server/src/routes/dentalProviderDiscovery.ts` — refactor to use `runUnifiedSearch` with `serviceType: 'dental'`
- `api-server/src/routes/priceFinderUnified.ts` — remove the `if (serviceType === "dental") { next(); return; }` bypass

**Risks:** Dental results may change. Compare before/after.
**Test:** Price Finder with dental service type. Verify dental providers still appear.

---

## 6. Risk Summary

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Fewer map pins after removing jitter | High | Medium | List panel prominently shows unverified results; label clearly |
| Radius filtering reduces results in rural areas | Medium | Medium | Generous default radius (50mi); unplaced results shown separately |
| Price Finder results change with new pipeline | Medium | Low | Side-by-side comparison testing before switching |
| Frontend NPI removal breaks custom search | Low | High | Backend custom NPI route built and tested before removal |
| Import path disruption | Low | High | Import routes unchanged; only search pipeline refactored |

---

## 7. Recommendation on Frontend NPI Search File

**Remove `occu-med-map/src/lib/npiSearch.ts` entirely** (in PR 5, after PR 3 provides the backend replacement).

**Keep from the frontend `providerSources/` directory:**
- `types.ts` — shared types used by UI rendering
- `scoring.ts` — only `buildExplanation()` is used by the UI for tooltip text

**Delete everything else** from the frontend `providerSources/` directory:
- `orchestrator.ts`, `npiAdapter.ts`, `geocode.ts`, `dedupe.ts`, `stubAdapters.ts`, `serviceRouting.ts`, `websiteCrawler.ts`

**Rationale:** The frontend should never directly call external APIs (NPI, Overpass) for provider search. All search logic belongs in the backend where:
- Geocodio API keys are available (much better geocoding than Nominatim rate-limited from browser)
- Imported clinic data from PostgreSQL is accessible
- CORS is not an issue for website evidence crawling
- Rate limiting can be managed centrally
- A single dedupe/scoring pipeline ensures consistent results

The frontend's `providerSources/` system was built as a parallel copy when the backend wasn't ready — it should now be fully retired in favor of the backend pipeline.

---

## Appendix: Files Not Changed

The following should remain untouched in this phase:
- `scrapers/` — Scrapy ingestion pipeline (separate concern)
- `occu-med-map/src/lib/neon-client.ts` + `NeonMedicalProviders.tsx` — Neon DB overlay (separate layer)
- `occu-med-map/src/features/liveFinder/` — Live Finder frontend client (calls backend correctly)
- `occu-med-map/src/features/priceFinder/priceFinderClient.ts` — Price Finder client (calls backend correctly)
- `lib/db/` — Database schema (no changes needed)
- `mockup-sandbox/` — UI mockup sandbox (not part of production search)
- Google Places — explicitly deferred per user request
