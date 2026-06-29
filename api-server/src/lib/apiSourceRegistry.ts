export type ApiSourceCategory =
  | "web_search"
  | "web_extraction"
  | "ai_extraction"
  | "geocoding"
  | "vector_index";

export type AdapterStatus = "active" | "configured_not_wired" | "planned";

export type UsedBy = "provider_discovery" | "price_discovery" | "geocoding" | "enrichment" | "indexing";

export interface ApiSourceConfig {
  name: string;
  envVar: string;
  category: ApiSourceCategory;
  adapterStatus: AdapterStatus;
  usedBy: UsedBy[];
  companionEnvVars?: string[];
  runtimeReadyCheck?: () => boolean;
  missingConfigCheck?: () => string[];
  notes?: string;
}

export interface SourceStatusReport {
  sourceName: string;
  envVar: string;
  configured: boolean;
  category: ApiSourceCategory;
  adapterStatus: AdapterStatus;
  usedBy: UsedBy[];
  runtimeReady: boolean;
  missingRequiredConfig: string[];
  notes?: string;
}

function isEnvConfigured(envVar: string): boolean {
  const value = process.env[envVar];
  return value !== undefined && value !== null && value.trim() !== "";
}

function isTruthyFlag(value: string | undefined): boolean {
  return ["1", "true", "yes", "on"].includes(String(value || "").trim().toLowerCase());
}

// --- Runtime-ready checks ---

function rapidApiProviderSearchReady(): boolean {
  return (
    isEnvConfigured("RAPIDAPI_KEY") &&
    isTruthyFlag(process.env.RAPIDAPI_ENABLED) &&
    isTruthyFlag(process.env.RAPIDAPI_PROVIDER_SEARCH_ENABLED) &&
    (isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_URL") || isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_HOST"))
  );
}

function rapidApiProviderSearchMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("RAPIDAPI_KEY")) missing.push("RAPIDAPI_KEY");
  if (!isTruthyFlag(process.env.RAPIDAPI_ENABLED)) missing.push("RAPIDAPI_ENABLED");
  if (!isTruthyFlag(process.env.RAPIDAPI_PROVIDER_SEARCH_ENABLED)) missing.push("RAPIDAPI_PROVIDER_SEARCH_ENABLED");
  if (!isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_URL") && !isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_HOST")) {
    missing.push("RAPIDAPI_PROVIDER_SEARCH_URL or RAPIDAPI_PROVIDER_SEARCH_HOST");
  }
  return missing;
}

function browseAiReady(): boolean {
  return (
    isEnvConfigured("BROWSE_AI_API_KEY") &&
    (isEnvConfigured("BROWSE_AI_ROBOT_ID") || isEnvConfigured("BROWSE_AI_TASK_ID"))
  );
}

function browseAiMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("BROWSE_AI_API_KEY")) missing.push("BROWSE_AI_API_KEY");
  if (!isEnvConfigured("BROWSE_AI_ROBOT_ID") && !isEnvConfigured("BROWSE_AI_TASK_ID")) {
    missing.push("BROWSE_AI_ROBOT_ID or BROWSE_AI_TASK_ID");
  }
  return missing;
}

function olostepReady(): boolean {
  return isEnvConfigured("OLOSTEP_API_KEY") && isEnvConfigured("OLOSTEP_BASE_URL");
}

function olostepMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("OLOSTEP_API_KEY")) missing.push("OLOSTEP_API_KEY");
  if (!isEnvConfigured("OLOSTEP_BASE_URL")) missing.push("OLOSTEP_BASE_URL");
  return missing;
}

function browserbaseReady(): boolean {
  return (
    isEnvConfigured("BROWSERBASE_API_KEY") &&
    (isEnvConfigured("BROWSERBASE_PROJECT_ID") || isEnvConfigured("BROWSERBASE_BASE_URL"))
  );
}

function browserbaseMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("BROWSERBASE_API_KEY")) missing.push("BROWSERBASE_API_KEY");
  if (!isEnvConfigured("BROWSERBASE_PROJECT_ID") && !isEnvConfigured("BROWSERBASE_BASE_URL")) {
    missing.push("BROWSERBASE_PROJECT_ID or BROWSERBASE_BASE_URL");
  }
  return missing;
}

function pineconeReady(): boolean {
  return isEnvConfigured("PINECONE_API_KEY") && isEnvConfigured("PINECONE_INDEX_HOST");
}

function pineconeMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("PINECONE_API_KEY")) missing.push("PINECONE_API_KEY");
  if (!isEnvConfigured("PINECONE_INDEX_HOST")) missing.push("PINECONE_INDEX_HOST");
  return missing;
}

function clodReady(): boolean {
  return (
    isEnvConfigured("CLOD_API_KEY") &&
    isEnvConfigured("CLOD_API_BASE_URL") &&
    isEnvConfigured("CLOD_EXTRACTION_MODEL")
  );
}

function clodMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("CLOD_API_KEY")) missing.push("CLOD_API_KEY");
  if (!isEnvConfigured("CLOD_API_BASE_URL")) missing.push("CLOD_API_BASE_URL");
  if (!isEnvConfigured("CLOD_EXTRACTION_MODEL")) missing.push("CLOD_EXTRACTION_MODEL");
  return missing;
}

function minimaxReady(): boolean {
  return isEnvConfigured("MINIMAX_API_KEY") && isEnvConfigured("MINIMAX_API_BASE_URL");
}

function minimaxMissing(): string[] {
  const missing: string[] = [];
  if (!isEnvConfigured("MINIMAX_API_KEY")) missing.push("MINIMAX_API_KEY");
  if (!isEnvConfigured("MINIMAX_API_BASE_URL")) missing.push("MINIMAX_API_BASE_URL");
  return missing;
}

