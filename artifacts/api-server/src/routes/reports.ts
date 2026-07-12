import { createHash } from "node:crypto";
import { Router, type IRouter } from "express";
import { and, desc, eq, gte } from "drizzle-orm";
import {
  createReportSchema,
  db,
  moderationEventsTable,
  reportsTable,
} from "@workspace/db";
import { intakeRateLimit } from "../middleware/rateLimit";

const reportsRouter: IRouter = Router();

function positiveInteger(value: string | undefined, fallback: number): number {
  const parsed = Number.parseInt(value ?? "", 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

const duplicateWindowMs = positiveInteger(
  process.env.INTAKE_DUPLICATE_WINDOW_MS,
  2 * 60 * 1000,
);

function normalizedText(value: string): string {
  return value.trim().replace(/\s+/g, " ").toLocaleLowerCase("en-US");
}

function submissionFingerprint(input: typeof createReportSchema._output): string {
  const normalized = {
    animalType: input.animalType,
    count: input.count,
    location: normalizedText(input.location),
    neighborhood: normalizedText(input.neighborhood),
    dateObserved: input.dateObserved,
    timeObserved: input.timeObserved,
    inDanger: input.inDanger,
    concernTypes: [...input.concernTypes].map(normalizedText).sort(),
    description: normalizedText(input.description),
    evidenceNotes: normalizedText(input.evidenceNotes),
    agenciesContacted: normalizedText(input.agenciesContacted),
    responseReceived: normalizedText(input.responseReceived),
  };

  return createHash("sha256").update(JSON.stringify(normalized)).digest("hex");
}

function toReceipt(report: typeof reportsTable.$inferSelect, deduplicated = false) {
  return {
    publicId: report.publicId,
    createdAt: report.createdAt,
    status: report.status,
    publicationStatus: report.publicationStatus,
    deduplicated,
  };
}

function toPublicReport(report: typeof reportsTable.$inferSelect) {
  return {
    id: report.publicId,
    publicId: report.publicId,
    createdAt: report.createdAt,
    publishedAt: report.publishedAt,
    animalType: report.animalType,
    count: report.count,
    location: report.neighborhood,
    neighborhood: report.neighborhood,
    dateObserved: report.dateObserved,
    timeObserved: report.timeObserved,
    inDanger: report.inDanger,
    concernTypes: report.concernTypes,
    description: report.description,
    evidenceNotes: report.evidenceNotes,
    agenciesContacted: report.agenciesContacted,
    responseReceived: report.responseReceived,
    anonymous: report.anonymous,
    status: report.status,
  };
}

reportsRouter.post("/reports", intakeRateLimit, async (req, res, next) => {
  try {
    // Hidden bot field. Human-facing clients always submit an empty value.
    if (typeof req.body?.website === "string" && req.body.website.trim()) {
      res.status(202).json({ accepted: true });
      return;
    }

    const parsed = createReportSchema.safeParse(req.body);

    if (!parsed.success) {
      res.status(400).json({
        error: "Invalid report",
        details: parsed.error.flatten(),
      });
      return;
    }

    const input = parsed.data;
    const fingerprint = submissionFingerprint(input);
    const duplicateCutoff = new Date(Date.now() - duplicateWindowMs);
    const [existing] = await db
      .select()
      .from(reportsTable)
      .where(
        and(
          eq(reportsTable.submissionFingerprint, fingerprint),
          gte(reportsTable.createdAt, duplicateCutoff),
        ),
      )
      .orderBy(desc(reportsTable.createdAt))
      .limit(1);

    if (existing) {
      res.status(200).json({ receipt: toReceipt(existing, true) });
      return;
    }

    const reporterContact = input.anonymous
      ? null
      : input.reporterContact?.trim() || null;
    const anonymous = input.anonymous || !reporterContact;

    const created = await db.transaction(async (tx) => {
      const [report] = await tx
        .insert(reportsTable)
        .values({
          ...input,
          anonymous,
          reporterContact: anonymous ? null : reporterContact,
          submissionFingerprint: fingerprint,
          publicationStatus: "pending",
        })
        .returning();

      await tx.insert(moderationEventsTable).values({
        reportId: report.id,
        eventType: "report_submitted",
        actorLabel: "System",
        note: "Report submitted and queued for private moderation review.",
        newValue: "pending",
        metadata: {
          publicId: report.publicId,
          anonymous: report.anonymous,
        },
      });

      return report;
    });

    res.status(201).json({ receipt: toReceipt(created) });
  } catch (error) {
    next(error);
  }
});

reportsRouter.get("/reports", async (req, res, next) => {
  try {
    const requestedLimit = Number.parseInt(String(req.query.limit ?? "100"), 10);
    const limit = Number.isFinite(requestedLimit)
      ? Math.min(Math.max(requestedLimit, 1), 250)
      : 100;

    const reports = await db
      .select()
      .from(reportsTable)
      .where(eq(reportsTable.publicationStatus, "approved"))
      .orderBy(desc(reportsTable.publishedAt), desc(reportsTable.createdAt))
      .limit(limit);

    res.json({ reports: reports.map(toPublicReport) });
  } catch (error) {
    next(error);
  }
});

reportsRouter.get("/reports/:publicId", async (req, res, next) => {
  try {
    const [report] = await db
      .select()
      .from(reportsTable)
      .where(
        and(
          eq(reportsTable.publicId, req.params.publicId),
          eq(reportsTable.publicationStatus, "approved"),
        ),
      )
      .limit(1);

    if (!report) {
      res.status(404).json({ error: "Report not found or not published" });
      return;
    }

    res.json({ report: toPublicReport(report) });
  } catch (error) {
    next(error);
  }
});

export default reportsRouter;
