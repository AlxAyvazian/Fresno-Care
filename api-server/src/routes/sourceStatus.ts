import { Router, type Request, type Response } from "express";
import { getSourceStatusReport } from "../lib/apiSourceRegistry";

const router = Router();

router.get("/source-status", async (_req: Request, res: Response) => {
  try {
    const report = getSourceStatusReport();
    const summary = {
      total: report.length,
      configured: report.filter((source) => source.configured).length,
      notConfigured: report.filter((source) => !source.configured).length,
      runtimeReady: report.filter((source) => source.runtimeReady).length,
      configuredButNotRuntimeReady: report
        .filter((source) => source.configured && !source.runtimeReady)
        .map((source) => ({
          sourceName: source.sourceName,
          envVar: source.envVar,
          missingRequiredConfig: source.missingRequiredConfig,
        })),
      active: report.filter((source) => source.adapterStatus === "active").length,
      configuredNotWired: report.filter((source) => source.adapterStatus === "configured_not_wired").length,
      planned: report.filter((source) => source.adapterStatus === "planned").length,
    };

    res.json({
      summary,
      sources: report,
    });
  } catch (e: any) {
    console.error("[SourceStatus Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
