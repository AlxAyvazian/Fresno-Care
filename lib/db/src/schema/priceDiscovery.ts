import {
  pgTable,
  serial,
  text,
  timestamp,
  integer,
  jsonb,
  doublePrecision,
  index,
} from "drizzle-orm/pg-core";
import { providersTable } from "./providers";

/**
 * Price discovery runs — each price hunt/discovery session.
 */
export const priceDiscoveryRunsTable = pgTable(
  "price_discovery_runs",
  {
    id: serial("id").primaryKey(),
    query: text("query").notNull(),
    city: text("city"),
    state: text("state"),
    serviceType: text("service_type"),
    mode: text("mode").notNull().default("open_web"), // known_provider | open_web
    sourcesUsed: jsonb("sources_used").$type<string[]>().default([]),
    resultsFound: integer("results_found").default(0),
    durationMs: integer("duration_ms"),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("price_discovery_runs_state_idx").on(t.state),
    index("price_discovery_runs_created_at_idx").on(t.createdAt),
  ],
);

/**
 * Provider prices — individual price records linked to providers.
 */
export const providerPricesTable = pgTable(
  "provider_prices",
  {
    id: serial("id").primaryKey(),
    providerId: integer("provider_id").references(() => providersTable.id), // nullable if provider not yet linked
    discoveryRunId: integer("discovery_run_id").references(() => priceDiscoveryRunsTable.id),
    serviceName: text("service_name").notNull(),
    priceMin: doublePrecision("price_min"),
    priceMax: doublePrecision("price_max"),
    priceCurrency: text("price_currency").default("USD"),
    priceType: text("price_type").default("self_pay"), // self_pay | insurance | fee_schedule | unknown
    sourceUrl: text("source_url"),
    sourceLabel: text("source_label"),
    confidence: integer("confidence").default(50), // 0-100
    extractionNotes: text("extraction_notes"),
    capturedAt: timestamp("captured_at", { withTimezone: true }).notNull().defaultNow(),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("provider_prices_provider_id_idx").on(t.providerId),
    index("provider_prices_service_name_idx").on(t.serviceName),
    index("provider_prices_discovery_run_id_idx").on(t.discoveryRunId),
  ],
);

/**
 * Price evidence — supporting data for a price record.
 */
export const priceEvidenceTable = pgTable(
  "price_evidence",
  {
    id: serial("id").primaryKey(),
    priceId: integer("price_id").notNull().references(() => providerPricesTable.id),
    evidenceUrl: text("evidence_url"),
    evidenceSnippet: text("evidence_snippet"),
    pageTitle: text("page_title"),
    confidence: integer("confidence").default(50),
    capturedAt: timestamp("captured_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [index("price_evidence_price_id_idx").on(t.priceId)],
);

export type PriceDiscoveryRun = typeof priceDiscoveryRunsTable.$inferSelect;
export type InsertPriceDiscoveryRun = typeof priceDiscoveryRunsTable.$inferInsert;
export type ProviderPrice = typeof providerPricesTable.$inferSelect;
export type InsertProviderPrice = typeof providerPricesTable.$inferInsert;
export type PriceEvidence = typeof priceEvidenceTable.$inferSelect;
export type InsertPriceEvidence = typeof priceEvidenceTable.$inferInsert;
