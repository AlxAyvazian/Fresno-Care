import { integer, jsonb, pgTable, serial, text, timestamp } from "drizzle-orm/pg-core";

export const networkMapSearchesTable = pgTable("network_map_searches", {
  id: serial("id").primaryKey(),
  route: text("route").notNull(),
  city: text("city").notNull(),
  state: text("state"),
  serviceType: text("service_type"),
  resultCount: integer("result_count").notNull().default(0),
  requestParams: jsonb("request_params").notNull(),
  responsePayload: jsonb("response_payload").notNull(),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
});

export type NetworkMapSearch = typeof networkMapSearchesTable.$inferSelect;
export type InsertNetworkMapSearch = typeof networkMapSearchesTable.$inferInsert;
