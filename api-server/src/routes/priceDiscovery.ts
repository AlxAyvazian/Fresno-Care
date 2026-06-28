import { Router, type Request, type Response } from "express";
import { eq, desc } from "drizzle-orm";
import { getDb, priceDiscoveryRunsTable, providerPricesTable, priceEvidenceTable } from "@workspace/db";
import { isPersistenceConfigured } from "../lib/networkMapPersistence";

const router = Router();

/**
 * POST /api/price-discovery/run
 * Record a price discovery run and save price results into the price tables.
 * This is called after price finder/hunt completes to persist findings.
 */
router.post("/price-discovery/run", async (req: Request, res: Response) => {
  try {
    if (!isPersistenceConfigured()) {
      res.status(503).json({ error: "Database not configured" });
      return;
    }

    const { query, city, state, serviceType, mode, sourcesUsed, prices, durationMs } = req.body;

    if (!query) {
      res.status(400).json({ error: "query is required" });
      return;
    }

    const db = getDb();

    // Create discovery run
    const [run] = await db.insert(priceDiscoveryRunsTable).values({
      query,
      city: city || null,
      state: state || null,
      serviceType: serviceType || null,
      mode: mode || "open_web",
      sourcesUsed: sourcesUsed || [],
      resultsFound: Array.isArray(prices) ? prices.length : 0,
      durationMs: durationMs || null,
    }).returning();

    // Save individual price records
    const savedPrices: any[] = [];
    if (Array.isArray(prices)) {
      for (const price of prices) {
        try {
          const [savedPrice] = await db.insert(providerPricesTable).values({
            providerId: price.providerId || null,
            discoveryRunId: run.id,
            serviceName: price.serviceName || query,
            priceMin: price.priceMin ?? null,
            priceMax: price.priceMax ?? null,
            priceCurrency: price.priceCurrency || "USD",
            priceType: price.priceType || "self_pay",
            sourceUrl: price.sourceUrl || null,
            sourceLabel: price.sourceLabel || null,
            confidence: price.confidence || 50,
            extractionNotes: price.extractionNotes || null,
          }).returning();

          // Save evidence if provided
          if (price.evidence) {
            await db.insert(priceEvidenceTable).values({
              priceId: savedPrice.id,
              evidenceUrl: price.evidence.url || null,
              evidenceSnippet: price.evidence.snippet || null,
              pageTitle: price.evidence.pageTitle || null,
              confidence: price.evidence.confidence || 50,
            });
          }

          savedPrices.push(savedPrice);
        } catch (err) {
          console.warn("[PriceDiscovery] Failed to save price:", err);
        }
      }
    }

    res.json({
      run,
      savedPrices: savedPrices.length,
      total: Array.isArray(prices) ? prices.length : 0,
    });
  } catch (e: any) {
    console.error("[PriceDiscovery] Error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

/**
 * GET /api/price-discovery/runs
 * List recent price discovery runs.
 */
router.get("/price-discovery/runs", async (req: Request, res: Response) => {
  try {
    if (!isPersistenceConfigured()) {
      res.json({ runs: [] });
      return;
    }

    const limit = Math.min(Math.max(Number(req.query.limit) || 50, 1), 200);
    const db = getDb();

    const runs = await db.select().from(priceDiscoveryRunsTable)
      .orderBy(desc(priceDiscoveryRunsTable.createdAt))
      .limit(limit);

    res.json({ runs });
  } catch (e: any) {
    console.error("[PriceDiscovery] List error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

/**
 * GET /api/price-discovery/prices
 * List prices for a specific provider or service.
 */
router.get("/price-discovery/prices", async (req: Request, res: Response) => {
  try {
    if (!isPersistenceConfigured()) {
      res.json({ prices: [] });
      return;
    }

    const providerId = req.query.providerId ? Number(req.query.providerId) : undefined;
    const limit = Math.min(Math.max(Number(req.query.limit) || 50, 1), 200);
    const db = getDb();

    let prices;
    if (providerId) {
      prices = await db.select().from(providerPricesTable)
        .where(eq(providerPricesTable.providerId, providerId))
        .orderBy(desc(providerPricesTable.createdAt))
        .limit(limit);
    } else {
      prices = await db.select().from(providerPricesTable)
        .orderBy(desc(providerPricesTable.createdAt))
        .limit(limit);
    }

    res.json({ prices });
  } catch (e: any) {
    console.error("[PriceDiscovery] Prices error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