// Registry of API sources with their categorization and current wiring status.
const API_SOURCE_REGISTRY: ApiSourceConfig[] = [
  // Web search / web evidence. These are called by the unified webEvidence adapter.
  {
    name: "LangSearch",
    envVar: "LANGSEARCH_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "price_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("LANGSEARCH_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("LANGSEARCH_API_KEY") ? [] : ["LANGSEARCH_API_KEY"],
  },
  {
    name: "Serper",
    envVar: "SERPER_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("SERPER_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("SERPER_API_KEY") ? [] : ["SERPER_API_KEY"],
  },
  {
    name: "Tavily",
    envVar: "TAVILY_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("TAVILY_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("TAVILY_API_KEY") ? [] : ["TAVILY_API_KEY"],
  },
  {
    name: "Exa",
    envVar: "EXA_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("EXA_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("EXA_API_KEY") ? [] : ["EXA_API_KEY"],
  },

  // Web extraction / browser automation.
  {
    name: "Firecrawl",
    envVar: "FIRECRAWL_API_KEY",
    category: "web_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "price_discovery", "enrichment"],
    runtimeReadyCheck: () => isEnvConfigured("FIRECRAWL_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("FIRECRAWL_API_KEY") ? [] : ["FIRECRAWL_API_KEY"],
  },
  {
    name: "Browse AI",
    envVar: "BROWSE_AI_API_KEY",
    category: "web_extraction",
    adapterStatus: "active",
    usedBy: ["enrichment"],
    companionEnvVars: ["BROWSE_AI_ROBOT_ID", "BROWSE_AI_TASK_ID", "BROWSE_AI_BASE_URL", "BROWSE_AI_TIMEOUT_MS"],
    runtimeReadyCheck: browseAiReady,
    missingConfigCheck: browseAiMissing,
    notes: "Requires BROWSE_AI_ROBOT_ID or BROWSE_AI_TASK_ID to run extraction jobs.",
  },
  {
    name: "Olostep",
    envVar: "OLOSTEP_API_KEY",
    category: "web_extraction",
    adapterStatus: "active",
    usedBy: ["enrichment"],
    companionEnvVars: ["OLOSTEP_BASE_URL", "OLOSTEP_TIMEOUT_MS"],
    runtimeReadyCheck: olostepReady,
    missingConfigCheck: olostepMissing,
    notes: "Requires OLOSTEP_BASE_URL because no verified default endpoint is known.",
  },
  {
    name: "Browserbase",
    envVar: "BROWSERBASE_API_KEY",
    category: "web_extraction",
    adapterStatus: "active",
    usedBy: ["enrichment"],
    companionEnvVars: ["BROWSERBASE_PROJECT_ID", "BROWSERBASE_BASE_URL", "BROWSERBASE_TIMEOUT_MS"],
    runtimeReadyCheck: browserbaseReady,
    missingConfigCheck: browserbaseMissing,
    notes: "Requires BROWSERBASE_PROJECT_ID or BROWSERBASE_BASE_URL to create sessions.",
  },

  // AI extraction / summarization / ranking.
  {
    name: "Gemini",
    envVar: "GEMINI_API_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    runtimeReadyCheck: () => isEnvConfigured("GEMINI_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("GEMINI_API_KEY") ? [] : ["GEMINI_API_KEY"],
  },
  {
    name: "Groq",
    envVar: "GROQ_API_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    runtimeReadyCheck: () => isEnvConfigured("GROQ_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("GROQ_API_KEY") ? [] : ["GROQ_API_KEY"],
  },
  {
    name: "OpenRouter",
    envVar: "OPENROUTER_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    runtimeReadyCheck: () => isEnvConfigured("OPENROUTER_KEY"),
    missingConfigCheck: () => isEnvConfigured("OPENROUTER_KEY") ? [] : ["OPENROUTER_KEY"],
  },
  {
    name: "Cerebras",
    envVar: "CEREBRAS_API_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    runtimeReadyCheck: () => isEnvConfigured("CEREBRAS_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("CEREBRAS_API_KEY") ? [] : ["CEREBRAS_API_KEY"],
  },
  {
    name: "HuggingFace",
    envVar: "HUGGINGFACE_API_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    runtimeReadyCheck: () => isEnvConfigured("HUGGINGFACE_API_KEY"),
    missingConfigCheck: () => isEnvConfigured("HUGGINGFACE_API_KEY") ? [] : ["HUGGINGFACE_API_KEY"],
  },
  {
    name: "Minimax",
    envVar: "MINIMAX_API_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    companionEnvVars: ["MINIMAX_API_BASE_URL", "MINIMAX_EXTRACTION_MODEL"],
    runtimeReadyCheck: minimaxReady,
    missingConfigCheck: minimaxMissing,
    notes: "Requires MINIMAX_API_BASE_URL to call the API.",
  },
  {
    name: "Clod",
    envVar: "CLOD_API_KEY",
    category: "ai_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "enrichment"],
    companionEnvVars: ["CLOD_API_BASE_URL", "CLOD_EXTRACTION_MODEL"],
    runtimeReadyCheck: clodReady,
    missingConfigCheck: clodMissing,
    notes: "Requires CLOD_API_BASE_URL and CLOD_EXTRACTION_MODEL because endpoint is self-hosted.",
  },

  // Geocoding / map / distance.
  {
    name: "Geocodio Primary",
    envVar: "GEOCODIO_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isEnvConfigured("GEOCODIO_TOKEN"),
    missingConfigCheck: () => isEnvConfigured("GEOCODIO_TOKEN") ? [] : ["GEOCODIO_TOKEN"],
  },
  {
    name: "Geocodio Secondary",
    envVar: "GEOCODIO_SECONDARY_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isEnvConfigured("GEOCODIO_SECONDARY_TOKEN"),
    missingConfigCheck: () => isEnvConfigured("GEOCODIO_SECONDARY_TOKEN") ? [] : ["GEOCODIO_SECONDARY_TOKEN"],
  },
  {
    name: "Geocodio Tertiary",
    envVar: "GEOCODIO_TERTIARY_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isEnvConfigured("GEOCODIO_TERTIARY_TOKEN"),
    missingConfigCheck: () => isEnvConfigured("GEOCODIO_TERTIARY_TOKEN") ? [] : ["GEOCODIO_TERTIARY_TOKEN"],
  },
  {
    name: "Geocodio Quaternary",
    envVar: "GEOCODIO_QUATERNARY_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isEnvConfigured("GEOCODIO_QUATERNARY_TOKEN"),
    missingConfigCheck: () => isEnvConfigured("GEOCODIO_QUATERNARY_TOKEN") ? [] : ["GEOCODIO_QUATERNARY_TOKEN"],
  },
  {
    name: "RapidAPI Key",
    envVar: "RAPIDAPI_KEY",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding", "provider_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("RAPIDAPI_KEY"),
    missingConfigCheck: () => isEnvConfigured("RAPIDAPI_KEY") ? [] : ["RAPIDAPI_KEY"],
  },
  {
    name: "RapidAPI Enabled",
    envVar: "RAPIDAPI_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding", "provider_discovery"],
    runtimeReadyCheck: () => isTruthyFlag(process.env.RAPIDAPI_ENABLED),
    missingConfigCheck: () => isTruthyFlag(process.env.RAPIDAPI_ENABLED) ? [] : ["RAPIDAPI_ENABLED"],
  },
  {
    name: "RapidAPI Geocoding",
    envVar: "RAPIDAPI_GEOCODING_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isTruthyFlag(process.env.RAPIDAPI_GEOCODING_ENABLED),
    missingConfigCheck: () => isTruthyFlag(process.env.RAPIDAPI_GEOCODING_ENABLED) ? [] : ["RAPIDAPI_GEOCODING_ENABLED"],
  },
  {
    name: "RapidAPI Location Lookup",
    envVar: "RAPIDAPI_LOCATION_LOOKUP_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isTruthyFlag(process.env.RAPIDAPI_LOCATION_LOOKUP_ENABLED),
    missingConfigCheck: () => isTruthyFlag(process.env.RAPIDAPI_LOCATION_LOOKUP_ENABLED) ? [] : ["RAPIDAPI_LOCATION_LOOKUP_ENABLED"],
  },
  {
    name: "RapidAPI Map Display",
    envVar: "RAPIDAPI_MAP_DISPLAY_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isTruthyFlag(process.env.RAPIDAPI_MAP_DISPLAY_ENABLED),
    missingConfigCheck: () => isTruthyFlag(process.env.RAPIDAPI_MAP_DISPLAY_ENABLED) ? [] : ["RAPIDAPI_MAP_DISPLAY_ENABLED"],
  },
  {
    name: "RapidAPI Provider Search",
    envVar: "RAPIDAPI_PROVIDER_SEARCH_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    companionEnvVars: ["RAPIDAPI_KEY", "RAPIDAPI_ENABLED", "RAPIDAPI_PROVIDER_SEARCH_URL", "RAPIDAPI_PROVIDER_SEARCH_HOST", "RAPIDAPI_PROVIDER_SEARCH_PATH", "RAPIDAPI_PROVIDER_SEARCH_TIMEOUT_MS"],
    runtimeReadyCheck: rapidApiProviderSearchReady,
    missingConfigCheck: rapidApiProviderSearchMissing,
    notes: "RapidAPI is a marketplace. RAPIDAPI_KEY alone is not enough. A concrete provider-search endpoint URL or host must be configured.",
  },
  {
    name: "RapidAPI Routing Distance",
    envVar: "RAPIDAPI_ROUTING_DISTANCE_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
    runtimeReadyCheck: () => isTruthyFlag(process.env.RAPIDAPI_ROUTING_DISTANCE_ENABLED),
    missingConfigCheck: () => isTruthyFlag(process.env.RAPIDAPI_ROUTING_DISTANCE_ENABLED) ? [] : ["RAPIDAPI_ROUTING_DISTANCE_ENABLED"],
  },
  {
    name: "RapidAPI Provider Search URL",
    envVar: "RAPIDAPI_PROVIDER_SEARCH_URL",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_URL") || isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_HOST"),
    missingConfigCheck: () => (isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_URL") || isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_HOST")) ? [] : ["RAPIDAPI_PROVIDER_SEARCH_URL or RAPIDAPI_PROVIDER_SEARCH_HOST"],
  },
  {
    name: "RapidAPI Provider Search Host",
    envVar: "RAPIDAPI_PROVIDER_SEARCH_HOST",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_URL") || isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_HOST"),
    missingConfigCheck: () => (isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_URL") || isEnvConfigured("RAPIDAPI_PROVIDER_SEARCH_HOST")) ? [] : ["RAPIDAPI_PROVIDER_SEARCH_URL or RAPIDAPI_PROVIDER_SEARCH_HOST"],
  },
  {
    name: "RapidAPI Provider Search Path",
    envVar: "RAPIDAPI_PROVIDER_SEARCH_PATH",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => true,
    missingConfigCheck: () => [],
    notes: "Optional. Defaults to /search if not set.",
  },
  {
    name: "RapidAPI Provider Search Timeout",
    envVar: "RAPIDAPI_PROVIDER_SEARCH_TIMEOUT_MS",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
    runtimeReadyCheck: () => true,
    missingConfigCheck: () => [],
    notes: "Optional. Defaults to 8000ms.",
  },

  // Vector / semantic index.
  {
    name: "Pinecone",
    envVar: "PINECONE_API_KEY",
    category: "vector_index",
    adapterStatus: "active",
    usedBy: ["indexing"],
    companionEnvVars: ["PINECONE_INDEX_HOST", "PINECONE_NAMESPACE", "PINECONE_TIMEOUT_MS"],
    runtimeReadyCheck: pineconeReady,
    missingConfigCheck: pineconeMissing,
    notes: "Requires PINECONE_INDEX_HOST to connect to a specific index.",
  },
];

