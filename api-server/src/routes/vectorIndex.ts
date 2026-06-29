import { Router, type Request, type Response } from "express";
import {
  isVectorIndexRuntimeReady,
  getVectorIndexMissingConfig,
  upsertEvidenceVectors,
  queryEvidenceVectors,
  type VectorUpsertRequest,
  type VectorQueryRequest,
} from "../lib/vectorIndexClient";

const router = Router();

router.get("/vector-index/status", (_req: Request, res: Response) => {
  try {
    res.json({
      runtimeReady: isVectorIndexRuntimeReady(),
      missingRequiredConfig: getVectorIndexMissingConfig(),
    });
  } catch (e: any) {
    console.error("[VectorIndex Status Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

router.post("/vector-index/upsert", async (req: Request, res: Response) => {
  try {
    const { records, namespace } = (req.body || {}) as VectorUpsertRequest;

    if (!Array.isArray(records) || records.length === 0) {
      res.status(400).json({ error: "records array is required and must not be empty" });
      return;
    }

    const result = await upsertEvidenceVectors({ records, namespace });
    res.status(result.ok ? 200 : 400).json(result);
  } catch (e: any) {
    console.error("[VectorIndex Upsert Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

router.post("/vector-index/query", async (req: Request, res: Response) => {
  try {
    const { vector, topK, namespace, filter } = (req.body || {}) as VectorQueryRequest;

    if (!Array.isArray(vector) || vector.length === 0) {
      res.status(400).json({
        error: "vector array is required. Text-to-vector embedding is not yet supported.",
      });
      return;
    }

    const result = await queryEvidenceVectors({ vector, topK, namespace, filter });
    res.status(result.ok ? 200 : 400).json(result);
  } catch (e: any) {
    console.error("[VectorIndex Query Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
