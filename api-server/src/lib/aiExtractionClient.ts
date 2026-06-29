export type AiExtractionTask = "provider_evidence" | "price_evidence";

export interface AiExtractionRequest {
  task: AiExtractionTask;
  title?: string;
  url?: string;
  text: string;
  serviceType?: string;
  timeoutMs?: number;
}

export interface AiExtractionResult {
  providerName?: string;
  address?: string;
  phone?: string;
  website?: string;
  services?: string[];
  priceMentions?: Array<{ service?: string; min?: number; max?: number; currency?: string; text?: string }>;
  summary?: string;
  confidence?: number;
  source: string;
}

type AiProvider = {
  name: string;
  envVar: string;
  extract: (request: AiExtractionRequest) => Promise<AiExtractionResult | null>;
};

function isConfigured(envVar: string): boolean {
  return Boolean(process.env[envVar]?.trim());
}

function timeoutMs(request?: AiExtractionRequest): number {
  return Number(request?.timeoutMs || process.env.AI_EXTRACTION_TIMEOUT_MS || 6000);
}

function clampInput(text: string): string {
  return String(text || "").slice(0, Number(process.env.AI_EXTRACTION_MAX_CHARS || 6000));
}

function buildPrompt(request: AiExtractionRequest): string {
  return [
    "Extract structured occupational-health provider evidence from the text below.",
    "Return only valid JSON with these optional fields:",
    "providerName, address, phone, website, services, priceMentions, summary, confidence.",
    "Do not invent missing data. Use null or omit fields when not present.",
    "confidence must be a number from 0 to 100.",
    `Task: ${request.task}`,
    `Service type: ${request.serviceType || "unknown"}`,
    `URL: ${request.url || "unknown"}`,
    `Title: ${request.title || "unknown"}`,
    "Text:",
    clampInput(request.text),
  ].join("\n");
}

function extractJson(text: string): Record<string, unknown> | null {
  const raw = String(text || "").trim();
  if (!raw) return null;

  const fenced = raw.match(/```(?:json)?\s*([\s\S]*?)```/i)?.[1];
  const candidate = fenced || raw.match(/\{[\s\S]*\}/)?.[0] || raw;

  try {
    const parsed = JSON.parse(candidate);
    return parsed && typeof parsed === "object" ? parsed as Record<string, unknown> : null;
  } catch {
    return null;
  }
}

function normalizeString(value: unknown): string | undefined {
  return typeof value === "string" && value.trim() ? value.trim() : undefined;
}

function normalizeNumber(value: unknown): number | undefined {
  const num = typeof value === "number" ? value : Number(value);
  return Number.isFinite(num) ? Math.max(0, Math.min(100, num)) : undefined;
}

function normalizeStringArray(value: unknown): string[] | undefined {
  if (!Array.isArray(value)) return undefined;
  const strings = value.map(normalizeString).filter((v): v is string => Boolean(v));
  return strings.length ? strings.slice(0, 12) : undefined;
}

function normalizeExtraction(source: string, parsed: Record<string, unknown> | null): AiExtractionResult | null {
  if (!parsed) return null;

  const priceMentions = Array.isArray(parsed.priceMentions)
    ? parsed.priceMentions
        .filter((item): item is Record<string, unknown> => Boolean(item) && typeof item === "object")
        .slice(0, 12)
        .map((item) => ({
          service: normalizeString(item.service),
          min: typeof item.min === "number" ? item.min : Number.isFinite(Number(item.min)) ? Number(item.min) : undefined,
          max: typeof item.max === "number" ? item.max : Number.isFinite(Number(item.max)) ? Number(item.max) : undefined,
          currency: normalizeString(item.currency),
          text: normalizeString(item.text),
        }))
    : undefined;

  const result: AiExtractionResult = {
    providerName: normalizeString(parsed.providerName),
    address: normalizeString(parsed.address),
    phone: normalizeString(parsed.phone),
    website: normalizeString(parsed.website),
    services: normalizeStringArray(parsed.services),
    priceMentions,
    summary: normalizeString(parsed.summary),
    confidence: normalizeNumber(parsed.confidence),
    source,
  };

  if (!result.providerName && !result.address && !result.phone && !result.website && !result.summary && !result.services?.length && !result.priceMentions?.length) {
    return null;
  }

  return result;
}

