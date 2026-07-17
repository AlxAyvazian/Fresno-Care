import { createHash } from "node:crypto";
import express, { Router, type IRouter } from "express";
import { and, desc, eq, gte } from "drizzle-orm";
import {
  createReportSchema,
  db,
  moderationEventsTable,
  reportEvidenceTable,
  reportsTable,
} from "@workspace/db";
import {
  ALLOWED_EVIDENCE_TYPES,
  contentMatchesMime,
  MAX_EVIDENCE_FILES,
  MAX_EVIDENCE_FILE_BYTES,
  MAX_EVIDENCE_TOTAL_BYTES,
  sanitizeEvidenceFilename,
} from "../lib/evidence";
import { deliverReportToAgencies } from "../lib/reportDelivery";
import {
  createReportUploadToken,
  verifyReportUploadToken,
} from "../lib/reportUploadToken";
import { intakeRateLimit } from "../middleware/rateLimit";

const reportsRouter: IRouter = Router();

function routeParam(value: string | string[] | undefined): string {
  return Array.isArray(value) ? value[0] ?? "" : value ?? "";
}

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

function toReceipt(
  report: typeof reportsTable.$inferSelect,
  options: {
    deduplicated?: boolean;
    evidenceUploadToken?: string | null;
    deliveryStatus?: "pending" | "sent" | "failed" | "not_configured";
    evidenceUploaded?: number;
  } = {},
) {
  return {
    publicId: report.publicId,
    createdAt: report.createdAt,
    status: report.status,
    publicationStatus: report.publicationStatus,
    deduplicated: options.deduplicated ?? false,
    evidenceUploadToken: options.evidenceUploadToken ?? null,
    evidenceUploaded: options.evidenceUploaded ?? 0,
    deliveryStatus: options.deliveryStatus ?? "pending",
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
      res.status(200).json({ receipt: toReceipt(existing, { deduplicated: true }) });
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

    res.status(201).json({
      receipt: toReceipt(created, {
        evidenceUploadToken: createReportUploadToken(String(created.publicId)),
      }),
    });
  } catch (error) {
    next(error);
  }
});

reportsRouter.post(
  "/reports/:publicId/evidence",
  intakeRateLimit,
  express.raw({ type: () => true, limit: MAX_EVIDENCE_FILE_BYTES }),
  async (req, res, next) => {
    try {
      const publicId = routeParam(req.params.publicId);
      const token = req.header("x-evidence-token") ?? "";
      if (!verifyReportUploadToken(token, publicId)) {
        res.status(401).json({ error: "Evidence upload authorization is invalid or expired" });
        return;
      }

      const content = Buffer.isBuffer(req.body) ? req.body : Buffer.alloc(0);
      const mimeType = (req.header("content-type") ?? "").split(";", 1)[0].trim().toLowerCase();
      const originalName = sanitizeEvidenceFilename(
        decodeURIComponent(req.header("x-file-name") ?? "evidence"),
      );

      if (!content.length) {
        res.status(400).json({ error: "Evidence file is empty" });
        return;
      }
      if (!ALLOWED_EVIDENCE_TYPES.has(mimeType)) {
        res.status(415).json({ error: "Unsupported evidence type. Use JPEG, PNG, WebP, PDF, or MP4." });
        return;
      }
      if (!contentMatchesMime(content, mimeType)) {
        res.status(400).json({ error: "Evidence file content does not match its declared type" });
        return;
      }

      const [report] = await db
        .select({ id: reportsTable.id, publicId: reportsTable.publicId })
        .from(reportsTable)
        .where(eq(reportsTable.publicId, publicId))
        .limit(1);
      if (!report) {
        res.status(404).json({ error: "Report not found" });
        return;
      }

      const existingEvidence = await db
        .select({
          id: reportEvidenceTable.id,
          sha256: reportEvidenceTable.sha256,
          sizeBytes: reportEvidenceTable.sizeBytes,
        })
        .from(reportEvidenceTable)
        .where(eq(reportEvidenceTable.reportId, report.id));
      if (existingEvidence.length >= MAX_EVIDENCE_FILES) {
        res.status(400).json({ error: `A report may contain at most ${MAX_EVIDENCE_FILES} evidence files` });
        return;
      }
      const existingBytes = existingEvidence.reduce((sum, item) => sum + item.sizeBytes, 0);
      if (existingBytes + content.length > MAX_EVIDENCE_TOTAL_BYTES) {
        res.status(400).json({ error: "Evidence exceeds the 30 MB total report limit" });
        return;
      }

      const sha256 = createHash("sha256").update(content).digest("hex");
      const duplicate = existingEvidence.find((item) => item.sha256 === sha256);
      if (duplicate) {
        res.status(200).json({
          evidence: {
            id: duplicate.id,
            originalName,
            mimeType,
            sizeBytes: content.length,
            deduplicated: true,
          },
        });
        return;
      }

      const evidence = await db.transaction(async (tx) => {
        const [created] = await tx
          .insert(reportEvidenceTable)
          .values({
            reportId: report.id,
            originalName,
            mimeType,
            sizeBytes: content.length,
            sha256,
            validationStatus: "accepted",
            content,
          })
          .returning();
        await tx.insert(moderationEventsTable).values({
          reportId: report.id,
          eventType: "evidence_uploaded",
          actorLabel: "Reporter",
          note: `Private evidence uploaded: ${originalName}`,
          metadata: {
            publicId: report.publicId,
            evidenceId: created.id,
            mimeType,
            sizeBytes: content.length,
          },
        });
        return created;
      });

      res.status(201).json({
        evidence: {
          id: evidence.id,
          originalName: evidence.originalName,
          mimeType: evidence.mimeType,
          sizeBytes: evidence.sizeBytes,
          createdAt: evidence.createdAt,
          deduplicated: false,
        },
      });
    } catch (error) {
      next(error);
    }
  },
);

reportsRouter.post("/reports/:publicId/finalize", intakeRateLimit, async (req, res, next) => {
  try {
    const publicId = routeParam(req.params.publicId);
    const token = req.header("x-evidence-token") ?? "";
    if (!verifyReportUploadToken(token, publicId)) {
      res.status(401).json({ error: "Submission authorization is invalid or expired" });
      return;
    }

    const [report] = await db
      .select()
      .from(reportsTable)
      .where(eq(reportsTable.publicId, publicId))
      .limit(1);
    if (!report) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    const evidence = await db
      .select({ id: reportEvidenceTable.id })
      .from(reportEvidenceTable)
      .where(eq(reportEvidenceTable.reportId, report.id));
    const delivery = await deliverReportToAgencies(report.id);
    const [updated] = await db
      .select()
      .from(reportsTable)
      .where(eq(reportsTable.id, report.id))
      .limit(1);

    res.json({
      receipt: toReceipt(updated ?? report, {
        deliveryStatus: delivery.status,
        evidenceUploaded: evidence.length,
      }),
      delivery: {
        status: delivery.status,
        recipientCount: delivery.recipients.length,
        error: delivery.error,
      },
    });
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
    const publicId = routeParam(req.params.publicId);
    const [report] = await db
      .select()
      .from(reportsTable)
      .where(
        and(
          eq(reportsTable.publicId, publicId),
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
