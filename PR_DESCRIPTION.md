# PR Description: Unified API Source Registry + Multi-Source Web Evidence

## Overview

This PR adds a backend-only API source registry and a unified multi-source web evidence layer for Network Map.

This is not a LangSearch-only PR. LangSearch is one source inside a larger backend source system.

The goal is:

```text
NPI / FMCSA / imported clinics / RapidAPI / web evidence APIs
  -> normalize
  -> dedupe
  -> evidence
  -> score
  -> geocode when possible
  -> persist into Neon
```

This does not replace existing app behavior.

## Additive-only scope

This PR does not replace or remove:

- NPI
- FMCSA
- imported clinic DB flow
- map inventory loading from Neon
- provider dedupe/scoring/geocoding rules
- existing frontend behavior

All API-backed evidence feeds the backend normalization/evidence pipeline only.

## Environment variables registered

### Web search / web evidence

- `LANGSEARCH_API_KEY`
- `SERPER_API_KEY`
- `TAVILY_API_KEY`
- `EXA_API_KEY`

### Web extraction / browser automation

- `FIRECRAWL_API_KEY`
- `BROWSE_AI_API_KEY`
- `OLOSTEP_API_KEY`
- `BROWSERBASE_API_KEY`

### AI extraction / summarization / ranking

- `GEMINI_API_KEY`
- `GROQ_API_KEY`
- `OPENROUTER_KEY`
- `CEREBRAS_API_KEY`
- `HUGGINGFACE_API_KEY`
- `MINIMAX_API_KEY`
- `CLOD_API_KEY`

### Geocoding / map / distance

- `GEOCODIO_TOKEN`
- `GEOCODIO_SECONDARY_TOKEN`
- `GEOCODIO_TERTIARY_TOKEN`
- `GEOCODIO_QUATERNARY_TOKEN`
- `RAPIDAPI_KEY`
- `RAPIDAPI_ENABLED`
- `RAPIDAPI_GEOCODING_ENABLED`
- `RAPIDAPI_LOCATION_LOOKUP_ENABLED`
- `RAPIDAPI_MAP_DISPLAY_ENABLED`
- `RAPIDAPI_PROVIDER_SEARCH_ENABLED`
- `RAPIDAPI_ROUTING_DISTANCE_ENABLED`
- `RAPIDAPI_PROVIDER_SEARCH_URL`
- `RAPIDAPI_PROVIDER_SEARCH_HOST`
- `RAPIDAPI_PROVIDER_SEARCH_PATH`
- `RAPIDAPI_PROVIDER_SEARCH_TIMEOUT_MS`

### Vector / semantic index

- `PINECONE_API_KEY`

## Actively wired in this PR

### Provider discovery / web evidence

The orchestrator now routes configured web APIs through the unified `webevidence` adapter.

Active web evidence sources:

- `LANGSEARCH_API_KEY` through the shared `langSearchClient.ts`
- `SERPER_API_KEY`
- `TAVILY_API_KEY`
- `EXA_API_KEY`
- `FIRECRAWL_API_KEY` using Firecrawl search as web evidence

Web evidence candidates remain low-trust:

- `trustTier: "lead"`
- `coordinateStatus: "unverified"`
- evidence/list-first, not verified provider truth

### Provider discovery / RapidAPI

RapidAPI provider search is routed by the orchestrator only when required env values and flags are enabled:

- `RAPIDAPI_KEY`
- `RAPIDAPI_ENABLED`
- `RAPIDAPI_PROVIDER_SEARCH_ENABLED`

### Price discovery

`/api/price-discovery/run` currently uses LangSearch for open-web price discovery.

Safety fixes:

- explicit `prices: []` is respected as an intentional zero-result run
- `query` must be a non-empty string
- LangSearch failures are best-effort and do not kill the route
- price rows are saved only when a dollar amount is extracted
- weak web leads do not go through generic provider upsert unless they have NPI or address + ZIP
- response separates `configured`, `requested`, and `ran`

### Geocoding

Existing geocoding support remains active for:

- `GEOCODIO_TOKEN`
- `GEOCODIO_SECONDARY_TOKEN`
- `GEOCODIO_TERTIARY_TOKEN`
- `GEOCODIO_QUATERNARY_TOKEN`

## API source registry

Added:

```text
api-server/src/lib/apiSourceRegistry.ts
```

The registry tracks:

- source name
- env var name
- category
- configured true/false
- adapter status
- usage area

Statuses are intentionally strict:

- `active` means real code currently calls the API
- `configured_not_wired` means diagnostics can see the key, but no dedicated adapter consumes it yet
- `planned` is reserved for future work

## Source status endpoint

Added:

```text
GET /api/source-status
```

