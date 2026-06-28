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

## Registered but not fully wired yet

These keys are visible through `/api/source-status`, but still need dedicated adapters:

- `BROWSE_AI_API_KEY`
- `OLOSTEP_API_KEY`
- `BROWSERBASE_API_KEY`
- `GEMINI_API_KEY`
- `GROQ_API_KEY`
- `OPENROUTER_KEY`
- `CEREBRAS_API_KEY`
- `HUGGINGFACE_API_KEY`
- `MINIMAX_API_KEY`
- `CLOD_API_KEY`
- `PINECONE_API_KEY`

Follow-up implementation details are documented in:

```text
TODO_API_ADAPTERS.md
```

## Example `/api/source-status` response

```json
{
  "summary": {
    "total": 27,
    "configured": 5,
    "notConfigured": 22,
    "active": 16,
    "configuredNotWired": 4,
    "planned": 0
  },
  "sources": [
    {
      "sourceName": "Exa",
      "envVar": "EXA_API_KEY",
      "configured": true,
      "category": "web_search",
      "adapterStatus": "active",
      "usedBy": ["provider_discovery"]
    }
  ]
}
```

## Testing notes

Recommended checks after deployment:

1. Set at least one web evidence API key.
2. Call `GET /api/source-status`.
3. Call `POST /api/provider-sources/search`.
4. Confirm `audit.activeAdapters` includes `webevidence` when a supported web evidence key is configured.
5. Confirm web evidence candidates are unverified leads, not fake map pins.
6. Confirm registered-but-not-wired keys appear in diagnostics without being claimed as active.
