import { Router, type IRouter } from "express";
import { desc, eq } from "drizzle-orm";
import { createReportSchema, db, reportsTable } from "@workspace/db";

const reportsRouter: IRouter = Router();

function toPublicReport(report: typeof reportsTable.$inferSelect) {
  return {
    publicId: report.publicId,
    createdAt: report.createdAt,
    animalType: report.animalType,
    animalCount: report.animalCount,
    locationDescription: report.locationDescription,
    neighborhood: report.neighborhood,
    incidentDate: report.incidentDate,
    incidentTime: report.incidentTime,
    immediateDanger: report.immediateDanger,
    concernTypes: report.concernTypes,
    description: report.description,
    evidenceNotes: report.evidenceNotes,
    agenciesContacted: report.agenciesContacted,
    agencyResponse: report.agencyResponse,
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

    const [created] = await db
      .insert(reportsTable)
      .values({
        ...input,
        reporterContact,
      })
      .returning();

    res.status(201).json({ report: toPublicReport(created) });
  } catch (error) {
    next(error);
  }
});

reportsRouter.get("/reports", async (_req, res, next) => {
  try {
    const reports = await db
      .select()
      .from(reportsTable)
      .orderBy(desc(reportsTable.createdAt))
      .limit(250);

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
