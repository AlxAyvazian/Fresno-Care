import { and, eq, isNull, lte, or } from "drizzle-orm";
import {
  db,
  reportDeliveriesTable,
  reportsTable,
} from "@workspace/db";
import { deliverReportToAgencies } from "./reportDelivery";
import { logger } from "./logger";

const DEFAULT_WORKER_INTERVAL_MS = 60_000;
const DEFAULT_DELIVERY_GRACE_MS = 2 * 60_000;

function positiveInteger(value: string | undefined, fallback: number): number {
  const parsed = Number.parseInt(value ?? "", 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

let workerRunning = false;

async function processUnsentReports(): Promise<void> {
  if (workerRunning) return;
  workerRunning = true;

  try {
    const graceMs = positiveInteger(
      process.env.REPORT_DELIVERY_GRACE_MS,
      DEFAULT_DELIVERY_GRACE_MS,
    );
    const cutoff = new Date(Date.now() - graceMs);

    const pending = await db
      .selectDistinct({ reportId: reportsTable.id })
      .from(reportsTable)
      .leftJoin(
        reportDeliveriesTable,
        eq(reportDeliveriesTable.reportId, reportsTable.id),
      )
      .where(
        and(
          lte(reportsTable.createdAt, cutoff),
          or(
            isNull(reportDeliveriesTable.id),
            eq(reportDeliveriesTable.status, "pending"),
          ),
        ),
      )
      .orderBy(reportsTable.createdAt)
      .limit(20);

    for (const item of pending) {
      try {
        await deliverReportToAgencies(item.reportId);
      } catch (error) {
        logger.error(
          { err: error, reportId: item.reportId },
          "Automatic agency delivery recovery failed",
        );
      }
    }
  } finally {
    workerRunning = false;
  }
}

export function startReportDeliveryRecoveryWorker(): () => void {
  const intervalMs = positiveInteger(
    process.env.REPORT_DELIVERY_WORKER_INTERVAL_MS,
    DEFAULT_WORKER_INTERVAL_MS,
  );
  const timer = setInterval(() => {
    void processUnsentReports();
  }, intervalMs);
  timer.unref();

  void processUnsentReports();
  return () => clearInterval(timer);
}
