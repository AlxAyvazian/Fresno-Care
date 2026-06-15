import { Router, type Request, type Response } from "express";
import type { SearchParams } from "../providerSources/types";
import { runUnifiedSearch } from "../providerSources/orchestrator";

const router = Router();

router.post("/provider-sources/search", async (req: Request, res: Response) => {
  try {
    const body = req.body as SearchParams;
    const city = String(body.city || "").trim();
    const state = String(body.state || "").trim().toUpperCase();
    const serviceType = String(body.serviceType || "").trim();
    const radiusMiles = Number(body.radiusMiles || 25);
    const centerLat = Number(body.centerLat);
    const centerLng = Number(body.centerLng);

    if (!city || !state || !serviceType || Number.isNaN(centerLat) || Number.isNaN(centerLng)) {
      res.status(400).json({ error: "Missing required fields: city, state, serviceType, centerLat, centerLng" });
      return;
    }

    const response = await runUnifiedSearch({ city, state, serviceType, radiusMiles, centerLat, centerLng });
    res.json(response);
  } catch (e: any) {
    console.error("[ProviderSources Route] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
