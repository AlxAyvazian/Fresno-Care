# API Adapter Roadmap

This document keeps the unified API source work honest.

The app reports all configured API keys through `/api/source-status`, including `runtimeReady` and `missingRequiredConfig` for each source. A key being present does not mean the API is fully ready to run. The source registry distinguishes between:

- `configured: true` — the env var has a non-empty value.
- `runtimeReady: true` — all required companion config is also present and the adapter can actually run.
- `adapterStatus: "active"` — real code currently calls this API.
- `adapterStatus: "configured_not_wired"` — the key is visible in diagnostics, but no dedicated adapter consumes it yet.

## Active in PR #43

### Provider discovery / web evidence

These sources are called by the backend-only unified web evidence adapter:

- `LANGSEARCH_API_KEY` — LangSearch web evidence via the shared `langSearchClient.ts` client.
- `SERPER_API_KEY` — Serper web evidence search.
- `TAVILY_API_KEY` — Tavily web evidence search.
- `EXA_API_KEY` — Exa web evidence search.
- `FIRECRAWL_API_KEY` — Firecrawl search used as a web evidence source. Deeper page extraction is still follow-up work.

These results remain low-trust leads:

- `trustTier: "lead"`
- `coordinateStatus: "unverified"`
- evidence/list-only until independently geocoded and verified

### AI evidence enrichment

These providers are called by `aiExtractionClient.ts` from `webEvidence.ts` for capped low-cost evidence enrichment:

- `GEMINI_API_KEY` — Gemini extraction (runtime-ready with key only).
- `GROQ_API_KEY` — Groq extraction (runtime-ready with key only).
- `OPENROUTER_KEY` — OpenRouter extraction (runtime-ready with key only).
- `CEREBRAS_API_KEY` — Cerebras extraction (runtime-ready with key only).
- `HUGGINGFACE_API_KEY` — HuggingFace extraction (runtime-ready with key only).
- `MINIMAX_API_KEY` — MiniMax extraction (requires `MINIMAX_API_BASE_URL` companion config).
- `CLOD_API_KEY` — Clod extraction (requires `CLOD_API_BASE_URL` and `CLOD_EXTRACTION_MODEL` companion config).

### Price discovery

- `LANGSEARCH_API_KEY` is currently used by `/api/price-discovery/run` for open-web price discovery.
- Price records are saved only when a dollar amount is extracted.
- Weak web leads are not attached to existing providers through generic name/state matching unless they have NPI or address + ZIP.

### Geocoding / provider search

- `GEOCODIO_TOKEN`
- `GEOCODIO_SECONDARY_TOKEN`
- `GEOCODIO_TERTIARY_TOKEN`
- `GEOCODIO_QUATERNARY_TOKEN`
- `RAPIDAPI_KEY` + `RAPIDAPI_ENABLED` + `RAPIDAPI_PROVIDER_SEARCH_ENABLED` + endpoint config

RapidAPI provider search is routed by the orchestrator only when the required key, enable flags, and endpoint URL or host are all set.

### Browser/page extraction

These adapters are implemented in `browserExtractionClient.ts` and exposed via `POST /api/browser-extraction/run`:

- `BROWSE_AI_API_KEY` — Browse AI robot/task extraction (requires `BROWSE_AI_ROBOT_ID` or `BROWSE_AI_TASK_ID`).
- `OLOSTEP_API_KEY` — Olostep page extraction (requires `OLOSTEP_BASE_URL`).
- `BROWSERBASE_API_KEY` — Browserbase managed browser sessions (requires `BROWSERBASE_PROJECT_ID` or `BROWSERBASE_BASE_URL`).

These are background/directory extraction workflows. They do not run during normal live provider search. Results are low-trust leads.

### Vector indexing

- `PINECONE_API_KEY` — Pinecone vector index client (requires `PINECONE_INDEX_HOST`).

Implemented in `vectorIndexClient.ts` and exposed via `POST /api/vector-index/upsert` and `POST /api/vector-index/query`.

The client accepts pre-computed vectors only. If records lack `values`, the client returns a clear error: "Embedding provider not configured." No fake embeddings are generated.

## Configured but not runtime-ready

Some APIs require companion configuration beyond just the API key. `/api/source-status` exposes exactly what is missing:

- **Browse AI** requires `BROWSE_AI_ROBOT_ID` or `BROWSE_AI_TASK_ID`.
- **Olostep** requires `OLOSTEP_BASE_URL` (no verified default endpoint is known).
- **Browserbase** requires `BROWSERBASE_PROJECT_ID` or `BROWSERBASE_BASE_URL`.
- **Pinecone** requires `PINECONE_INDEX_HOST`.
- **RapidAPI provider search** requires `RAPIDAPI_PROVIDER_SEARCH_URL` or `RAPIDAPI_PROVIDER_SEARCH_HOST`.
- **Clod** requires `CLOD_API_BASE_URL` and `CLOD_EXTRACTION_MODEL`.
- **MiniMax** requires `MINIMAX_API_BASE_URL`.

## Non-goals

Do not use any of these APIs to replace:

- NPI registry source
- FMCSA source
- imported clinic database flow
- map inventory loading from Neon
- provider dedupe/scoring/geocoding rules
- existing frontend behavior

All API-backed evidence should feed the backend normalization, evidence, scoring, and persistence pipeline.
