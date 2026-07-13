import { Router, type IRouter } from "express";
import { desc, eq } from "drizzle-orm";
import {
  db,
  moderationEventsTable,
  moderationNoteSchema,
  moderationPublicationChangeSchema,
  moderationStatusChangeSchema,
  reportDeliveriesTable,
  reportEvidenceTable,
  reportsTable,
} from "@workspace/db";
import { deliverReportToAgencies } from "../lib/reportDelivery";
import { requireAdmin, requireAdminCsrf } from "../middleware/adminAuth";

const adminReportsRouter: IRouter = Router();

function routeParam(value: string | string[] | undefined): string {
  return Array.isArray(value) ? value[0] ?? "" : value ?? "";
}

function toAdminReport(report: typeof reportsTable.$inferSelect) {
  return {
    id: report.id,
    publicId: report.publicId,
    createdAt: report.createdAt,
    updatedAt: report.updatedAt,
    publishedAt: report.publishedAt,
    animalType: report.animalType,
    count: report.count,
    location: report.location,
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
    reporterContact: report.reporterContact,
    status: report.status,
    publicationStatus: report.publicationStatus,
  };
}

function toModerationEvent(event: typeof moderationEventsTable.$inferSelect) {
  return {
    id: event.id,
    createdAt: event.createdAt,
    eventType: event.eventType,
    actorLabel: event.actorLabel,
    note: event.note,
    previousValue: event.previousValue,
    newValue: event.newValue,
    metadata: event.metadata,
  };
}

function toEvidence(evidence: typeof reportEvidenceTable.$inferSelect) {
  return {
    id: evidence.id,
    createdAt: evidence.createdAt,
    originalName: evidence.originalName,
    mimeType: evidence.mimeType,
    sizeBytes: evidence.sizeBytes,
    sha256: evidence.sha256,
    validationStatus: evidence.validationStatus,
  };
}

function toDelivery(delivery: typeof reportDeliveriesTable.$inferSelect | undefined) {
  if (!delivery) return null;
  return {
    id: delivery.id,
    createdAt: delivery.createdAt,
    updatedAt: delivery.updatedAt,
    status: delivery.status,
    recipients: delivery.recipients,
    subject: delivery.subject,
    provider: delivery.provider,
    providerMessageId: delivery.providerMessageId,
    attempts: delivery.attempts,
    lastAttemptAt: delivery.lastAttemptAt,
    lastError: delivery.lastError,
  };
}

function actor(res: Parameters<typeof requireAdmin>[1]): string {
  return res.locals.adminActor || "Administrator";
}

adminReportsRouter.use(requireAdmin);

adminReportsRouter.get("/admin/reports", async (req, res, next) => {
  try {
    const requestedLimit = Number.parseInt(String(req.query.limit ?? "100"), 10);
    const limit = Number.isFinite(requestedLimit)
      ? Math.min(Math.max(requestedLimit, 1), 250)
      : 100;

    const reports = await db
      .select()
      .from(reportsTable)
      .orderBy(desc(reportsTable.createdAt))
      .limit(limit);

    res.json({ reports: reports.map(toAdminReport) });
  } catch (error) {
    next(error);
  }
});

adminReportsRouter.get("/admin/reports/:publicId/events", async (req, res, next) => {
  try {
    const publicId = routeParam(req.params.publicId);
    const [report] = await db
      .select({ id: reportsTable.id })
      .from(reportsTable)
      .where(eq(reportsTable.publicId, publicId))
      .limit(1);

    if (!report) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    const events = await db
      .select()
      .from(moderationEventsTable)
      .where(eq(moderationEventsTable.reportId, report.id))
      .orderBy(desc(moderationEventsTable.createdAt));

    res.json({ events: events.map(toModerationEvent) });
  } catch (error) {
    next(error);
  }
});

adminReportsRouter.get("/admin/reports/:publicId/evidence", async (req, res, next) => {
  try {
    const publicId = routeParam(req.params.publicId);
    const [report] = await db
      .select({ id: reportsTable.id })
      .from(reportsTable)
      .where(eq(reportsTable.publicId, publicId))
      .limit(1);
    if (!report) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    const evidence = await db
      .select()
      .from(reportEvidenceTable)
      .where(eq(reportEvidenceTable.reportId, report.id))
      .orderBy(desc(reportEvidenceTable.createdAt));
    res.json({ evidence: evidence.map(toEvidence) });
  } catch (error) {
    next(error);
  }
});

