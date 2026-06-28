import { Router, type Request, type Response } from "express";
import { eq, desc } from "drizzle-orm";
import { getDb, priceDiscoveryRunsTable, providerPricesTable, priceEvidenceTable } from "@workspace/db";
import { isPersistenceConfigured } from "../lib/networkMapPersistence";
import { isLangSearchConfigured, searchLangSearchWeb, type LangSearchWebPage } from "../lib/langSearchClient";
import { upsertProvider } from "../providerSources/persistence";
import type { ProviderCandidate } from "../providerSources/types";

const router = Router();

const SERVICE_LABELS: Record<string, string> = {
  dotExam: "DOT physical",
  faamedical: "FAA medical exam",
  physicalExam: "occupational physical exam",
  urgentCare: "urgent care",
  mammogram: "mammogram",
  radiology: "x-ray radiology",
  stressTest: "cardiac stress test",
  drugscreen: "drug screen collection",
  lab: "lab draw",
  audiology: "audiogram hearing test",
  dental: "dental exam",
  pulmonary: "spirometry PFT",
  occupational: "occupational medicine",
};

type PriceCandidate = {
  providerId?: number | null;
  providerCandidate?: ProviderCandidate;
  serviceName: string;
  priceMin?: number | null;
  priceMax?: number | null;
  priceCurrency?: string;
  priceType?: string;
  sourceUrl?: string | null;
  sourceLabel?: string | null;
  confidence?: number;
  extractionNotes?: string | null;
  evidence?: {
    url?: string | null;
    snippet?: string | null;
    pageTitle?: string | null;
    confidence?: number;
  };
};

function normalizeServiceName(serviceType: string | undefined, query: string): string {
  if (serviceType && SERVICE_LABELS[serviceType]) return SERVICE_LABELS[serviceType];
  if (serviceType) return serviceType;
  return query;
}

function buildLangSearchPriceQueries(query: string, city?: string, state?: string, serviceType?: string): string[] {
  const service = normalizeServiceName(serviceType, query);
  const location = [city, state].filter(Boolean).join(" ").trim();
  const queries = [
    query,
    `${service} price ${location}`.trim(),
    `${service} fee schedule self pay ${location}`.trim(),
    `${service} pricing PDF ${location}`.trim(),
  ];
  return [...new Set(queries.filter(Boolean))].slice(0, 3);
}

function extractDollarRanges(text: string): Array<{ min: number; max: number | null }> {
  const results: Array<{ min: number; max: number | null }> = [];
  const re = /\$\s*([0-9]{1,5}(?:,[0-9]{3})?(?:\.\d{2})?)(?:\s*(?:-|–|—|to)\s*\$?\s*([0-9]{1,5}(?:,[0-9]{3})?(?:\.\d{2})?))?/gi;
  let match: RegExpExecArray | null;
  while ((match = re.exec(text)) !== null) {
    const min = Number(match[1].replace(/,/g, ""));
    const max = match[2] ? Number(match[2].replace(/,/g, "")) : null;
    if (Number.isFinite(min) && min > 0 && min < 100000) {
      results.push({ min, max: max && Number.isFinite(max) ? max : null });
    }
  }
  return results;
}

function looksLikePricePage(text: string): boolean {
  return /\b(price|pricing|fee|fees|cost|costs|self[- ]?pay|cash pay|rate|rates|charge|fee schedule)\b/i.test(text);
}

function cleanProviderName(page: LangSearchWebPage): string {
  const title = page.name || page.displayUrl || page.url;
  return title
    .replace(/\s*[|\-–—:]\s*(pricing|prices|cost|fee schedule|self pay|urgent care|occupational medicine|services).*$/i, "")
    .replace(/\s+/g, " ")
    .trim()
    .slice(0, 160) || "LangSearch price lead";
}

function stableId(input: string): string {
  let hash = 0;
  for (let i = 0; i < input.length; i++) hash = ((hash << 5) - hash + input.charCodeAt(i)) | 0;
  return `langsearch-price-${Math.abs(hash)}`;
}

function pageToProviderCandidate(page: LangSearchWebPage, city: string, state: string, serviceName: string): ProviderCandidate {
  const snippet = page.summary || page.snippet || page.displayUrl || page.url;
  return {
    id: stableId(page.url || page.name),
    name: cleanProviderName(page),
    address: "",
    city,
    state,
    postalCode: "",
    phone: "",
    website: page.url,
    coordinateStatus: "unverified",
    source: "LangSearch",
    sourceDetail: "Open-web price discovery",
    sourceUrl: page.url,
    confidence: "low",
    trustTier: "lead",
    score: 8,
    badges: ["PRICE", "WEB"],
    evidence: [
      {
        serviceDetected: serviceName,
        evidenceUrl: page.url,
        evidenceTextSnippet: snippet.slice(0, 1200),
        confidence: 60,
        source: "LangSearch",
      },
    ],
    _rawSources: ["LangSearch"],
  };
}

