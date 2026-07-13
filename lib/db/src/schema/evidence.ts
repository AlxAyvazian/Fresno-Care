import {
  customType,
  index,
  integer,
  jsonb,
  pgEnum,
  pgTable,
  text,
  timestamp,
  uuid,
} from "drizzle-orm/pg-core";
import { reportsTable } from "./reports";

const bytea = customType<{ data: Buffer; driverData: Buffer }>({
  dataType() {
    return "bytea";
  },
  toDriver(value) {
    return value;
  },
  fromDriver(value) {
    return Buffer.isBuffer(value) ? value : Buffer.from(value);
  },
});

export const EVIDENCE_VALIDATION_STATUSES = ["accepted", "rejected"] as const;
export const evidenceValidationStatusEnum = pgEnum(
  "evidence_validation_status",
  EVIDENCE_VALIDATION_STATUSES,
);

export const reportEvidenceTable = pgTable(
  "report_evidence",
  {
    id: uuid("id").defaultRandom().primaryKey(),
    reportId: uuid("report_id")
      .notNull()
      .references(() => reportsTable.id, { onDelete: "cascade" }),
    createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
    originalName: text("original_name").notNull(),
    mimeType: text("mime_type").notNull(),
    sizeBytes: integer("size_bytes").notNull(),
    sha256: text("sha256").notNull(),
    validationStatus: evidenceValidationStatusEnum("validation_status")
      .default("accepted")
      .notNull(),
    content: bytea("content").notNull(),
  },
  (table) => [
    index("report_evidence_report_created_idx").on(table.reportId, table.createdAt),
    index("report_evidence_report_sha_idx").on(table.reportId, table.sha256),
  ],
);

export const DELIVERY_STATUSES = [
  "pending",
  "sent",
  "failed",
  "not_configured",
] as const;
export const reportDeliveryStatusEnum = pgEnum(
  "report_delivery_status",
  DELIVERY_STATUSES,
);

export const reportDeliveriesTable = pgTable(
  "report_deliveries",
  {
    id: uuid("id").defaultRandom().primaryKey(),
    reportId: uuid("report_id")
      .notNull()
      .references(() => reportsTable.id, { onDelete: "cascade" }),
    createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).defaultNow().notNull(),
    status: reportDeliveryStatusEnum("status").default("pending").notNull(),
    recipients: jsonb("recipients").$type<string[]>().default([]).notNull(),
    subject: text("subject").notNull(),
    provider: text("provider").default("resend").notNull(),
    providerMessageId: text("provider_message_id"),
    attempts: integer("attempts").default(0).notNull(),
    lastAttemptAt: timestamp("last_attempt_at", { withTimezone: true }),
    lastError: text("last_error"),
  },
  (table) => [
    index("report_deliveries_report_created_idx").on(table.reportId, table.createdAt),
    index("report_deliveries_status_updated_idx").on(table.status, table.updatedAt),
  ],
);

export type ReportEvidenceRecord = typeof reportEvidenceTable.$inferSelect;
export type ReportDeliveryRecord = typeof reportDeliveriesTable.$inferSelect;