This returns safe diagnostics only. It never exposes secret values.

## Unified search audit

`/api/provider-sources/search` audit now includes:

- `configuredApiSources`
- `missingApiSources`
- `configuredButNotWired`

This makes it visible when a key exists but is not actually wired yet.

## Browser/page extraction adapters

Implemented in `browserExtractionClient.ts` and exposed via `POST /api/browser-extraction/run`:

- `BROWSE_AI_API_KEY` — Browse AI robot/task extraction (requires `BROWSE_AI_ROBOT_ID` or `BROWSE_AI_TASK_ID`).
- `OLOSTEP_API_KEY` — Olostep page extraction (requires `OLOSTEP_BASE_URL`).
- `BROWSERBASE_API_KEY` — Browserbase managed browser sessions (requires `BROWSERBASE_PROJECT_ID` or `BROWSERBASE_BASE_URL`).

These are background/directory extraction workflows. They do not run during normal live provider search.

## Vector indexing adapter

Implemented in `vectorIndexClient.ts` and exposed via `POST /api/vector-index/upsert` and `POST /api/vector-index/query`:

- `PINECONE_API_KEY` — Pinecone vector index client (requires `PINECONE_INDEX_HOST`).

The client accepts pre-computed vectors only. If records lack `values`, the client returns a clear error: "Embedding provider not configured."

## Configured but not runtime-ready

Some APIs require companion configuration beyond just the API key. `/api/source-status` exposes exactly what is missing via `runtimeReady` and `missingRequiredConfig`:

- **Browse AI** requires `BROWSE_AI_ROBOT_ID` or `BROWSE_AI_TASK_ID`.
- **Olostep** requires `OLOSTEP_BASE_URL` (no verified default endpoint is known).
- **Browserbase** requires `BROWSERBASE_PROJECT_ID` or `BROWSERBASE_BASE_URL`.
- **Pinecone** requires `PINECONE_INDEX_HOST`.
- **RapidAPI provider search** requires `RAPIDAPI_PROVIDER_SEARCH_URL` or `RAPIDAPI_PROVIDER_SEARCH_HOST`.
- **Clod** requires `CLOD_API_BASE_URL` and `CLOD_EXTRACTION_MODEL`.
- **MiniMax** requires `MINIMAX_API_BASE_URL`.

Follow-up implementation details are documented in:

```text
TODO_API_ADAPTERS.md
```

## Example `/api/source-status` response

```json
{
  "summary": {
    "total": 30,
    "configured": 5,
    "notConfigured": 25,
    "runtimeReady": 3,
    "configuredButNotRuntimeReady": [
      {
        "sourceName": "Browse AI",
        "envVar": "BROWSE_AI_API_KEY",
        "missingRequiredConfig": ["BROWSE_AI_ROBOT_ID or BROWSE_AI_TASK_ID"]
      }
    ],
    "active": 30,
    "configuredNotWired": 0,
    "planned": 0
  },
  "sources": [
    {
      "sourceName": "Exa",
      "envVar": "EXA_API_KEY",
      "configured": true,
      "category": "web_search",
      "adapterStatus": "active",
      "usedBy": ["provider_discovery"],
      "runtimeReady": true,
      "missingRequiredConfig": []
    },
    {
      "sourceName": "Browse AI",
      "envVar": "BROWSE_AI_API_KEY",
      "configured": true,
      "category": "web_extraction",
      "adapterStatus": "active",
      "usedBy": ["enrichment"],
      "runtimeReady": false,
      "missingRequiredConfig": ["BROWSE_AI_ROBOT_ID or BROWSE_AI_TASK_ID"],
      "notes": "Requires BROWSE_AI_ROBOT_ID or BROWSE_AI_TASK_ID to run extraction jobs."
    }
  ]
}
```

## Testing notes

Recommended checks after deployment:

1. Set at least one web evidence API key.
2. Call `GET /api/source-status`.
3. Confirm `runtimeReady` and `missingRequiredConfig` are present for every source.
4. Call `POST /api/provider-sources/search`.
5. Confirm `audit.activeAdapters` includes `webevidence` when a supported web evidence key is configured.
6. Confirm web evidence candidates are unverified leads, not fake map pins.
7. Set `BROWSE_AI_API_KEY` without `BROWSE_AI_ROBOT_ID` — confirm `runtimeReady: false` and `missingRequiredConfig` lists the missing var.
8. Call `POST /api/browser-extraction/run` with `source: "BrowseAI"` — confirm it returns `runtimeReady: false` when companion config is missing.
9. Call `GET /api/vector-index/status` — confirm Pinecone readiness is reported.
10. Run `pnpm --filter @workspace/scripts smoke:api-sources` to verify readiness logic without real keys.
