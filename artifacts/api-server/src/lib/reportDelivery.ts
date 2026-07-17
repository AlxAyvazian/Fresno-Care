import { and, desc, eq, lte } from "drizzle-orm";
import {
  db,
  moderationEventsTable,
  reportDeliveriesTable,
  reportEvidenceTable,
  reportsTable,
} from "@workspace/db";
import { logger } from "./logger";

const DEFAULT_MAX_ATTACHMENT_BYTES = 10 * 1024 * 1024;
const DEFAULT_WORKER_INTERVAL_MS = 60_000;
const DEFAULT_DELIVERY_GRACE_MS = 2 * 60_000;

function positiveInteger(value: string | undefined, fallback: number): number {
  const parsed = Number.parseInt(value ?? "", 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

function splitEmails(value: string | undefined): string[] {
  return (value ?? "")
    .split(/[;,\n]/)
    .map((email) => email.trim().toLowerCase())
    .filter((email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email));
}

export function configuredReportRecipients(): string[] {
  const values = [
    process.env.REPORT_TO_ANIMAL_CENTER,
    process.env.REPORT_TO_POLICE,
    process.env.REPORT_TO_COUNCIL,
    process.env.REPORT_TO_CITY,
    process.env.REPORT_NOTIFICATION_RECIPIENTS,
  ].flatMap(splitEmails);
  return [...new Set(values)];
}

export function buildReportDeliverySubject(publicId: string, inDanger: string): string {
  const urgency = inDanger === "yes" ? "URGENT " : "";
  return `${urgency}Resident animal-welfare report ${publicId}`;
}

function escapeHtml(value: string): string {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function reportText(report: typeof reportsTable.$inferSelect, attachmentNote: string): string {
  const includeContact = process.env.REPORT_INCLUDE_REPORTER_CONTACT === "true";
  return [
    "VoiceMap Fresno resident-submitted animal-welfare report",
    "",
    "This message documents a resident report. It is not a legal finding or a determination of wrongdoing.",
    "",
    `Report ID: ${report.publicId}`,
    `Submitted: ${report.createdAt.toISOString()}`,
    `Animal: ${report.animalType} (${report.count})`,
    `Immediate danger reported: ${report.inDanger}`,
    `Precise location: ${report.location}`,
    `Neighborhood: ${report.neighborhood}`,
    `Observed: ${report.dateObserved}${report.timeObserved ? ` at ${report.timeObserved}` : ""}`,
    `Concerns: ${report.concernTypes.join(", ")}`,
    "",
    "Direct observation:",
    report.description,
    "",
    report.evidenceNotes ? `Evidence notes:\n${report.evidenceNotes}\n` : "",
    report.agenciesContacted ? `Agencies already contacted: ${report.agenciesContacted}` : "",
    report.responseReceived ? `Response already received: ${report.responseReceived}` : "",
    includeContact && report.reporterContact ? `Reporter contact (private): ${report.reporterContact}` : "Reporter contact was not included.",
    "",
    attachmentNote,
  ].filter(Boolean).join("\n");
}

function reportHtml(report: typeof reportsTable.$inferSelect, attachmentNote: string): string {
  const includeContact = process.env.REPORT_INCLUDE_REPORTER_CONTACT === "true";
  const row = (label: string, value: string) => `<tr><th style="text-align:left;padding:8px;border-bottom:1px solid #dbe3ee">${escapeHtml(label)}</th><td style="padding:8px;border-bottom:1px solid #dbe3ee">${escapeHtml(value)}</td></tr>`;
  return `
    <div style="font-family:Arial,sans-serif;color:#142b4a;line-height:1.5;max-width:760px">
      <h1 style="font-size:22px">VoiceMap Fresno resident report</h1>
      <p style="padding:12px;background:#fff4d6;border-left:4px solid #d59a22"><strong>Notice:</strong> This is a resident-submitted report. It is not a legal finding or a determination of wrongdoing.</p>
      <table style="border-collapse:collapse;width:100%;margin:18px 0">
        ${row("Report ID", String(report.publicId))}
        ${row("Submitted", report.createdAt.toISOString())}
        ${row("Animal", `${report.animalType} (${report.count})`)}
        ${row("Immediate danger reported", report.inDanger)}
        ${row("Precise location", report.location)}
        ${row("Neighborhood", report.neighborhood)}
        ${row("Observed", `${report.dateObserved}${report.timeObserved ? ` at ${report.timeObserved}` : ""}`)}
        ${row("Concerns", report.concernTypes.join(", "))}
      </table>
      <h2 style="font-size:17px">Direct observation</h2>
      <p style="white-space:pre-wrap">${escapeHtml(report.description)}</p>
      ${report.evidenceNotes ? `<h2 style="font-size:17px">Evidence notes</h2><p style="white-space:pre-wrap">${escapeHtml(report.evidenceNotes)}</p>` : ""}
      ${report.agenciesContacted ? `<p><strong>Agencies already contacted:</strong> ${escapeHtml(report.agenciesContacted)}</p>` : ""}
      ${report.responseReceived ? `<p><strong>Response already received:</strong> ${escapeHtml(report.responseReceived)}</p>` : ""}
      <p><strong>Reporter contact:</strong> ${includeContact && report.reporterContact ? escapeHtml(report.reporterContact) : "Not included"}</p>
      <p>${escapeHtml(attachmentNote)}</p>
    </div>
  `;
}

export type DeliveryResult = {
  status: "pending" | "sent" | "failed" | "not_configured";
  recipients: string[];
  providerMessageId: string | null;
  error: string | null;
};

export async function deliverReportToAgencies(reportId: string): Promise<DeliveryResult> {
  const [report] = await db
    .select()
    .from(reportsTable)
    .where(eq(reportsTable.id, reportId))
    .limit(1);
  if (!report) throw new Error("Report not found for delivery");

  const [existing] = await db
    .select()
    .from(reportDeliveriesTable)
    .where(eq(reportDeliveriesTable.reportId, report.id))
    .orderBy(desc(reportDeliveriesTable.createdAt))
    .limit(1);

  if (existing?.status === "sent") {
    return {
      status: "sent",
      recipients: existing.recipients,
      providerMessageId: existing.providerMessageId,
      error: null,
    };
  }

  const recipients = configuredReportRecipients();
  const subject = buildReportDeliverySubject(String(report.publicId), report.inDanger);
  const now = new Date();
  const [delivery] = existing
    ? await db
        .update(reportDeliveriesTable)
        .set({
          status: "pending",
          recipients,
          subject,
          updatedAt: now,
          attempts: existing.attempts + 1,
          lastAttemptAt: now,
          lastError: null,
        })
        .where(eq(reportDeliveriesTable.id, existing.id))
        .returning()
    : await db
        .insert(reportDeliveriesTable)
        .values({
          reportId: report.id,
          status: "pending",
          recipients,
          subject,
          attempts: 1,
          lastAttemptAt: now,
        })
        .returning();

  const apiKey = process.env.RESEND_API_KEY?.trim();
  const from = process.env.REPORT_FROM_EMAIL?.trim();
  if (!apiKey || !from || recipients.length === 0) {
    const missing = [
      !apiKey ? "RESEND_API_KEY" : "",
      !from ? "REPORT_FROM_EMAIL" : "",
      recipients.length === 0 ? "agency recipient variables" : "",
    ].filter(Boolean).join(", ");
    const error = `Automatic agency delivery is not configured: ${missing}`;
    await db.transaction(async (tx) => {
      await tx
        .update(reportDeliveriesTable)
        .set({ status: "not_configured", updatedAt: new Date(), lastError: error })
        .where(eq(reportDeliveriesTable.id, delivery.id));
      await tx.insert(moderationEventsTable).values({
        reportId: report.id,
        eventType: "notification_failed",
        actorLabel: "System",
        note: error,
        newValue: "not_configured",
        metadata: { publicId: report.publicId },
      });
    });
    return { status: "not_configured", recipients, providerMessageId: null, error };
  }

  const evidence = await db
    .select()
    .from(reportEvidenceTable)
    .where(eq(reportEvidenceTable.reportId, report.id))
    .orderBy(reportEvidenceTable.createdAt);
  const maxAttachmentBytes = positiveInteger(
    process.env.REPORT_MAX_EMAIL_ATTACHMENT_BYTES,
    DEFAULT_MAX_ATTACHMENT_BYTES,
  );
  let attachmentBytes = 0;
  const attachments: Array<{ filename: string; content: string }> = [];
  for (const file of evidence) {
    if (attachmentBytes + file.sizeBytes > maxAttachmentBytes) break;
    attachmentBytes += file.sizeBytes;
    attachments.push({
      filename: file.originalName,
      content: file.content.toString("base64"),
    });
  }
  const attachmentNote = evidence.length === 0
    ? "No evidence files were uploaded."
    : attachments.length === evidence.length
      ? `${attachments.length} evidence file(s) are attached.`
      : `${attachments.length} of ${evidence.length} evidence file(s) are attached because of email size limits. All files remain stored privately for authorized review.`;

  try {
    const response = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${apiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from,
        to: recipients,
        reply_to: process.env.REPORT_REPLY_TO?.trim() || undefined,
        subject,
        text: reportText(report, attachmentNote),
        html: reportHtml(report, attachmentNote),
        attachments: attachments.length ? attachments : undefined,
      }),
      signal: AbortSignal.timeout(20_000),
    });
    const payload = (await response.json().catch(() => null)) as { id?: string; message?: string } | null;
    if (!response.ok || !payload?.id) {
      throw new Error(payload?.message || `Email provider returned ${response.status}`);
    }

    await db.transaction(async (tx) => {
      await tx
        .update(reportDeliveriesTable)
        .set({
          status: "sent",
          updatedAt: new Date(),
          providerMessageId: payload.id,
          lastError: null,
        })
        .where(eq(reportDeliveriesTable.id, delivery.id));
      if (report.status === "submitted") {
        await tx
          .update(reportsTable)
          .set({ status: "routed", updatedAt: new Date() })
          .where(eq(reportsTable.id, report.id));
      }
      await tx.insert(moderationEventsTable).values({
        reportId: report.id,
        eventType: "notification_sent",
        actorLabel: "System",
        note: `Report emailed to ${recipients.length} configured agency recipient(s).`,
        previousValue: report.status,
        newValue: report.status === "submitted" ? "routed" : report.status,
        metadata: {
          publicId: report.publicId,
          recipientCount: recipients.length,
          evidenceCount: attachments.length,
        },
      });
    });

    return { status: "sent", recipients, providerMessageId: payload.id, error: null };
  } catch (sendError) {
    const error = sendError instanceof Error ? sendError.message : "Agency email delivery failed";
    await db.transaction(async (tx) => {
      await tx
        .update(reportDeliveriesTable)
        .set({ status: "failed", updatedAt: new Date(), lastError: error })
        .where(eq(reportDeliveriesTable.id, delivery.id));
      await tx.insert(moderationEventsTable).values({
        reportId: report.id,
        eventType: "notification_failed",
        actorLabel: "System",
        note: error,
        newValue: "failed",
        metadata: { publicId: report.publicId, recipientCount: recipients.length },
      });
    });
    return { status: "failed", recipients, providerMessageId: null, error };
  }
}

