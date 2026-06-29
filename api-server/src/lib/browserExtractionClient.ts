import type { ProviderCandidate, CoordinateStatus, TrustTier } from "../providerSources/types";
import { isBrowseAiConfigured, isOlostepConfigured, isBrowserbaseConfigured } from "./apiSourceRegistry";

export interface BrowserExtractionRequest {
  url?: string;
  query?: string;
  city?: string;
  state?: string;
  serviceType?: string;
  limit?: number;
}

export interface ExtractionEvidence {
  url?: string;
  title?: string;
  text?: string;
  source: string;
}

export interface BrowserExtractionResult {
  source: "BrowseAI" | "Browserbase" | "Olostep";
  ok: boolean;
  runtimeReady: boolean;
  missingRequiredConfig: string[];
  candidates: ProviderCandidate[];
  evidence: ExtractionEvidence[];
  error?: string;
}

function isConfigured(envVar: string): boolean {
  return Boolean(process.env[envVar]?.trim());
}

function normalizeString(value: unknown): string {
  return typeof value === "string" ? value.trim() : "";
}

function getTimeoutMs(envVar: string, defaultMs: number): number {
  const val = Number(process.env[envVar]);
  return Number.isFinite(val) && val > 0 ? val : defaultMs;
}

function missingConfigFor(source: string): string[] {
  switch (source) {
    case "BrowseAI": {
      const missing: string[] = [];
      if (!isConfigured("BROWSE_AI_API_KEY")) missing.push("BROWSE_AI_API_KEY");
      if (!isConfigured("BROWSE_AI_ROBOT_ID") && !isConfigured("BROWSE_AI_TASK_ID")) {
        missing.push("BROWSE_AI_ROBOT_ID or BROWSE_AI_TASK_ID");
      }
      return missing;
    }
    case "Olostep": {
      const missing: string[] = [];
      if (!isConfigured("OLOSTEP_API_KEY")) missing.push("OLOSTEP_API_KEY");
      if (!isConfigured("OLOSTEP_BASE_URL")) missing.push("OLOSTEP_BASE_URL");
      return missing;
    }
    case "Browserbase": {
      const missing: string[] = [];
      if (!isConfigured("BROWSERBASE_API_KEY")) missing.push("BROWSERBASE_API_KEY");
      if (!isConfigured("BROWSERBASE_PROJECT_ID") && !isConfigured("BROWSERBASE_BASE_URL")) {
        missing.push("BROWSERBASE_PROJECT_ID or BROWSERBASE_BASE_URL");
      }
      return missing;
    }
    default:
      return [];
  }
}

function makeCandidate(
  source: string,
  evidence: ExtractionEvidence,
  city: string,
  state: string,
  serviceType: string,
  idx: number,
): ProviderCandidate {
  return {
    id: `extract-${source.toLowerCase()}-${idx}-${Date.now()}`,
    name: evidence.title || `Extracted lead ${idx + 1}`,
    address: "",
    city,
    state,
    postalCode: "",
    phone: "",
    website: evidence.url || "",
    coordinateStatus: "unverified" as CoordinateStatus,
    source,
    sourceDetail: `Browser Extraction (${source})`,
    sourceUrl: evidence.url,
    confidence: "low" as const,
    trustTier: "lead" as TrustTier,
    score: 15,
    badges: ["Browser Extraction"],
    evidence: [{
      serviceDetected: serviceType,
      evidenceUrl: evidence.url || "",
      evidenceTextSnippet: (evidence.text || "").slice(0, 1200),
      confidence: 30,
      source,
    }],
    _rawSources: [source.toLowerCase()],
  };
}

// --- Browse AI ---

