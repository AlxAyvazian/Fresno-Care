import { pgTable, serial, text, timestamp, varchar, integer, doublePrecision } from "drizzle-orm/pg-core";

export const clinicImportsTable = pgTable("clinic_imports", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  address: text("address"),
  city: text("city"),
  state: varchar("state", { length: 2 }),
  postalCode: text("postal_code"),
  phone: text("phone"),
  fax: text("fax"),
  website: text("website"),
  npi: text("npi"),
  services: text("services"),
  sourceTag: text("source_tag").notNull().default("manual"),
  evidenceNote: text("evidence_note"),
  internalStatus: text("internal_status").default("candidate"),
  lat: doublePrecision("lat"),
  lng: doublePrecision("lng"),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
});

export type ClinicImport = typeof clinicImportsTable.$inferSelect;
export type InsertClinicImport = typeof clinicImportsTable.$inferInsert;
