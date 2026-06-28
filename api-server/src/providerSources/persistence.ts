import { eq, and, sql } from "drizzle-orm";
import { getDb, providersTable, providerLocationsTable, providerContactsTable, providerServicesTable, providerSourcesTable, providerEvidenceTable, geocodeCacheTable } from "@workspace/db";
import type { ProviderCandidate, TrustTier } from "./types";

function normalizeName(name: string): string {
  return name.toLowerCase().replace(/[^a-z0-9\s]/g, " ").replace(/\b(llc|inc|corp|ltd|pllc|pa|md|do|np|dds|od|dc|pt|phd|aprn)\b/g, "").replace(/\s+/g, " ").trim();
}

/**
 * Upsert a provider candidate into Neon.
 * Returns the provider ID (existing or newly created).
 */
export async function upsertProvider(candidate: ProviderCandidate, serviceType: string): Promise<{ providerId: number; isNew: boolean }> {
  const db = getDb();
  const normalizedName = normalizeName(candidate.name);

  // Try to find existing provider by NPI first
  if (candidate.npi) {
    const existing = await db.select().from(providersTable).where(eq(providersTable.npi, candidate.npi)).limit(1);
    if (existing.length > 0) {
      // Update the existing provider
      await db.update(providersTable).set({ updatedAt: new Date() }).where(eq(providersTable.id, existing[0].id));
      await upsertLocation(db, existing[0].id, candidate);
      await upsertContacts(db, existing[0].id, candidate);
      await upsertService(db, existing[0].id, serviceType, candidate);
      await upsertSource(db, existing[0].id, candidate);
      await upsertEvidence(db, existing[0].id, candidate);
      return { providerId: existing[0].id, isNew: false };
    }
  }

  // Try to find by normalized name + state
  const byName = await db.select().from(providersTable)
    .where(eq(providersTable.normalizedName, normalizedName))
    .limit(5);

  if (byName.length > 0) {
    // Check if any match by location
    for (const existing of byName) {
      const locations = await db.select().from(providerLocationsTable)
        .where(and(
          eq(providerLocationsTable.providerId, existing.id),
          eq(providerLocationsTable.state, candidate.state.toUpperCase()),
        ))
        .limit(1);
      if (locations.length > 0) {
        await db.update(providersTable).set({ updatedAt: new Date() }).where(eq(providersTable.id, existing.id));
        await upsertLocation(db, existing.id, candidate);
        await upsertContacts(db, existing.id, candidate);
        await upsertService(db, existing.id, serviceType, candidate);
        await upsertSource(db, existing.id, candidate);
        await upsertEvidence(db, existing.id, candidate);
        return { providerId: existing.id, isNew: false };
      }
    }
  }

  // Create new provider
  const providerType = candidate.source === "NPI"
    ? (candidate.sourceDetail?.includes("NPI-2") ? "organization" : "individual")
    : "unknown";

  const [newProvider] = await db.insert(providersTable).values({
    npi: candidate.npi || null,
    name: candidate.name,
    normalizedName,
    providerType,
  }).returning({ id: providersTable.id });

  await upsertLocation(db, newProvider.id, candidate);
  await upsertContacts(db, newProvider.id, candidate);
  await upsertService(db, newProvider.id, serviceType, candidate);
  await upsertSource(db, newProvider.id, candidate);
  await upsertEvidence(db, newProvider.id, candidate);

  return { providerId: newProvider.id, isNew: true };
}

async function upsertLocation(db: ReturnType<typeof getDb>, providerId: number, c: ProviderCandidate) {
  if (!c.city && !c.state) return;

  const existing = await db.select().from(providerLocationsTable)
    .where(and(
      eq(providerLocationsTable.providerId, providerId),
      eq(providerLocationsTable.state, c.state.toUpperCase()),
    ))
    .limit(1);

  if (existing.length > 0) {
    // Update coordinates if we have better data
    const updates: Record<string, unknown> = { updatedAt: new Date() };
    if (c.lat !== undefined && c.lng !== undefined && existing[0].coordinateStatus === "unverified") {
      updates.lat = c.lat;
      updates.lng = c.lng;
      updates.coordinateStatus = c.coordinateStatus;
    }
    if (c.address && !existing[0].address) updates.address = c.address;
    if (c.postalCode && !existing[0].postalCode) updates.postalCode = c.postalCode;
    await db.update(providerLocationsTable).set(updates).where(eq(providerLocationsTable.id, existing[0].id));
  } else {
    await db.insert(providerLocationsTable).values({
      providerId,
      address: c.address || null,
      city: c.city || null,
      state: c.state?.toUpperCase() || null,
      postalCode: c.postalCode || null,
      lat: c.lat ?? null,
      lng: c.lng ?? null,
      coordinateStatus: c.coordinateStatus,
    });
  }
}