async function runBrowseAi(req: BrowserExtractionRequest): Promise<BrowserExtractionResult> {
  const apiKey = process.env.BROWSE_AI_API_KEY?.trim();
  const robotId = process.env.BROWSE_AI_ROBOT_ID?.trim();
  const taskId = process.env.BROWSE_AI_TASK_ID?.trim();
  const baseUrl = process.env.BROWSE_AI_BASE_URL?.trim() || "https://api.browse.ai/v2";
  const timeoutMs = getTimeoutMs("BROWSE_AI_TIMEOUT_MS", 30000);

  if (!apiKey || (!robotId && !taskId)) {
    return {
      source: "BrowseAI",
      ok: false,
      runtimeReady: false,
      missingRequiredConfig: missingConfigFor("BrowseAI"),
      candidates: [],
      evidence: [],
    };
  }

  try {
    const endpoint = taskId
      ? `${baseUrl}/tasks/${taskId}/run`
      : `${baseUrl}/robots/${robotId}/run`;

    const response = await fetch(endpoint, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${apiKey}`,
      },
      body: JSON.stringify({
        inputParameters: {
          url: req.url,
          query: req.query,
          city: req.city,
          state: req.state,
          serviceType: req.serviceType,
          limit: req.limit || 20,
        },
      }),
      signal: AbortSignal.timeout(timeoutMs),
    });

    if (!response.ok) {
      return {
        source: "BrowseAI",
        ok: false,
        runtimeReady: true,
        missingRequiredConfig: [],
        candidates: [],
        evidence: [],
        error: `Browse AI API error: ${response.status}`,
      };
    }

    const data = await response.json() as any;
    const rows = Array.isArray(data?.capturedData) ? data.capturedData
      : Array.isArray(data?.results) ? data.results
      : Array.isArray(data?.data) ? data.data
      : [];

    const evidence: ExtractionEvidence[] = rows
      .map((row: any) => ({
        url: normalizeString(row.url || row.link || row.website),
        title: normalizeString(row.title || row.name || row.business_name),
        text: normalizeString(row.text || row.description || row.snippet || row.content),
        source: "BrowseAI",
      }))
      .filter((e: ExtractionEvidence) => e.url || e.title || e.text);

    const candidates = evidence.map((e, idx) =>
      makeCandidate("BrowseAI", e, req.city || "", req.state || "", req.serviceType || "occupational", idx),
    );

    return {
      source: "BrowseAI",
      ok: true,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates,
      evidence,
    };
  } catch (error) {
    return {
      source: "BrowseAI",
      ok: false,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates: [],
      evidence: [],
      error: `Browse AI fetch error: ${String(error)}`,
    };
  }
}

// --- Olostep ---

async function runOlostep(req: BrowserExtractionRequest): Promise<BrowserExtractionResult> {
  const apiKey = process.env.OLOSTEP_API_KEY?.trim();
  const baseUrl = process.env.OLOSTEP_BASE_URL?.trim();
  const timeoutMs = getTimeoutMs("OLOSTEP_TIMEOUT_MS", 30000);

  if (!apiKey || !baseUrl) {
    return {
      source: "Olostep",
      ok: false,
      runtimeReady: false,
      missingRequiredConfig: missingConfigFor("Olostep"),
      candidates: [],
      evidence: [],
    };
  }

  if (!req.url) {
    return {
      source: "Olostep",
      ok: false,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates: [],
      evidence: [],
      error: "Olostep requires a URL to extract.",
    };
  }

  try {
    const url = `${baseUrl.replace(/\/$/, "")}/extract`;
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${apiKey}`,
      },
      body: JSON.stringify({
        url: req.url,
        query: req.query,
        limit: req.limit || 20,
      }),
      signal: AbortSignal.timeout(timeoutMs),
    });

    if (!response.ok) {
      return {
        source: "Olostep",
        ok: false,
        runtimeReady: true,
        missingRequiredConfig: [],
        candidates: [],
        evidence: [],
        error: `Olostep API error: ${response.status}`,
      };
    }

    const data = await response.json() as any;
    const text = normalizeString(data?.text || data?.content || data?.markdown);
    const title = normalizeString(data?.title || data?.name);

    const evidence: ExtractionEvidence[] = text ? [{
      url: req.url,
      title: title || req.url,
      text,
      source: "Olostep",
    }] : [];

    const candidates = evidence.map((e, idx) =>
      makeCandidate("Olostep", e, req.city || "", req.state || "", req.serviceType || "occupational", idx),
    );

    return {
      source: "Olostep",
      ok: true,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates,
      evidence,
    };
  } catch (error) {
    return {
      source: "Olostep",
      ok: false,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates: [],
      evidence: [],
      error: `Olostep fetch error: ${String(error)}`,
    };
  }
}

// --- Browserbase ---

