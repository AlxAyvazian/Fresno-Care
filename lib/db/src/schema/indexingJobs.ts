import {
  pgTable,
  serial,
  text,
  timestamp,
  integer,
  jsonb,
  index,
} from "drizzle-orm/pg-core";

/**
 * Indexing jobs — resumable background jobs for mass provider indexing.
 */
export const indexingJobsTable = pgTable(
  "indexing_jobs",
  {
    id: serial("id").primaryKey(),
    mode: text("mode").notNull(), // state | taxonomy | service | city_radius | national
    sourceAdapter: text("source_adapter").notNull(), // npi | fmcsa | osm | all
    state: text("state"),
    city: text("city"),
    taxonomy: text("taxonomy"),
    serviceType: text("service_type"),
    status: text("status").notNull().default("pending"), // pending | running | completed | failed | paused
    startedAt: timestamp("started_at", { withTimezone: true }),
    completedAt: timestamp("completed_at", { withTimezone: true }),
    resultsFound: integer("results_found").default(0),
    resultsInserted: integer("results_inserted").default(0),
    resultsUpdated: integer("results_updated").default(0),
    errors: integer("errors").default(0),
    nextCursor: text("next_cursor"), // for pagination/resume
    retryCount: integer("retry_count").default(0),
    metadata: jsonb("metadata").$type<Record<string, unknown>>(),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("indexing_jobs_status_idx").on(t.status),
    index("indexing_jobs_mode_idx").on(t.mode),
    index("indexing_jobs_created_at_idx").on(t.createdAt),
  ],
);

/**
 * Indexing job steps — individual steps/pages within a job.
 */
export const indexingJobStepsTable = pgTable(
  "indexing_job_steps",
  {
    id: serial("id").primaryKey(),
    jobId: integer("job_id").notNull().references(() => indexingJobsTable.id),
    stepLabel: text("step_label").notNull(),
    status: text("status").notNull().default("pending"), // pending | running | completed | failed | skipped
    resultsFound: integer("results_found").default(0),
    resultsInserted: integer("results_inserted").default(0),
    error: text("error"),
    startedAt: timestamp("started_at", { withTimezone: true }),
    completedAt: timestamp("completed_at", { withTimezone: true }),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [index("indexing_job_steps_job_id_idx").on(t.jobId)],
);

/**
 * Source query cache — avoid redundant external API calls.
 */
export const sourceQueryCacheTable = pgTable(
  "source_query_cache",
  {
    id: serial("id").primaryKey(),
    sourceId: text("source_id").notNull(), // npi | fmcsa | osm
    queryKey: text("query_key").notNull(), // normalized query parameters
    responseData: jsonb("response_data"),
    resultCount: integer("result_count").default(0),
    fetchedAt: timestamp("fetched_at", { withTimezone: true }).notNull().defaultNow(),
    expiresAt: timestamp("expires_at", { withTimezone: true }),
  },
  (t) => [
    index("source_query_cache_source_key_idx").on(t.sourceId, t.queryKey),
  ],
);

export type IndexingJob = typeof indexingJobsTable.$inferSelect;
export type InsertIndexingJob = typeof indexingJobsTable.$inferInsert;
export type IndexingJobStep = typeof indexingJobStepsTable.$inferSelect;
export type InsertIndexingJobStep = typeof indexingJobStepsTable.$inferInsert;
export type SourceQueryCache = typeof sourceQueryCacheTable.$inferSelect;
export type InsertSourceQueryCache = typeof sourceQueryCacheTable.$inferInsert;
