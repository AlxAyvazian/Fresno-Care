import { Router, type IRouter } from "express";
import { desc, eq } from "drizzle-orm";
import { createReportSchema, db, reportsTable } from "@workspace/db";

const reportsRouter: IRouter = Router();

function toPublicReport(report: typeof reportsTable.$inferSelect) {
  return {
    id: report.publicId,
    publicId: report.publicId,
    createdAt: report.createdAt,
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

    const [created] = await db
      .insert(reportsTable)
      .values({
        ...input,
        anonymous,
        reporterContact: anonymous ? null : reporterContact,
      })
      .returning();

    res.status(201).json({ report: toPublicReport(created) });
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
      .orderBy(desc(reportsTable.createdAt))
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
      .where(eq(reportsTable.publicId, req.params.publicId))
      .limit(1);

    if (!report) {
      res.status(404).json({ error: "Report not found" });
      return;
    }

    res.json({ report: toPublicReport(report) });
  } catch (error) {
    next(error);
  }
});

export default reportsRouter;