async function runBrowserbase(req: BrowserExtractionRequest): Promise<BrowserExtractionResult> {
  const apiKey = process.env.BROWSERBASE_API_KEY?.trim();
  const projectId = process.env.BROWSERBASE_PROJECT_ID?.trim();
  const baseUrl = process.env.BROWSERBASE_BASE_URL?.trim() || "https://www.browserbase.com/v1";
  const timeoutMs = getTimeoutMs("BROWSERBASE_TIMEOUT_MS", 60000);

  if (!apiKey || (!projectId && !isConfigured("BROWSERBASE_BASE_URL"))) {
    return {
      source: "Browserbase",
      ok: false,
      runtimeReady: false,
      missingRequiredConfig: missingConfigFor("Browserbase"),
      candidates: [],
      evidence: [],
    };
  }

  if (!req.url) {
    return {
      source: "Browserbase",
      ok: false,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates: [],
      evidence: [],
      error: "Browserbase requires a URL to extract.",
    };
  }

  try {
    const sessionsUrl = `${baseUrl.replace(/\/$/, "")}/sessions`;
    const sessionResponse = await fetch(sessionsUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-BB-API-Key": apiKey,
      },
      body: JSON.stringify({
        projectId: projectId || undefined,
      }),
      signal: AbortSignal.timeout(timeoutMs),
    });

    if (!sessionResponse.ok) {
      return {
        source: "Browserbase",
        ok: false,
        runtimeReady: true,
        missingRequiredConfig: [],
        candidates: [],
        evidence: [],
        error: `Browserbase session create error: ${sessionResponse.status}`,
      };
    }

    const session = await sessionResponse.json() as any;
    const sessionId = session?.id || session?.sessionId;

    if (!sessionId) {
      return {
        source: "Browserbase",
        ok: false,
        runtimeReady: true,
        missingRequiredConfig: [],
        candidates: [],
        evidence: [],
        error: "Browserbase did not return a session ID.",
      };
    }

    const navigateUrl = `${baseUrl.replace(/\/$/, "")}/sessions/${sessionId}/navigate`;
    const navResponse = await fetch(navigateUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-BB-API-Key": apiKey,
      },
      body: JSON.stringify({ url: req.url }),
      signal: AbortSignal.timeout(timeoutMs),
    });

    if (!navResponse.ok) {
      return {
        source: "Browserbase",
        ok: false,
        runtimeReady: true,
        missingRequiredConfig: [],
        candidates: [],
        evidence: [],
        error: `Browserbase navigate error: ${navResponse.status}`,
      };
    }

    const contentUrl = `${baseUrl.replace(/\/$/, "")}/sessions/${sessionId}/content`;
    const contentResponse = await fetch(contentUrl, {
      method: "GET",
      headers: { "X-BB-API-Key": apiKey },
      signal: AbortSignal.timeout(timeoutMs),
    });

    if (!contentResponse.ok) {
      return {
        source: "Browserbase",
        ok: false,
        runtimeReady: true,
        missingRequiredConfig: [],
        candidates: [],
        evidence: [],
        error: `Browserbase content fetch error: ${contentResponse.status}`,
      };
    }

    const contentData = await contentResponse.json() as any;
    const text = normalizeString(contentData?.text || contentData?.content || contentData?.markdown);
    const title = normalizeString(contentData?.title);

    const evidence: ExtractionEvidence[] = text ? [{
      url: req.url,
      title: title || req.url,
      text,
      source: "Browserbase",
    }] : [];

    const candidates = evidence.map((e, idx) =>
      makeCandidate("Browserbase", e, req.city || "", req.state || "", req.serviceType || "occupational", idx),
    );

    return {
      source: "Browserbase",
      ok: true,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates,
      evidence,
    };
  } catch (error) {
    return {
      source: "Browserbase",
      ok: false,
      runtimeReady: true,
      missingRequiredConfig: [],
      candidates: [],
      evidence: [],
      error: `Browserbase fetch error: ${String(error)}`,
    };
  }
}

// --- Unified entry point ---

export async function runBrowserExtraction(
  source: "BrowseAI" | "Browserbase" | "Olostep",
  req: BrowserExtractionRequest,
): Promise<BrowserExtractionResult> {
  switch (source) {
    case "BrowseAI":
      return runBrowseAi(req);
    case "Olostep":
      return runOlostep(req);
    case "Browserbase":
      return runBrowserbase(req);
    default:
      return {
        source,
        ok: false,
        runtimeReady: false,
        missingRequiredConfig: [`Unknown source: ${source}`],
        candidates: [],
        evidence: [],
      };
  }
}

export function getBrowserExtractionReadiness() {
  return {
    browseAi: {
      runtimeReady: isBrowseAiConfigured(),
      missingRequiredConfig: missingConfigFor("BrowseAI"),
    },
    olostep: {
      runtimeReady: isOlostepConfigured(),
      missingRequiredConfig: missingConfigFor("Olostep"),
    },
    browserbase: {
      runtimeReady: isBrowserbaseConfigured(),
      missingRequiredConfig: missingConfigFor("Browserbase"),
    },
  };
}
