import { Router, type IRouter } from "express";
import { and, desc, eq } from "drizzle-orm";
import {
  createReportSchema,
  db,
  moderationEventsTable,
  reportsTable,
} from "@workspace/db";

const reportsRouter: IRouter = Router();

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

reportsRouter.post("/reports", async (req, res, next) => {
  try {
    const parsed = createReportSchema.safeParse(req.body);

    if (!parsed.success) {
      res.status(400).json({
        error: "Invalid report",
        details: parsed.error.flatten(),
      });
      return;
    }

    const input = parsed.data;
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
      receipt: {
        publicId: created.publicId,
        createdAt: created.createdAt,
        status: created.status,
        publicationStatus: created.publicationStatus,
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