adminReportsRouter.get("/admin/evidence/:evidenceId", async (req, res, next) => {
  try {
    const evidenceId = routeParam(req.params.evidenceId);
    const [evidence] = await db
      .select()
      .from(reportEvidenceTable)
      .where(eq(reportEvidenceTable.id, evidenceId))
      .limit(1);
    if (!evidence) {
      res.status(404).json({ error: "Evidence not found" });
      return;
    }

    const safeName = evidence.originalName.replace(/["\r\n]/g, "_");
    res.setHeader("Cache-Control", "no-store, private");
    res.setHeader("Content-Type", evidence.mimeType);
    res.setHeader("Content-Length", String(evidence.sizeBytes));
    res.setHeader("Content-Disposition", `attachment; filename="${safeName}"`);
    res.send(evidence.content);
  } catch (error) {
    next(error);
  }
});

adminReportsRouter.get("/admin/reports/:publicId/delivery", async (req, res, next) => {
  try {
    const publicId = routeParam(req.params.publicId);
    const [report] = await db
      .select({ id: reportsTable.id })
      .from(reportsTable)
      .where(eq(reportsTable.publicId, publicId))
      .limit(1);
    if (!report) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    const [delivery] = await db
      .select()
      .from(reportDeliveriesTable)
      .where(eq(reportDeliveriesTable.reportId, report.id))
      .orderBy(desc(reportDeliveriesTable.createdAt))
      .limit(1);
    res.json({ delivery: toDelivery(delivery) });
  } catch (error) {
    next(error);
  }
});

adminReportsRouter.post(
  "/admin/reports/:publicId/delivery/retry",
  requireAdminCsrf,
  async (req, res, next) => {
    try {
      const publicId = routeParam(req.params.publicId);
      const [report] = await db
        .select({ id: reportsTable.id })
        .from(reportsTable)
        .where(eq(reportsTable.publicId, publicId))
        .limit(1);
      if (!report) {
        res.status(404).json({ error: "Report not found" });
        return;
      }

      const delivery = await deliverReportToAgencies(report.id);
      res.json({ delivery });
    } catch (error) {
      next(error);
    }
  },
);

adminReportsRouter.post(
  "/admin/reports/:publicId/notes",
  requireAdminCsrf,
  async (req, res, next) => {
    try {
      const parsed = moderationNoteSchema.safeParse(req.body);
      if (!parsed.success) {
        res.status(400).json({
          error: "Invalid moderation note",
          details: parsed.error.flatten(),
        });
        return;
      }

      const publicId = routeParam(req.params.publicId);
      const event = await db.transaction(async (tx) => {
        const [report] = await tx
          .select({ id: reportsTable.id, publicId: reportsTable.publicId })
          .from(reportsTable)
          .where(eq(reportsTable.publicId, publicId))
          .limit(1);

        if (!report) return null;

        const [created] = await tx
          .insert(moderationEventsTable)
          .values({
            reportId: report.id,
            eventType: "note_added",
            actorLabel: actor(res),
            note: parsed.data.note,
            metadata: { publicId: report.publicId },
          })
          .returning();

        return created;
      });

      if (!event) {
        res.status(404).json({ error: "Report not found" });
        return;
      }

      res.status(201).json({ event: toModerationEvent(event) });
    } catch (error) {
      next(error);
    }
  },
);

adminReportsRouter.patch(
  "/admin/reports/:publicId/status",
  requireAdminCsrf,
  async (req, res, next) => {
    try {
      const parsed = moderationStatusChangeSchema.safeParse(req.body);
      if (!parsed.success) {
        res.status(400).json({
          error: "Invalid status change",
          details: parsed.error.flatten(),
        });
        return;
      }

      const publicId = routeParam(req.params.publicId);
      const result = await db.transaction(async (tx) => {
        const [current] = await tx
          .select()
          .from(reportsTable)
          .where(eq(reportsTable.publicId, publicId))
          .limit(1);

        if (!current) return null;
        if (current.status === parsed.data.status) return current;

        const now = new Date();
        const [updated] = await tx
          .update(reportsTable)
          .set({ status: parsed.data.status, updatedAt: now })
          .where(eq(reportsTable.id, current.id))
          .returning();

        await tx.insert(moderationEventsTable).values({
          reportId: current.id,
          eventType: "case_status_changed",
          actorLabel: actor(res),
          note: parsed.data.note?.trim() || null,
          previousValue: current.status,
          newValue: parsed.data.status,
          metadata: { publicId: current.publicId },
        });

        return updated;
      });

      if (!result) {
        res.status(404).json({ error: "Report not found" });
        return;
      }

      res.json({ report: toAdminReport(result) });
    } catch (error) {
      next(error);
    }
  },
);

adminReportsRouter.patch(
  "/admin/reports/:publicId/publication",
  requireAdminCsrf,
  async (req, res, next) => {
    try {
      const parsed = moderationPublicationChangeSchema.safeParse(req.body);
      if (!parsed.success) {
        res.status(400).json({
          error: "Invalid publication change",
          details: parsed.error.flatten(),
        });
        return;
      }

      const publicId = routeParam(req.params.publicId);
      const result = await db.transaction(async (tx) => {
        const [current] = await tx
          .select()
          .from(reportsTable)
          .where(eq(reportsTable.publicId, publicId))
          .limit(1);

        if (!current) return null;
        if (current.publicationStatus === parsed.data.publicationStatus) return current;

        const now = new Date();
        const [updated] = await tx
          .update(reportsTable)
          .set({
            publicationStatus: parsed.data.publicationStatus,
            publishedAt: parsed.data.publicationStatus === "approved" ? now : null,
            updatedAt: now,
          })
          .where(eq(reportsTable.id, current.id))
          .returning();

        await tx.insert(moderationEventsTable).values({
          reportId: current.id,
          eventType: "publication_status_changed",
          actorLabel: actor(res),
          note: parsed.data.note?.trim() || null,
          previousValue: current.publicationStatus,
          newValue: parsed.data.publicationStatus,
          metadata: { publicId: current.publicId },
        });

        return updated;
      });

      if (!result) {
        res.status(404).json({ error: "Report not found" });
        return;
      }

      res.json({ report: toAdminReport(result) });
    } catch (error) {
      next(error);
    }
  },
);

export default adminReportsRouter;