/**
 * Get the full source status report.
 * Returns safe diagnostic information without exposing secret values.
 */
export function getSourceStatusReport(): SourceStatusReport[] {
  return API_SOURCE_REGISTRY.map((config) => {
    const configured = isEnvConfigured(config.envVar);
    const runtimeReady = config.runtimeReadyCheck ? config.runtimeReadyCheck() : configured;
    const missingRequiredConfig = config.missingConfigCheck
      ? config.missingConfigCheck()
      : configured ? [] : [config.envVar];
    return {
      sourceName: config.name,
      envVar: config.envVar,
      configured,
      category: config.category,
      adapterStatus: config.adapterStatus,
      usedBy: config.usedBy,
      runtimeReady,
      missingRequiredConfig,
      notes: config.notes,
    };
  });
}

/**
 * Get sources by category
 */
export function getSourcesByCategory(category: ApiSourceCategory): SourceStatusReport[] {
  return getSourceStatusReport().filter((s) => s.category === category);
}

/**
 * Get configured sources by category
 */
export function getConfiguredSourcesByCategory(category: ApiSourceCategory): SourceStatusReport[] {
  return getSourcesByCategory(category).filter((s) => s.configured);
}

/**
 * Get sources by usage context
 */
export function getSourcesByUsage(usage: UsedBy): SourceStatusReport[] {
  return getSourceStatusReport().filter((s) => s.usedBy.includes(usage));
}

/**
 * Get configured sources by usage context
 */
export function getConfiguredSourcesByUsage(usage: UsedBy): SourceStatusReport[] {
  return getSourcesByUsage(usage).filter((s) => s.configured);
}

/**
 * Check if RapidAPI provider search is fully configured
 */
export function isRapidApiProviderSearchConfigured(): boolean {
  return rapidApiProviderSearchReady();
}

/**
 * Check if Browse AI is fully configured
 */
export function isBrowseAiConfigured(): boolean {
  return browseAiReady();
}

/**
 * Check if Olostep is fully configured
 */
export function isOlostepConfigured(): boolean {
  return olostepReady();
}

/**
 * Check if Browserbase is fully configured
 */
export function isBrowserbaseConfigured(): boolean {
  return browserbaseReady();
}

/**
 * Check if Pinecone vector index is fully configured
 */
export function isPineconeConfigured(): boolean {
  return pineconeReady();
}
