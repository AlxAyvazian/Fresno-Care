import { Router, type Request, type Response } from "express";
import { eq, desc } from "drizzle-orm";
import { getDb, indexingJobsTable, indexingJobStepsTable } from "@workspace/db";
import { searchNpi } from "../providerSources/adapters/npi";
import { upsertProvider } from "../providerSources/persistence";
import { geocodeAddress } from "../providerSources/geocode";
import { isPersistenceConfigured } from "../lib/networkMapPersistence";
import type { ProviderCandidate, CoordinateStatus } from "../providerSources/types";

const router = Router();

// US states for state-by-state indexing
const US_STATES = [
  "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
  "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
  "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
  "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
  "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "DC",
];

/**
 * POST /api/indexing-jobs
 * Create a new indexing job.
 */
router.post("/indexing-jobs", async (req: Request, res: Response) => {
  try {
    const { mode, sourceAdapter, state, city, taxonomy, serviceType } = req.body;

    if (!mode || !sourceAdapter) {
      res.status(400).json({ error: "mode and sourceAdapter are required" });
      return;
    }

    if (!isPersistenceConfigured()) {
      res.status(503).json({ error: "Database not configured — indexing jobs require DATABASE_URL" });
      return;
    }

    const db = getDb();
    const [job] = await db.insert(indexingJobsTable).values({
      mode,
      sourceAdapter,
      state: state || null,
      city: city || null,
      taxonomy: taxonomy || null,
      serviceType: serviceType || null,
      status: "pending",
    }).returning();

    res.json({ job });
  } catch (e: any) {
    console.error("[IndexingJobs] Create error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

/**
 * GET /api/indexing-jobs
 * List indexing jobs with optional status filter.
 */
router.get("/indexing-jobs", async (req: Request, res: Response) => {
  try {
    const status = req.query.status as string | undefined;
    const limit = Math.min(Math.max(Number(req.query.limit) || 50, 1), 200);

    if (!isPersistenceConfigured()) {
      res.json({ jobs: [], note: "Database not configured" });
      return;
    }

    const db = getDb();
    let jobs;
    if (status) {
      jobs = await db.select().from(indexingJobsTable)
        .where(eq(indexingJobsTable.status, status))
        .orderBy(desc(indexingJobsTable.createdAt))
        .limit(limit);
    } else {
      jobs = await db.select().from(indexingJobsTable)
        .orderBy(desc(indexingJobsTable.createdAt))
        .limit(limit);
    }

    res.json({ jobs });
  } catch (e: any) {
    console.error("[IndexingJobs] List error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

/**
 * POST /api/indexing-jobs/:id/run
 * Execute a pending indexing job (runs synchronously for now, can be made async later).
 */
router.post("/indexing-jobs/:id/run", async (req: Request, res: Response) => {
  try {
    const jobId = Number(req.params.id);

    if (!isPersistenceConfigured()) {
      res.status(503).json({ error: "Database not configured — indexing jobs require DATABASE_URL" });
      return;
    }

    const db = getDb();

    const [job] = await db.select().from(indexingJobsTable).where(eq(indexingJobsTable.id, jobId)).limit(1);
    if (!job) {
      res.status(404).json({ error: "Job not found" });
      return;
    }

    if (job.status === "running") {
      res.status(409).json({ error: "Job is already running" });
      return;
    }

    // Mark as running
    await db.update(indexingJobsTable).set({
      status: "running",
      startedAt: new Date(),
      updatedAt: new Date(),
    }).where(eq(indexingJobsTable.id, jobId));

    let totalFound = 0;
    let totalInserted = 0;
    let totalUpdated = 0;
    let totalErrors = 0;

    try {
      if (job.mode === "state" && job.sourceAdapter === "npi") {
        const states = job.state ? [job.state] : US_STATES;
        const serviceType = job.serviceType || "occupational";

        for (const st of states) {
          const stepLabel = `NPI search: ${st} / ${serviceType}`;
          const [step] = await db.insert(indexingJobStepsTable).values({
            jobId,
            stepLabel,
            status: "running",
            startedAt: new Date(),
          }).returning();

          try {
            const results = await searchNpi("", st, serviceType);
            totalFound += results.length;

            // Geocode and upsert each result
            for (const candidate of results) {
              try {
                // Attempt geocode
                let geocodedCandidate = candidate;
                if (candidate.address && candidate.city && candidate.state) {
                  const point = await geocodeAddress(`${candidate.address}, ${candidate.city}, ${candidate.state}`);
                  if (point) {
                    geocodedCandidate = { ...candidate, lat: point.lat, lng: point.lng, coordinateStatus: "geocoded" as CoordinateStatus };
                  }
                }

                const { isNew } = await upsertProvider(geocodedCandidate, serviceType);
                if (isNew) totalInserted++;
                else totalUpdated++;
              } catch {
                totalErrors++;
              }
            }

            await db.update(indexingJobStepsTable).set({
              status: "completed",
              resultsFound: results.length,
              resultsInserted: totalInserted,
              completedAt: new Date(),
            }).where(eq(indexingJobStepsTable.id, step.id));

            // Rate limiting between states
            await new Promise((r) => setTimeout(r, 1000));
          } catch (err: any) {
            totalErrors++;
            await db.update(indexingJobStepsTable).set({
              status: "failed",
              error: err.message || String(err),
              completedAt: new Date(),
            }).where(eq(indexingJobStepsTable.id, step.id));
          }
        }
      }

      // Mark job completed
      await db.update(indexingJobsTable).set({
        status: "completed",
        completedAt: new Date(),
        resultsFound: totalFound,
        resultsInserted: totalInserted,
        resultsUpdated: totalUpdated,
        errors: totalErrors,
        updatedAt: new Date(),
      }).where(eq(indexingJobsTable.id, jobId));
    } catch (err: any) {
      await db.update(indexingJobsTable).set({
        status: "failed",
        errors: totalErrors + 1,
        updatedAt: new Date(),
      }).where(eq(indexingJobsTable.id, jobId));
      throw err;
    }

    const [updatedJob] = await db.select().from(indexingJobsTable).where(eq(indexingJobsTable.id, jobId));
    res.json({ job: updatedJob });
  } catch (e: any) {
    console.error("[IndexingJobs] Run error:", e);
    res.status(500).json({ error: e.message || "Internal server error" });
  }
});

export default router;
