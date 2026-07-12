import { Router, type IRouter } from "express";
import { desc, eq } from "drizzle-orm";
import { z } from "zod/v4";
import {
  db,
  moderationEventsTable,
  PUBLICATION_STATUSES,
  REPORT_STATUSES,
  reportsTable,
} from "@workspace/db";
import { requireAdmin } from "../middleware/adminAuth";

const adminReportsRouter: IRouter = Router();

const actorSchema = z.string().trim().min(1).max(100);
const optionalNoteSchema = z.string().trim().max(2000).optional();

const statusChangeSchema = z.object({
  status: z.enum(REPORT_STATUSES),
  actorLabel: actorSchema,
  note: optionalNoteSchema,
});

const publicationChangeSchema = z.object({
  publicationStatus: z.enum(PUBLICATION_STATUSES),
  actorLabel: actorSchema,
  note: optionalNoteSchema,
});

const noteSchema = z.object({
  actorLabel: actorSchema,
  note: z.string().trim().min(1).max(2000),
});

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

function validationError(res: Parameters<IRouter["use"]>[0] extends never ? never : any, details: unknown) {
  res.status(400).json({ error: "Invalid moderation request", details });
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
    const [report] = await db
      .select({ id: reportsTable.id })
      .from(reportsTable)
      .where(eq(reportsTable.publicId, req.params.publicId))
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

adminReportsRouter.post("/admin/reports/:publicId/notes", async (req, res, next) => {
  try {
    const parsed = noteSchema.safeParse(req.body);
    if (!parsed.success) {
      res.status(400).json({
        error: "Invalid moderation note",
        details: parsed.error.flatten(),
      });
      return;
    }

    const event = await db.transaction(async (tx) => {
      const [report] = await tx
        .select({ id: reportsTable.id, publicId: reportsTable.publicId })
        .from(reportsTable)
        .where(eq(reportsTable.publicId, req.params.publicId))
        .limit(1);

      if (!report) return null;

      const [created] = await tx
        .insert(moderationEventsTable)
        .values({
          reportId: report.id,
          eventType: "note_added",
          actorLabel: parsed.data.actorLabel,
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
});

adminReportsRouter.patch("/admin/reports/:publicId/status", async (req, res, next) => {
  try {
    const parsed = statusChangeSchema.safeParse(req.body);
    if (!parsed.success) {
      res.status(400).json({
        error: "Invalid status change",
        details: parsed.error.flatten(),
      });
      return;
    }

    const result = await db.transaction(async (tx) => {
      const [current] = await tx
        .select()
        .from(reportsTable)
        .where(eq(reportsTable.publicId, req.params.publicId))
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
        actorLabel: parsed.data.actorLabel,
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
});

adminReportsRouter.patch("/admin/reports/:publicId/publication", async (req, res, next) => {
  try {
    const parsed = publicationChangeSchema.safeParse(req.body);
    if (!parsed.success) {
      res.status(400).json({
        error: "Invalid publication change",
        details: parsed.error.flatten(),
      });
      return;
    }

    const result = await db.transaction(async (tx) => {
      const [current] = await tx
        .select()
        .from(reportsTable)
        .where(eq(reportsTable.publicId, req.params.publicId))
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
        actorLabel: parsed.data.actorLabel,
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
});

export default adminReportsRouter;
