import { isPineconeConfigured } from "./apiSourceRegistry";

export interface VectorRecord {
  id: string;
  values?: number[];
  metadata?: {
    url?: string;
    title?: string;
    text?: string;
    source?: string;
    serviceType?: string;
    [key: string]: unknown;
  };
}

export interface VectorQueryResult {
  id: string;
  score: number;
  metadata?: Record<string, unknown>;
}

export interface VectorUpsertRequest {
  records: VectorRecord[];
  namespace?: string;
}

export interface VectorUpsertResult {
  ok: boolean;
  upserted: number;
  error?: string;
}

export interface VectorQueryRequest {
  vector?: number[];
  topK?: number;
  namespace?: string;
  filter?: Record<string, unknown>;
}

export interface VectorQueryResponse {
  ok: boolean;
  results: VectorQueryResult[];
  error?: string;
}

function isConfigured(envVar: string): boolean {
  return Boolean(process.env[envVar]?.trim());
}

function getTimeoutMs(): number {
  const val = Number(process.env.PINECONE_TIMEOUT_MS);
  return Number.isFinite(val) && val > 0 ? val : 15000;
}

function getNamespace(req?: { namespace?: string }): string {
  return req?.namespace || process.env.PINECONE_NAMESPACE?.trim() || "default";
}

export function isVectorIndexRuntimeReady(): boolean {
  return isPineconeConfigured();
}

export function getVectorIndexMissingConfig(): string[] {
  const missing: string[] = [];
  if (!isConfigured("PINECONE_API_KEY")) missing.push("PINECONE_API_KEY");
  if (!isConfigured("PINECONE_INDEX_HOST")) missing.push("PINECONE_INDEX_HOST");
  return missing;
}

export async function upsertEvidenceVectors(req: VectorUpsertRequest): Promise<VectorUpsertResult> {
  if (!isVectorIndexRuntimeReady()) {
    return {
      ok: false,
      upserted: 0,
      error: `Pinecone not configured. Missing: ${getVectorIndexMissingConfig().join(", ")}`,
    };
  }

  const apiKey = process.env.PINECONE_API_KEY!.trim();
  const indexHost = process.env.PINECONE_INDEX_HOST!.trim();
  const namespace = getNamespace(req);
  const url = `${indexHost.replace(/\/$/, "")}/vectors/upsert?namespace=${encodeURIComponent(namespace)}`;

  const recordsWithoutVectors = req.records.filter((r) => !r.values || r.values.length === 0);
  if (recordsWithoutVectors.length > 0) {
    return {
      ok: false,
      upserted: 0,
      error: "Embedding provider not configured. Records without pre-computed vectors cannot be upserted.",
    };
  }

  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Api-Key": apiKey,
      },
      body: JSON.stringify({
        vectors: req.records.map((r) => ({
          id: r.id,
          values: r.values,
          metadata: r.metadata || {},
        })),
      }),
      signal: AbortSignal.timeout(getTimeoutMs()),
    });

    if (!response.ok) {
      const text = await response.text().catch(() => "");
      return {
        ok: false,
        upserted: 0,
        error: `Pinecone upsert HTTP ${response.status}: ${text.slice(0, 200)}`,
      };
    }

    return { ok: true, upserted: req.records.length };
  } catch (error) {
    return {
      ok: false,
      upserted: 0,
      error: `Pinecone upsert error: ${String(error)}`,
    };
  }
}

export async function queryEvidenceVectors(req: VectorQueryRequest): Promise<VectorQueryResponse> {
  if (!isVectorIndexRuntimeReady()) {
    return {
      ok: false,
      results: [],
      error: `Pinecone not configured. Missing: ${getVectorIndexMissingConfig().join(", ")}`,
    };
  }

  if (!req.vector || req.vector.length === 0) {
    return {
      ok: false,
      results: [],
      error: "Query vector is required. Embedding provider not configured for automatic text-to-vector conversion.",
    };
  }

  const apiKey = process.env.PINECONE_API_KEY!.trim();
  const indexHost = process.env.PINECONE_INDEX_HOST!.trim();
  const namespace = getNamespace(req);
  const url = `${indexHost.replace(/\/$/, "")}/query?namespace=${encodeURIComponent(namespace)}`;

  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Api-Key": apiKey,
      },
      body: JSON.stringify({
        vector: req.vector,
        topK: req.topK || 10,
        includeMetadata: true,
        filter: req.filter,
      }),
      signal: AbortSignal.timeout(getTimeoutMs()),
    });

    if (!response.ok) {
      const text = await response.text().catch(() => "");
      return {
        ok: false,
        results: [],
        error: `Pinecone query HTTP ${response.status}: ${text.slice(0, 200)}`,
      };
    }

    const data = await response.json() as any;
    const matches = Array.isArray(data?.matches) ? data.matches : [];
    const results: VectorQueryResult[] = matches.map((m: any) => ({
      id: String(m.id || ""),
      score: Number(m.score || 0),
      metadata: m.metadata || {},
    }));

    return { ok: true, results };
  } catch (error) {
    return {
      ok: false,
      results: [],
      error: `Pinecone query error: ${String(error)}`,
    };
  }
}