async function callOpenAiCompatible(args: {
  source: string;
  apiKey: string;
  baseUrl: string;
  model: string;
  request: AiExtractionRequest;
}): Promise<AiExtractionResult | null> {
  const response = await fetch(`${args.baseUrl.replace(/\/$/, "")}/chat/completions`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${args.apiKey}`,
    },
    body: JSON.stringify({
      model: args.model,
      temperature: 0,
      response_format: { type: "json_object" },
      messages: [
        { role: "system", content: "You extract provider evidence. Return valid JSON only." },
        { role: "user", content: buildPrompt(args.request) },
      ],
    }),
    signal: AbortSignal.timeout(timeoutMs(args.request)),
  });

  if (!response.ok) return null;
  const data = await response.json() as any;
  const content = data?.choices?.[0]?.message?.content;
  return normalizeExtraction(args.source, extractJson(content));
}

async function extractWithGroq(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.GROQ_API_KEY?.trim();
  if (!apiKey) return null;
  return callOpenAiCompatible({
    source: "Groq",
    apiKey,
    baseUrl: process.env.GROQ_API_BASE_URL || "https://api.groq.com/openai/v1",
    model: process.env.GROQ_EXTRACTION_MODEL || "llama-3.1-8b-instant",
    request,
  });
}

async function extractWithOpenRouter(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.OPENROUTER_KEY?.trim();
  if (!apiKey) return null;
  return callOpenAiCompatible({
    source: "OpenRouter",
    apiKey,
    baseUrl: process.env.OPENROUTER_API_BASE_URL || "https://openrouter.ai/api/v1",
    model: process.env.OPENROUTER_EXTRACTION_MODEL || "openai/gpt-4o-mini",
    request,
  });
}

async function extractWithCerebras(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.CEREBRAS_API_KEY?.trim();
  if (!apiKey) return null;
  return callOpenAiCompatible({
    source: "Cerebras",
    apiKey,
    baseUrl: process.env.CEREBRAS_API_BASE_URL || "https://api.cerebras.ai/v1",
    model: process.env.CEREBRAS_EXTRACTION_MODEL || "llama3.1-8b",
    request,
  });
}

async function extractWithClod(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.CLOD_API_KEY?.trim();
  const baseUrl = process.env.CLOD_API_BASE_URL?.trim();
  const model = process.env.CLOD_EXTRACTION_MODEL?.trim();
  if (!apiKey || !baseUrl || !model) return null;
  return callOpenAiCompatible({ source: "Clod", apiKey, baseUrl, model, request });
}

async function extractWithGemini(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.GEMINI_API_KEY?.trim();
  if (!apiKey) return null;
  const model = process.env.GEMINI_EXTRACTION_MODEL || "gemini-1.5-flash";
  const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      generationConfig: { temperature: 0, responseMimeType: "application/json" },
      contents: [{ role: "user", parts: [{ text: buildPrompt(request) }] }],
    }),
    signal: AbortSignal.timeout(timeoutMs(request)),
  });

  if (!response.ok) return null;
  const data = await response.json() as any;
  const content = data?.candidates?.[0]?.content?.parts?.map((part: any) => part?.text).filter(Boolean).join("\n");
  return normalizeExtraction("Gemini", extractJson(content));
}

async function extractWithHuggingFace(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.HUGGINGFACE_API_KEY?.trim();
  if (!apiKey) return null;
  const model = process.env.HUGGINGFACE_EXTRACTION_MODEL || "mistralai/Mistral-7B-Instruct-v0.3";
  const response = await fetch(`https://api-inference.huggingface.co/models/${model}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${apiKey}`,
    },
    body: JSON.stringify({ inputs: buildPrompt(request), parameters: { max_new_tokens: 700, temperature: 0.1 } }),
    signal: AbortSignal.timeout(timeoutMs(request)),
  });

  if (!response.ok) return null;
  const data = await response.json() as any;
  const text = Array.isArray(data) ? data[0]?.generated_text : data?.generated_text;
  return normalizeExtraction("HuggingFace", extractJson(text));
}

async function extractWithMinimax(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const apiKey = process.env.MINIMAX_API_KEY?.trim();
  const baseUrl = process.env.MINIMAX_API_BASE_URL?.trim();
  const model = process.env.MINIMAX_EXTRACTION_MODEL?.trim() || "MiniMax-Text-01";
  if (!apiKey || !baseUrl) return null;
  return callOpenAiCompatible({ source: "MiniMax", apiKey, baseUrl, model, request });
}

const AI_PROVIDERS: AiProvider[] = [
  { name: "Gemini", envVar: "GEMINI_API_KEY", extract: extractWithGemini },
  { name: "Groq", envVar: "GROQ_API_KEY", extract: extractWithGroq },
  { name: "OpenRouter", envVar: "OPENROUTER_KEY", extract: extractWithOpenRouter },
  { name: "Cerebras", envVar: "CEREBRAS_API_KEY", extract: extractWithCerebras },
  { name: "HuggingFace", envVar: "HUGGINGFACE_API_KEY", extract: extractWithHuggingFace },
  { name: "MiniMax", envVar: "MINIMAX_API_KEY", extract: extractWithMinimax },
  { name: "Clod", envVar: "CLOD_API_KEY", extract: extractWithClod },
];

export function getConfiguredAiExtractionSources(): string[] {
  return AI_PROVIDERS.filter((provider) => isConfigured(provider.envVar)).map((provider) => provider.name);
}

export function hasConfiguredAiExtractionSource(): boolean {
  return getConfiguredAiExtractionSources().length > 0;
}

export async function extractEvidenceWithAi(request: AiExtractionRequest): Promise<AiExtractionResult | null> {
  const preferred = process.env.AI_EXTRACTION_PROVIDER?.trim().toLowerCase();
  const configured = AI_PROVIDERS.filter((provider) => isConfigured(provider.envVar));
  const ordered = preferred
    ? [...configured].sort((a, b) => Number(b.name.toLowerCase() === preferred) - Number(a.name.toLowerCase() === preferred))
    : configured;

  for (const provider of ordered) {
    try {
      const result = await provider.extract(request);
      if (result) return result;
    } catch (error) {
      console.warn(`[AI Extraction ${provider.name}] ${String(error)}`);
    }
  }

  return null;
}