async function upsertContacts(db: ReturnType<typeof getDb>, providerId: number, c: ProviderCandidate) {
  if (!c.phone && !c.fax && !c.website) return;

  const existing = await db.select().from(providerContactsTable)
    .where(eq(providerContactsTable.providerId, providerId))
    .limit(1);

  if (existing.length === 0) {
    await db.insert(providerContactsTable).values({
      providerId,
      phone: c.phone || null,
      fax: c.fax || null,
      website: c.website || null,
    });
  } else {
    const updates: Record<string, unknown> = {};
    if (c.phone && !existing[0].phone) updates.phone = c.phone;
    if (c.fax && !existing[0].fax) updates.fax = c.fax;
    if (c.website && !existing[0].website) updates.website = c.website;
    if (Object.keys(updates).length > 0) {
      await db.update(providerContactsTable).set(updates).where(eq(providerContactsTable.id, existing[0].id));
    }
  }
}

async function upsertService(db: ReturnType<typeof getDb>, providerId: number, serviceType: string, c: ProviderCandidate) {
  const existing = await db.select().from(providerServicesTable)
    .where(and(
      eq(providerServicesTable.providerId, providerId),
      eq(providerServicesTable.serviceType, serviceType),
    ))
    .limit(1);

  if (existing.length === 0) {
    await db.insert(providerServicesTable).values({
      providerId,
      serviceType,
      taxonomy: c.taxonomy || null,
      taxonomyCode: c.taxonomyCode || null,
    });
  }
}

async function upsertSource(db: ReturnType<typeof getDb>, providerId: number, c: ProviderCandidate) {
  const trustTierMap: Record<string, TrustTier> = {
    "NPI": "registry",
    "FMCSA": "registry",
    "FAA": "registry",
    "Manual Import": "verified",
    "Patients First": "verified",
    "OpenStreetMap": "directory",
  };
  const trustTier = c.trustTier || trustTierMap[c.source] || "lead";

  const existing = await db.select().from(providerSourcesTable)
    .where(and(
      eq(providerSourcesTable.providerId, providerId),
      eq(providerSourcesTable.sourceId, c.source.toLowerCase().replace(/\s+/g, "_")),
    ))
    .limit(1);

  if (existing.length === 0) {
    await db.insert(providerSourcesTable).values({
      providerId,
      sourceId: c.source.toLowerCase().replace(/\s+/g, "_"),
      sourceLabel: c.sourceDetail || c.source,
      sourceUrl: c.sourceUrl || null,
      trustTier,
      externalId: c.npi || null,
    });
  }
}

async function upsertEvidence(db: ReturnType<typeof getDb>, providerId: number, c: ProviderCandidate) {
  for (const ev of c.evidence) {
    if (!ev.serviceDetected) continue;
    const existing = await db.select().from(providerEvidenceTable)
      .where(and(
        eq(providerEvidenceTable.providerId, providerId),
        eq(providerEvidenceTable.serviceDetected, ev.serviceDetected),
        eq(providerEvidenceTable.source, ev.source),
      ))
      .limit(1);

    if (existing.length === 0) {
      await db.insert(providerEvidenceTable).values({
        providerId,
        serviceDetected: ev.serviceDetected,
        evidenceUrl: ev.evidenceUrl || null,
        evidenceTextSnippet: ev.evidenceTextSnippet || null,
        confidence: ev.confidence,
        source: ev.source,
      });
    }
  }
}

/**
 * Cache a geocode result to avoid redundant API calls.
 */
export async function cacheGeocode(query: string, lat: number | null, lng: number | null, provider: string, success: boolean): Promise<void> {
  const db = getDb();
  const queryNormalized = query.toLowerCase().trim();
  try {
    await db.insert(geocodeCacheTable).values({
      queryNormalized,
      lat,
      lng,
      provider,
      success,
    }).onConflictDoNothing();
  } catch {
    // Ignore cache write failures
  }
}

/**
 * Look up a cached geocode result.
 */
export async function getCachedGeocode(query: string): Promise<{ lat: number; lng: number } | null> {
  const db = getDb();
  const queryNormalized = query.toLowerCase().trim();
  try {
    const rows = await db.select().from(geocodeCacheTable)
      .where(and(
        eq(geocodeCacheTable.queryNormalized, queryNormalized),
        eq(geocodeCacheTable.success, true),
      ))
      .limit(1);
    if (rows.length > 0 && rows[0].lat != null && rows[0].lng != null) {
      return { lat: rows[0].lat, lng: rows[0].lng };
    }
    return null;
  } catch {
    return null;
  }
}
