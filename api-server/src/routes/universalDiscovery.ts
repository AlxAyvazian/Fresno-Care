import { Router, type Request, type Response } from "express";
import { eq } from "drizzle-orm";
import type { SearchParams } from "../providerSources/types";
import { runUnifiedSearch } from "../providerSources/orchestrator";
import { upsertProvider } from "../providerSources/persistence";
import { getDb, searchRunsTable, searchRunResultsTable } from "@workspace/db";
import { isPersistenceConfigured } from "../lib/networkMapPersistence";

const router = Router();

/**
 * POST /api/provider-sources/search
 * Universal provider discovery endpoint.
 * Runs adapters, dedupes, geocodes, assigns coordinateStatus + trustTier,
 * upserts results into Neon, saves search snapshot.
 */
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

    // Upsert results into Neon (non-blocking — don't fail the response if DB is down)
    let resultsInserted = 0;
    let resultsUpdated = 0;
    let searchRunId: number | null = null;

    if (isPersistenceConfigured()) {
      try {
        const db = getDb();

        // Save search run
        const [run] = await db.insert(searchRunsTable).values({
          mode: "discovery",
          scope: "city_radius",
          city,
          state,
          serviceType,
          radiusMiles,
          centerLat,
          centerLng,
          adaptersUsed: response.audit.activeAdapters,
          resultsFound: response.results.length,
          durationMs: response.audit.durationMs,
          errorsBySource: response.audit.errorsBySource,
        }).returning({ id: searchRunsTable.id });
        searchRunId = run.id;

        // Upsert each provider candidate
        for (const candidate of response.results) {
          try {
            const { providerId, isNew } = await upsertProvider(candidate, serviceType);
            if (isNew) resultsInserted++;
            else resultsUpdated++;

            // Link to search run
            await db.insert(searchRunResultsTable).values({
              searchRunId: run.id,
              providerId,
              resultStatus: isNew ? "new" : "existing",
              distanceMiles: candidate.distanceMiles ?? null,
              score: candidate.score,
            });
          } catch (err) {
            // Log but don't fail the whole response
            console.warn("[UniversalDiscovery] Failed to upsert provider:", candidate.name, err);
          }
        }

        // Update search run with insert/update counts
        await db.update(searchRunsTable).set({
          resultsInserted,
          resultsUpdated,
        }).where(eq(searchRunsTable.id, run.id));
      } catch (dbErr) {
        console.warn("[UniversalDiscovery] Database persistence failed:", dbErr);
      }
    }

    res.json({
      ...response,
      persistence: {
        searchRunId,
        resultsInserted,
        resultsUpdated,
        persisted: isPersistenceConfigured(),
      },
    });
  } catch (e: any) {
    console.error("[UniversalDiscovery] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
