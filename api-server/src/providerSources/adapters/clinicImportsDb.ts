import { eq } from "drizzle-orm";
import { db, clinicImportsTable } from "@workspace/db";
import type { ProviderCandidate } from "../types";

export async function searchClinicImports(_city: string, state: string): Promise<ProviderCandidate[]> {
  const rows = await db
    .select()
    .from(clinicImportsTable)
    .where(eq(clinicImportsTable.state, state.toUpperCase()));

  return rows.map((r) => ({
    id: `db-import-${r.id}`,
    name: r.name,
    address: r.address || "",
    city: r.city || "",
    state: r.state || "",
    postalCode: r.postalCode || "",
    phone: r.phone || "",
    fax: r.fax || undefined,
    website: r.website || "",
    npi: r.npi || undefined,
    source: r.sourceTag || "Manual Import",
    sourceDetail: `${r.sourceTag} — Database Import`,
    sourceUrl: "",
    confidence: "high",
    score: 95,
    badges: ["Occu-Med Confirmed", r.sourceTag || "Manual Import"],
    evidence: [{
      serviceDetected: r.services || "urgent care",
      evidenceUrl: "",
      evidenceTextSnippet: r.evidenceNote || `Imported from ${r.sourceTag || "manual"} database`,
      confidence: 95,
      source: r.sourceTag || "Manual Import",
    }],
    internalStatus: r.internalStatus || "candidate",
    lat: r.lat ?? undefined,
    lng: r.lng ?? undefined,
    _rawSources: [r.sourceTag || "Manual Import", "Database"],
  }));
}
