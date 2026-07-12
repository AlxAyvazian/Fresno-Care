import {
  index,
  jsonb,
  pgEnum,
  pgTable,
  text,
  timestamp,
  uuid,
} from "drizzle-orm/pg-core";
import { z } from "zod/v4";
import {
  PUBLICATION_STATUSES,
  REPORT_STATUSES,
  reportsTable,
} from "./reports";

export const MODERATION_EVENT_TYPES = [
  "report_submitted",
  "case_status_changed",
  "publication_status_changed",
  "note_added",
] as const;

export const moderationEventTypeEnum = pgEnum(
  "moderation_event_type",
  MODERATION_EVENT_TYPES,
);

export const moderationEventsTable = pgTable(
  "moderation_events",
  {
    id: uuid("id").defaultRandom().primaryKey(),
    reportId: uuid("report_id")
      .notNull()
      .references(() => reportsTable.id, { onDelete: "cascade" }),
    createdAt: timestamp("created_at", { withTimezone: true })
      .defaultNow()
      .notNull(),
    eventType: moderationEventTypeEnum("event_type").notNull(),
    actorLabel: text("actor_label").notNull(),
    note: text("note"),
    previousValue: text("previous_value"),
    newValue: text("new_value"),
    metadata: jsonb("metadata")
      .$type<Record<string, string | number | boolean | null>>()
      .default({})
      .notNull(),
  },
  (table) => [
    index("moderation_events_report_created_idx").on(
      table.reportId,
      table.createdAt,
    ),
  ],
);

const moderationActorSchema = z.string().trim().min(1).max(100);
const optionalModerationNoteSchema = z.string().trim().max(2000).optional();

export const moderationStatusChangeSchema = z.object({
  status: z.enum(REPORT_STATUSES),
  actorLabel: moderationActorSchema,
  note: optionalModerationNoteSchema,
});

export const moderationPublicationChangeSchema = z.object({
  publicationStatus: z.enum(PUBLICATION_STATUSES),
  actorLabel: moderationActorSchema,
  note: optionalModerationNoteSchema,
});

export const moderationNoteSchema = z.object({
  actorLabel: moderationActorSchema,
  note: z.string().trim().min(1).max(2000),
});

export type ModerationEventRecord = typeof moderationEventsTable.$inferSelect;