async function discoverLangSearchPrices(args: {
  query: string;
  city?: string;
  state?: string;
  serviceType?: string;
}): Promise<{ prices: PriceCandidate[]; queries: string[]; pagesChecked: number }> {
  if (!isLangSearchConfigured()) return { prices: [], queries: [], pagesChecked: 0 };

  const city = String(args.city || "").trim();
  const state = String(args.state || "").trim().toUpperCase();
  const serviceName = normalizeServiceName(args.serviceType, args.query);
  const queries = buildLangSearchPriceQueries(args.query, city, state, args.serviceType);
  const seenUrls = new Set<string>();
  const prices: PriceCandidate[] = [];
  let pagesChecked = 0;

  for (const q of queries) {
    const response = await searchLangSearchWeb({
      query: q,
      freshness: "noLimit",
      summary: true,
      count: Number(process.env.LANGSEARCH_PRICE_RESULT_COUNT || 10),
      timeoutMs: 15000,
    });

    for (const page of response.results) {
      if (!page.url || seenUrls.has(page.url)) continue;
      seenUrls.add(page.url);
      pagesChecked++;

      const text = [page.name, page.displayUrl, page.snippet, page.summary].filter(Boolean).join("\n");
      const ranges = extractDollarRanges(text);
      if (!ranges.length && !looksLikePricePage(text)) continue;

      const providerCandidate = pageToProviderCandidate(page, city, state, serviceName);
      const firstRange = ranges[0];
      const confidence = ranges.length ? 75 : 45;

      prices.push({
        providerCandidate,
        serviceName,
        priceMin: firstRange?.min ?? null,
        priceMax: firstRange?.max ?? null,
        priceCurrency: "USD",
        priceType: /fee schedule/i.test(text) ? "fee_schedule" : "self_pay",
        sourceUrl: page.url,
        sourceLabel: page.name || page.displayUrl || "LangSearch result",
        confidence,
        extractionNotes: ranges.length
          ? `LangSearch extracted ${ranges.length} dollar amount(s) from result text.`
          : "LangSearch found a likely pricing page, but no exact dollar amount was extracted.",
        evidence: {
          url: page.url,
          snippet: (page.summary || page.snippet || "").slice(0, 1800),
          pageTitle: page.name,
          confidence,
        },
      });
    }
  }

  return { prices, queries, pagesChecked };
}

/**
 * POST /api/price-discovery/run
 * Runs/saves price discovery results into the price tables.
 * If no explicit `prices` array is supplied, this can run LangSearch open-web price discovery.
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

    const startMs = performance.now();
    const suppliedPrices: PriceCandidate[] = Array.isArray(prices) ? prices : [];
    const shouldRunLangSearch = req.body.runLangSearch === true || (suppliedPrices.length === 0 && mode !== "known_provider");
    const langSearch = shouldRunLangSearch
      ? await discoverLangSearchPrices({ query, city, state, serviceType })
      : { prices: [], queries: [], pagesChecked: 0 };
    const allPrices = [...suppliedPrices, ...langSearch.prices];

    const db = getDb();
    const sourceSet = new Set<string>(Array.isArray(sourcesUsed) ? sourcesUsed : []);
    if (langSearch.prices.length > 0 || shouldRunLangSearch) sourceSet.add("LangSearch");

    // Create discovery run
    const [run] = await db.insert(priceDiscoveryRunsTable).values({
      query,
      city: city || null,
      state: state || null,
      serviceType: serviceType || null,
      mode: mode || "open_web",
      sourcesUsed: Array.from(sourceSet),
      resultsFound: allPrices.length,
      durationMs: durationMs || Math.round(performance.now() - startMs),
    }).returning();

    // Save individual price records
    const savedPrices: any[] = [];
    for (const price of allPrices) {
      try {
        let providerId = price.providerId || null;
        if (!providerId && price.providerCandidate) {
          const upserted = await upsertProvider(price.providerCandidate, serviceType || price.serviceName || query);
          providerId = upserted.providerId;
        }

        const [savedPrice] = await db.insert(providerPricesTable).values({
          providerId,
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

    res.json({
      run,
      savedPrices: savedPrices.length,
      total: allPrices.length,
      langSearch: {
        configured: isLangSearchConfigured(),
        ran: shouldRunLangSearch,
        queries: langSearch.queries,
        pagesChecked: langSearch.pagesChecked,
        pricesFound: langSearch.prices.length,
      },
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
