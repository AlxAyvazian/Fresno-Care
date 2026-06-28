import {
  pgTable,
  serial,
  text,
  timestamp,
  varchar,
  doublePrecision,
  integer,
  jsonb,
  uniqueIndex,
  index,
  boolean,
} from "drizzle-orm/pg-core";

/**
 * Core provider record — one row per unique provider entity.
 * Dedupe keys: NPI (if available), normalized name+address, phone+address.
 */
export const providersTable = pgTable(
  "providers",
  {
    id: serial("id").primaryKey(),
    npi: text("npi"),
    name: text("name").notNull(),
    normalizedName: text("normalized_name").notNull(),
    providerType: text("provider_type").default("unknown"), // individual | organization | clinic | unknown
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    uniqueIndex("providers_npi_unique").on(t.npi),
    index("providers_normalized_name_idx").on(t.normalizedName),
  ],
);

/**
 * Provider locations — a provider may have multiple addresses.
 */
export const providerLocationsTable = pgTable(
  "provider_locations",
  {
    id: serial("id").primaryKey(),
    providerId: integer("provider_id").notNull().references(() => providersTable.id),
    address: text("address"),
    city: text("city"),
    state: varchar("state", { length: 2 }),
    postalCode: text("postal_code"),
    lat: doublePrecision("lat"),
    lng: doublePrecision("lng"),
    coordinateStatus: text("coordinate_status").notNull().default("unverified"), // imported | geocoded | unverified
    isPrimary: boolean("is_primary").default(true),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("provider_locations_provider_id_idx").on(t.providerId),
    index("provider_locations_state_idx").on(t.state),
    index("provider_locations_coords_idx").on(t.lat, t.lng),
    index("provider_locations_city_state_idx").on(t.city, t.state),
  ],
);

/**
 * Provider contacts — phone, fax, website, email.
 */
export const providerContactsTable = pgTable(
  "provider_contacts",
  {
    id: serial("id").primaryKey(),
    providerId: integer("provider_id").notNull().references(() => providersTable.id),
    locationId: integer("location_id").references(() => providerLocationsTable.id),
    phone: text("phone"),
    fax: text("fax"),
    website: text("website"),
    email: text("email"),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [index("provider_contacts_provider_id_idx").on(t.providerId)],
);

/**
 * Provider services/specialties/taxonomies.
 */
export const providerServicesTable = pgTable(
  "provider_services",
  {
    id: serial("id").primaryKey(),
    providerId: integer("provider_id").notNull().references(() => providersTable.id),
    serviceType: text("service_type").notNull(),
    taxonomy: text("taxonomy"),
    taxonomyCode: text("taxonomy_code"),
    isPrimary: boolean("is_primary").default(false),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("provider_services_provider_id_idx").on(t.providerId),
    index("provider_services_service_type_idx").on(t.serviceType),
  ],
);

/**
 * Provider sources — tracks which external sources contributed data for a provider.
 */
export const providerSourcesTable = pgTable(
  "provider_sources",
  {
    id: serial("id").primaryKey(),
    providerId: integer("provider_id").notNull().references(() => providersTable.id),
    sourceId: text("source_id").notNull(), // npi | fmcsa | clinicimports | osm | webhint | manual
    sourceLabel: text("source_label").notNull(),
    sourceUrl: text("source_url"),
    trustTier: text("trust_tier").notNull().default("lead"), // verified | registry | directory | lead
    externalId: text("external_id"), // NPI number, OSM ID, FMCSA ID, etc.
    rawData: jsonb("raw_data"),
    fetchedAt: timestamp("fetched_at", { withTimezone: true }).notNull().defaultNow(),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [
    index("provider_sources_provider_id_idx").on(t.providerId),
    index("provider_sources_source_id_idx").on(t.sourceId),
    index("provider_sources_trust_tier_idx").on(t.trustTier),
  ],
);

/**
 * Provider evidence — specific proof/signals about a provider's services.
 */
export const providerEvidenceTable = pgTable(
  "provider_evidence",
  {
    id: serial("id").primaryKey(),
    providerId: integer("provider_id").notNull().references(() => providersTable.id),
    serviceDetected: text("service_detected").notNull(),
    evidenceUrl: text("evidence_url"),
    evidenceTextSnippet: text("evidence_text_snippet"),
    confidence: integer("confidence").notNull().default(0), // 0-100
    source: text("source").notNull(),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [index("provider_evidence_provider_id_idx").on(t.providerId)],
);

/**
 * Geocode cache — avoid re-geocoding the same address.
 */
export const geocodeCacheTable = pgTable(
  "geocode_cache",
  {
    id: serial("id").primaryKey(),
    queryNormalized: text("query_normalized").notNull(),
    lat: doublePrecision("lat"),
    lng: doublePrecision("lng"),
    provider: text("provider"), // geocodio | nominatim
    success: boolean("success").notNull().default(false),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [uniqueIndex("geocode_cache_query_idx").on(t.queryNormalized)],
);

export type Provider = typeof providersTable.$inferSelect;
export type InsertProvider = typeof providersTable.$inferInsert;
export type ProviderLocation = typeof providerLocationsTable.$inferSelect;
export type InsertProviderLocation = typeof providerLocationsTable.$inferInsert;
export type ProviderContact = typeof providerContactsTable.$inferSelect;
export type InsertProviderContact = typeof providerContactsTable.$inferInsert;
export type ProviderService = typeof providerServicesTable.$inferSelect;
export type InsertProviderService = typeof providerServicesTable.$inferInsert;
export type ProviderSource = typeof providerSourcesTable.$inferSelect;
export type InsertProviderSource = typeof providerSourcesTable.$inferInsert;
export type ProviderEvidenceRow = typeof providerEvidenceTable.$inferSelect;
export type InsertProviderEvidence = typeof providerEvidenceTable.$inferInsert;
export type GeocodeCache = typeof geocodeCacheTable.$inferSelect;
export type InsertGeocodeCache = typeof geocodeCacheTable.$inferInsert;
