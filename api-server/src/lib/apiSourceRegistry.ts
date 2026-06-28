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
}

export interface SourceStatusReport {
  sourceName: string;
  envVar: string;
  configured: boolean;
  category: ApiSourceCategory;
  adapterStatus: AdapterStatus;
  usedBy: UsedBy[];
}

// Registry of API sources with their categorization and current wiring status.
// Keep this honest: "active" means code currently calls the API; "configured_not_wired"
// means the env var is visible in diagnostics but no adapter consumes it yet.
const API_SOURCE_REGISTRY: ApiSourceConfig[] = [
  // Web search / web evidence. These are called by the unified webEvidence adapter.
  {
    name: "LangSearch",
    envVar: "LANGSEARCH_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "price_discovery"],
  },
  {
    name: "Serper",
    envVar: "SERPER_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
  },
  {
    name: "Tavily",
    envVar: "TAVILY_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
  },
  {
    name: "Exa",
    envVar: "EXA_API_KEY",
    category: "web_search",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
  },

  // Web extraction / browser automation.
  // Firecrawl is active through webEvidence search; deeper extraction is follow-up.
  {
    name: "Firecrawl",
    envVar: "FIRECRAWL_API_KEY",
    category: "web_extraction",
    adapterStatus: "active",
    usedBy: ["provider_discovery", "price_discovery", "enrichment"],
  },
  {
    name: "Browse AI",
    envVar: "BROWSE_AI_API_KEY",
    category: "web_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["price_discovery", "enrichment"],
  },
  {
    name: "Olostep",
    envVar: "OLOSTEP_API_KEY",
    category: "web_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["price_discovery", "enrichment"],
  },
  {
    name: "Browserbase",
    envVar: "BROWSERBASE_API_KEY",
    category: "web_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["price_discovery", "enrichment"],
  },

  // AI extraction / summarization / ranking.
  {
    name: "Gemini",
    envVar: "GEMINI_API_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },
  {
    name: "Groq",
    envVar: "GROQ_API_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },
  {
    name: "OpenRouter",
    envVar: "OPENROUTER_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },
  {
    name: "Cerebras",
    envVar: "CEREBRAS_API_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },
  {
    name: "HuggingFace",
    envVar: "HUGGINGFACE_API_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },
  {
    name: "Minimax",
    envVar: "MINIMAX_API_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },
  {
    name: "Clod",
    envVar: "CLOD_API_KEY",
    category: "ai_extraction",
    adapterStatus: "configured_not_wired",
    usedBy: ["enrichment"],
  },

  // Geocoding / map / distance.
  {
    name: "Geocodio Primary",
    envVar: "GEOCODIO_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "Geocodio Secondary",
    envVar: "GEOCODIO_SECONDARY_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "Geocodio Tertiary",
    envVar: "GEOCODIO_TERTIARY_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "Geocodio Quaternary",
    envVar: "GEOCODIO_QUATERNARY_TOKEN",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "RapidAPI Key",
    envVar: "RAPIDAPI_KEY",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding", "provider_discovery"],
  },
  {
    name: "RapidAPI Enabled",
    envVar: "RAPIDAPI_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding", "provider_discovery"],
  },
  {
    name: "RapidAPI Geocoding",
    envVar: "RAPIDAPI_GEOCODING_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "RapidAPI Location Lookup",
    envVar: "RAPIDAPI_LOCATION_LOOKUP_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "RapidAPI Map Display",
    envVar: "RAPIDAPI_MAP_DISPLAY_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },
  {
    name: "RapidAPI Provider Search",
    envVar: "RAPIDAPI_PROVIDER_SEARCH_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["provider_discovery"],
  },
  {
    name: "RapidAPI Routing Distance",
    envVar: "RAPIDAPI_ROUTING_DISTANCE_ENABLED",
    category: "geocoding",
    adapterStatus: "active",
    usedBy: ["geocoding"],
  },

  // Vector / semantic index.
  {
    name: "Pinecone",
    envVar: "PINECONE_API_KEY",
    category: "vector_index",
    adapterStatus: "configured_not_wired",
    usedBy: ["indexing"],
  },
];

/**
 * Check if an environment variable is configured (non-empty)
 */
function isEnvConfigured(envVar: string): boolean {
  const value = process.env[envVar];
  return value !== undefined && value !== null && value.trim() !== "";
}

/**
 * Get the full source status report.
 * Returns safe diagnostic information without exposing secret values.
 */
export function getSourceStatusReport(): SourceStatusReport[] {
  return API_SOURCE_REGISTRY.map((config) => ({
    sourceName: config.name,
    envVar: config.envVar,
    configured: isEnvConfigured(config.envVar),
    category: config.category,
    adapterStatus: config.adapterStatus,
    usedBy: config.usedBy,
  }));
}

/**
 * Get sources by category
 */
export function getSourcesByCategory(category: ApiSourceCategory): SourceStatusReport[] {
  return getSourceStatusReport().filter((s) => s.category === category);
}
