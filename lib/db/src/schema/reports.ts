import {
  boolean,
  jsonb,
  pgEnum,
  pgTable,
  text,
  timestamp,
  uuid,
} from "drizzle-orm/pg-core";
import { createInsertSchema } from "drizzle-zod";
import { z } from "zod/v4";

export const reportStatusEnum = pgEnum("report_status", [
  "submitted",
  "under_review",
  "referred",
  "resolved",
  "closed",
]);

export const reportsTable = pgTable("reports", {
  id: uuid("id").defaultRandom().primaryKey(),
  publicId: uuid("public_id").defaultRandom().notNull().unique(),
  createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
  updatedAt: timestamp("updated_at", { withTimezone: true }).defaultNow().notNull(),
  animalType: text("animal_type").notNull(),
  animalCount: text("animal_count").notNull(),
  locationDescription: text("location_description").notNull(),
  neighborhood: text("neighborhood").notNull(),
  incidentDate: text("incident_date").notNull(),
  incidentTime: text("incident_time"),
  immediateDanger: boolean("immediate_danger").default(false).notNull(),
  concernTypes: jsonb("concern_types").$type<string[]>().default([]).notNull(),
  description: text("description").notNull(),
  evidenceNotes: text("evidence_notes"),
  agenciesContacted: text("agencies_contacted"),
  agencyResponse: text("agency_response"),
  anonymous: boolean("anonymous").default(true).notNull(),
  reporterContact: text("reporter_contact"),
  status: reportStatusEnum("status").default("submitted").notNull(),
});

export const createReportSchema = createInsertSchema(reportsTable, {
  animalType: z.string().trim().min(1).max(100),
  animalCount: z.string().trim().min(1).max(50),
  locationDescription: z.string().trim().min(3).max(500),
  neighborhood: z.string().trim().min(1).max(120),
  incidentDate: z.string().trim().min(1).max(40),
  incidentTime: z.string().trim().max(40).optional(),
  concernTypes: z.array(z.string().trim().min(1).max(100)).max(20),
  description: z.string().trim().min(10).max(5000),
  evidenceNotes: z.string().trim().max(3000).optional(),
  agenciesContacted: z.string().trim().max(1000).optional(),
  agencyResponse: z.string().trim().max(2000).optional(),
  reporterContact: z.string().trim().max(500).optional(),
})
  .omit({ id: true, publicId: true, createdAt: true, updatedAt: true, status: true })
  .superRefine((value, context) => {
    if (!value.anonymous && !value.reporterContact?.trim()) {
      context.addIssue({
        code: "custom",
        path: ["reporterContact"],
        message: "Contact information is required when anonymous reporting is disabled.",
      });
    }
  });

export type CreateReport = z.infer<typeof createReportSchema>;
export type ReportRecord = typeof reportsTable.$inferSelect;
