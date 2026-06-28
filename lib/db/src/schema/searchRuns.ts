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
 * Search runs — every search/discovery operation is logged.
 */
export const searchRunsTable = pgTable(
  "search_runs",
  {
    id: serial("id").primaryKey(),
    mode: text("mode").notNull(), // discovery | database | viewport | enrichment
    scope: text("scope").notNull(), // city_radius | state | national | viewport | taxonomy
    city: text("city"),
    state: text("state"),
    serviceType: text("service_type"),
    radiusMiles: doublePrecision("radius_miles"),
    centerLat: doublePrecision("center_lat"),
    centerLng: doublePrecision("center_lng"),
    boundsNorth: doublePrecision("bounds_north"),
    boundsSouth: doublePrecision("bounds_south"),
    boundsEast: doublePrecision("bounds_east"),
    boundsWest: doublePrecision("bounds_west"),
    adaptersUsed: jsonb("adapters_used").$type<string[]>().default([]),
    resultsFound: integer("results_found").default(0),
    resultsInserted: integer("results_inserted").default(0),
    resultsUpdated: integer("results_updated").default(0),
    durationMs: integer("duration_ms"),
    errorsBySource: jsonb("errors_by_source").$type<Record<string, string>>(),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("search_runs_mode_idx").on(t.mode),
    index("search_runs_state_idx").on(t.state),
    index("search_runs_created_at_idx").on(t.createdAt),
  ],
);

/**
 * Search run results — links a search run to the providers it found/returned.
 */
export const searchRunResultsTable = pgTable(
  "search_run_results",
  {
    id: serial("id").primaryKey(),
    searchRunId: integer("search_run_id").notNull().references(() => searchRunsTable.id),
    providerId: integer("provider_id").notNull().references(() => providersTable.id),
    resultStatus: text("result_status").notNull().default("existing"), // new | existing | updated
    distanceMiles: doublePrecision("distance_miles"),
    score: integer("score"),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("search_run_results_run_id_idx").on(t.searchRunId),
    index("search_run_results_provider_id_idx").on(t.providerId),
  ],
);

export type SearchRun = typeof searchRunsTable.$inferSelect;
export type InsertSearchRun = typeof searchRunsTable.$inferInsert;
export type SearchRunResult = typeof searchRunResultsTable.$inferSelect;
export type InsertSearchRunResult = typeof searchRunResultsTable.$inferInsert;
