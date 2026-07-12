import {
  boolean,
  integer,
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
  "routed",
  "follow-up",
  "resolved",
]);

export const reportDangerEnum = pgEnum("report_danger", [
  "yes",
  "no",
  "unsure",
]);

export const reportsTable = pgTable("reports", {
  id: uuid("id").defaultRandom().primaryKey(),
  publicId: uuid("public_id").defaultRandom().notNull().unique(),
  createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
  updatedAt: timestamp("updated_at", { withTimezone: true }).defaultNow().notNull(),
  animalType: text("animal_type").notNull(),
  count: integer("animal_count").notNull(),
  location: text("location_description").notNull(),
  neighborhood: text("neighborhood").notNull(),
  dateObserved: text("incident_date").notNull(),
  timeObserved: text("incident_time").default("").notNull(),
  inDanger: reportDangerEnum("immediate_danger").default("unsure").notNull(),
  concernTypes: jsonb("concern_types").$type<string[]>().default([]).notNull(),
  description: text("description").notNull(),
  evidenceNotes: text("evidence_notes").default("").notNull(),
  agenciesContacted: text("agencies_contacted").default("").notNull(),
  responseReceived: text("agency_response").default("").notNull(),
  anonymous: boolean("anonymous").default(true).notNull(),
  reporterContact: text("reporter_contact"),
  status: reportStatusEnum("status").default("submitted").notNull(),
});

export const createReportSchema = createInsertSchema(reportsTable, {
  animalType: z.enum(["cat", "dog", "other"]),
  count: z.coerce.number().int().min(1).max(100),
  location: z.string().trim().min(3).max(500),
  neighborhood: z.string().trim().min(1).max(120),
  dateObserved: z.string().trim().min(1).max(40),
  timeObserved: z.string().trim().max(40).optional().default(""),
  inDanger: z.enum(["yes", "no", "unsure"]),
  concernTypes: z.array(z.string().trim().min(1).max(100)).min(1).max(20),
  description: z.string().trim().min(10).max(5000),
  evidenceNotes: z.string().trim().max(3000).optional().default(""),
  agenciesContacted: z.string().trim().max(1000).optional().default(""),
  responseReceived: z.string().trim().max(2000).optional().default(""),
  reporterContact: z.string().trim().max(500).optional(),
  anonymous: z.boolean().default(true),
}).omit({
  id: true,
  publicId: true,
  createdAt: true,
  updatedAt: true,
  status: true,
});

export type CreateReport = z.infer<typeof createReportSchema>;
export type ReportRecord = typeof reportsTable.$inferSelect;
