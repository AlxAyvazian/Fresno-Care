import { Router, type IRouter } from "express";
import { desc, eq } from "drizzle-orm";
import {
  db,
  PUBLICATION_STATUSES,
  REPORT_STATUSES,
  reportsTable,
} from "@workspace/db";
import { requireAdmin } from "../middleware/adminAuth";

const adminReportsRouter: IRouter = Router();

type ReportStatus = (typeof REPORT_STATUSES)[number];
type PublicationStatus = (typeof PUBLICATION_STATUSES)[number];

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

adminReportsRouter.patch("/admin/reports/:publicId/status", async (req, res, next) => {
  try {
    const requestedStatus = req.body?.status;

    if (
      typeof requestedStatus !== "string" ||
      !(REPORT_STATUSES as readonly string[]).includes(requestedStatus)
    ) {
      res.status(400).json({
        error: "Invalid status",
        allowedStatuses: REPORT_STATUSES,
      });
      return;
    }

    const status = requestedStatus as ReportStatus;
    const [updated] = await db
      .update(reportsTable)
      .set({ status, updatedAt: new Date() })
      .where(eq(reportsTable.publicId, req.params.publicId))
      .returning();

    if (!updated) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    res.json({ report: toAdminReport(updated) });
  } catch (error) {
    next(error);
  }
});

adminReportsRouter.patch("/admin/reports/:publicId/publication", async (req, res, next) => {
  try {
    const requestedStatus = req.body?.publicationStatus;

    if (
      typeof requestedStatus !== "string" ||
      !(PUBLICATION_STATUSES as readonly string[]).includes(requestedStatus)
    ) {
      res.status(400).json({
        error: "Invalid publication status",
        allowedPublicationStatuses: PUBLICATION_STATUSES,
      });
      return;
    }

    const publicationStatus = requestedStatus as PublicationStatus;
    const now = new Date();
    const [updated] = await db
      .update(reportsTable)
      .set({
        publicationStatus,
        publishedAt: publicationStatus === "approved" ? now : null,
        updatedAt: now,
      })
      .where(eq(reportsTable.publicId, req.params.publicId))
      .returning();

    if (!updated) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    res.json({ report: toAdminReport(updated) });
  } catch (error) {
    next(error);
  }
});

export default adminReportsRouter;
