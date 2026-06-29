import { Router, type Request, type Response } from "express";
import { runBrowserExtraction, getBrowserExtractionReadiness, type BrowserExtractionRequest } from "../lib/browserExtractionClient";

const router = Router();

router.post("/browser-extraction/run", async (req: Request, res: Response) => {
  try {
    const { source, url, query, city, state, serviceType, limit } = req.body || {};

    if (!source || !["BrowseAI", "Olostep", "Browserbase"].includes(source)) {
      res.status(400).json({
        error: "source is required and must be one of: BrowseAI, Olostep, Browserbase",
      });
      return;
    }

    if (source !== "BrowseAI" && !url) {
      res.status(400).json({
        error: `${source} requires a url to extract.`,
      });
      return;
    }

    const request: BrowserExtractionRequest = {
      url,
      query,
      city,
      state,
      serviceType,
      limit: limit ? Number(limit) : undefined,
    };

    const result = await runBrowserExtraction(source as "BrowseAI" | "Olostep" | "Browserbase", request);
    res.json(result);
  } catch (e: any) {
    console.error("[BrowserExtraction Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

router.get("/browser-extraction/status", (_req: Request, res: Response) => {
  try {
    const readiness = getBrowserExtractionReadiness();
    res.json(readiness);
  } catch (e: any) {
    console.error("[BrowserExtraction Status Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
