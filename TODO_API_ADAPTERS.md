# API Adapter Roadmap

This document keeps the unified API source work honest.

The app can now report all configured API keys through `/api/source-status`, but a key being present does not mean the API is fully used everywhere. The source registry must distinguish between:

- `active`: real code currently calls this API.
- `configured_not_wired`: the key is visible in diagnostics, but there is no dedicated adapter yet.
- `planned`: intentionally listed for later implementation.

## Active in PR #43

### Provider discovery / web evidence

These sources are called by the backend-only unified web evidence adapter:

- `LANGSEARCH_API_KEY` — LangSearch web evidence via the shared `langSearchClient.ts` client.
- `SERPER_API_KEY` — Serper web evidence search.
- `TAVILY_API_KEY` — Tavily web evidence search.
- `EXA_API_KEY` — Exa web evidence search.
- `FIRECRAWL_API_KEY` — Firecrawl search used as a web evidence source. Deeper page extraction is still follow-up work.

These results must remain low-trust leads:

- `trustTier: "lead"`
- `coordinateStatus: "unverified"`
- evidence/list-only until independently geocoded and verified

### Price discovery

- `LANGSEARCH_API_KEY` is currently used by `/api/price-discovery/run` for open-web price discovery.
- Price records are saved only when a dollar amount is extracted.
- Weak web leads are not attached to existing providers through generic name/state matching unless they have NPI or address + ZIP.

### Geocoding / provider search

- `GEOCODIO_TOKEN`
- `GEOCODIO_SECONDARY_TOKEN`
- `GEOCODIO_TERTIARY_TOKEN`
- `GEOCODIO_QUATERNARY_TOKEN`
- `RAPIDAPI_KEY`
- `RAPIDAPI_ENABLED`
- `RAPIDAPI_PROVIDER_SEARCH_ENABLED`
- `RAPIDAPI_GEOCODING_ENABLED`
- `RAPIDAPI_LOCATION_LOOKUP_ENABLED`
- `RAPIDAPI_MAP_DISPLAY_ENABLED`
- `RAPIDAPI_ROUTING_DISTANCE_ENABLED`

RapidAPI provider search is routed by the orchestrator only when the required key and enable flags are set.

## Registered but not fully wired yet

These env vars are tracked by the registry and visible in `/api/source-status`, but need dedicated adapters before being considered fully integrated.

### Browse AI

Env var:

- `BROWSE_AI_API_KEY`

Intended use:

- Repeatable directory extraction workflows.
- Sites where a Browse AI robot has already been trained.
- Batch ingestion/enrichment, not live map rendering.

Needed adapter:

- Robot/run invocation adapter.
- Result normalization into provider evidence or CSV import rows.
- Job tracking so browser automation does not block interactive searches.

### Olostep

Env var:

- `OLOSTEP_API_KEY`

Intended use:

- Browser/page extraction for difficult websites.
- Pricing page extraction.
- Directory enrichment when simple search snippets are insufficient.

Needed adapter:

- Page fetch/extraction client.
- Timeout and retry controls.
- Evidence persistence into provider or price evidence tables.

### Browserbase

Env var:

- `BROWSERBASE_API_KEY`

Intended use:

- Managed browser sessions.
- JavaScript-heavy provider directories.
- Batch workflows, not normal user-facing search.

Needed adapter:

- Session lifecycle helper.
- Browser task runner.
- Output normalization into provider evidence or ingestion rows.

### AI extraction / ranking providers

Env vars:

- `GEMINI_API_KEY`
- `GROQ_API_KEY`
- `OPENROUTER_KEY`
- `CEREBRAS_API_KEY`
- `HUGGINGFACE_API_KEY`
- `MINIMAX_API_KEY`
- `CLOD_API_KEY`

Intended use:

- Extract provider names, addresses, services, hours, and prices from page text.
- Summarize evidence.
- Rank provider confidence.
- Categorize whether a page proves occupational-health services.

Needed adapter:

- Shared extraction interface.
- Provider/price extraction schemas.
- Strict JSON output validation.
- No direct map pins from model output alone.

### Pinecone

Env var:

- `PINECONE_API_KEY`

Intended use:

- Semantic evidence indexing.
- Similar-provider search.
- Retrieval over saved provider evidence and price evidence.

Needed adapter:

- Vector index client.
- Embedding pipeline.
- Evidence chunking and upsert job.
- Retrieval endpoint for enrichment/search assistance.

## Non-goals

Do not use any of these APIs to replace:

- NPI registry source
- FMCSA source
- imported clinic database flow
- map inventory loading from Neon
- provider dedupe/scoring/geocoding rules
- existing frontend behavior

All API-backed evidence should feed the backend normalization, evidence, scoring, and persistence pipeline.