let workerRunning = false;

async function processPendingDeliveries(): Promise<void> {
  if (workerRunning) return;
  workerRunning = true;
  try {
    const graceMs = positiveInteger(
      process.env.REPORT_DELIVERY_GRACE_MS,
      DEFAULT_DELIVERY_GRACE_MS,
    );
    const cutoff = new Date(Date.now() - graceMs);
    const pending = await db
      .select({ reportId: reportDeliveriesTable.reportId })
      .from(reportDeliveriesTable)
      .where(
        and(
          eq(reportDeliveriesTable.status, "pending"),
          lte(reportDeliveriesTable.createdAt, cutoff),
        ),
      )
      .orderBy(reportDeliveriesTable.createdAt)
      .limit(20);

    for (const item of pending) {
      try {
        await deliverReportToAgencies(item.reportId);
      } catch (error) {
        logger.error({ err: error, reportId: item.reportId }, "Pending agency delivery failed");
      }
    }
  } finally {
    workerRunning = false;
  }
}

export function startReportDeliveryWorker(): () => void {
  const intervalMs = positiveInteger(
    process.env.REPORT_DELIVERY_WORKER_INTERVAL_MS,
    DEFAULT_WORKER_INTERVAL_MS,
  );
  const timer = setInterval(() => {
    void processPendingDeliveries();
  }, intervalMs);
  timer.unref();
  void processPendingDeliveries();
  return () => clearInterval(timer);
}
