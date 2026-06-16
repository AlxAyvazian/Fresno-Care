import { Router, type Request, type Response } from "express";
import { eq, and } from "drizzle-orm";
import { getDb, clinicImportsTable } from "@workspace/db";
import type { ProviderCandidate } from "../providerSources/types";

const router = Router();

function parseCsv(text: string): CsvRow[] {
  const lines = text.split(/\r?\n/).filter((l) => l.trim() !== "");
  if (lines.length < 2) return [];
  const headers = lines[0].split(",").map((h) => h.trim().toLowerCase());
  const rows: CsvRow[] = [];
  for (let i = 1; i < lines.length; i++) {
    const values = lines[i].split(",").map((v) => v.trim());
    const row: CsvRow = {};
    headers.forEach((h, idx) => { row[h] = values[idx] || undefined; });
    rows.push(row);
  }
  return rows;
}

interface CsvRow {
  name?: string;
  address?: string;
  city?: string;
  state?: string;
  zip?: string;
  postalCode?: string;
  phone?: string;
  fax?: string;
  website?: string;
  npi?: string;
  services?: string;
  notes?: string;
  evidenceNote?: string;
  internalStatus?: string;
  [key: string]: string | undefined;
}

function normalizeState(st: string): string {
  return st.trim().toUpperCase().slice(0, 2);
}

function rowToCandidate(row: CsvRow, sourceTag: string): ProviderCandidate | null {
  const name = (row.name || "").trim();
  if (!name) return null;

  const state = normalizeState(row.state || "");
  const city = (row.city || "").trim();
  const address = (row.address || "").trim();
  if (!city || !state) return null;

  return {
    id: `import-${sourceTag}-${name.toLowerCase().replace(/\s+/g, "-")}`,
    name,
    address,
    city,
    state,
    postalCode: (row.postalCode || row.zip || "").trim(),
    phone: (row.phone || "").trim(),
    fax: (row.fax || "").trim() || undefined,
    website: (row.website || "").trim(),
    npi: (row.npi || "").trim() || undefined,
    source: sourceTag,
    sourceDetail: `${sourceTag} — CSV Import`,
    sourceUrl: "",
    confidence: "high",
    score: 95,
    badges: ["Occu-Med Confirmed", sourceTag],
    evidence: [{
      serviceDetected: (row.services || "urgent care").trim(),
      evidenceUrl: "",
      evidenceTextSnippet: (row.evidenceNote || row.notes || `Imported from ${sourceTag} CSV`).trim(),
      confidence: 95,
      source: sourceTag,
    }],
    internalStatus: (row.internalStatus || "candidate").trim(),
    _rawSources: [sourceTag, "Manual Import"],
  };
}

router.post("/provider-sources/import", async (req: Request, res: Response) => {
  try {
    const body = req.body as { csv?: string; sourceTag?: string };
    const csvText = String(body.csv || "").trim();
    const sourceTag = String(body.sourceTag || "manual").trim();

    if (!csvText) {
      res.status(400).json({ error: "Missing 'csv' field in request body" });
      return;
    }

    const rows = parseCsv(csvText);
    if (rows.length === 0) {
      res.status(400).json({ error: "CSV parse failed — no rows found" });
      return;
    }

    const candidates: ProviderCandidate[] = [];
    const skippedRows: { row: number; reason: string }[] = [];

    for (let i = 0; i < rows.length; i++) {
      const row = rows[i];
      const candidate = rowToCandidate(row, sourceTag);
      if (candidate) {
        candidates.push(candidate);
      } else {
        skippedRows.push({ row: i + 2, reason: "Missing required fields (name, city, or state)" });
      }
    }

    if (candidates.length === 0) {
      res.status(400).json({ error: "No valid rows found after parsing", skippedRows });
      return;
    }

    // Insert into PostgreSQL
    const insertValues = candidates.map((c) => ({
      name: c.name,
      address: c.address,
      city: c.city,
      state: c.state,
      postalCode: c.postalCode,
      phone: c.phone,
      fax: c.fax || null,
      website: c.website,
      npi: c.npi || null,
      services: c.evidence[0]?.serviceDetected || null,
      sourceTag: sourceTag,
      evidenceNote: c.evidence[0]?.evidenceTextSnippet || null,
      internalStatus: c.internalStatus || "candidate",
    }));

    const db = getDb();
    const inserted = await db.insert(clinicImportsTable).values(insertValues).returning();

    res.json({
      success: true,
      sourceTag,
      inserted: inserted.length,
      totalRows: rows.length,
      skipped: skippedRows.length,
      skippedRows: skippedRows.slice(0, 10),
      sampleIds: inserted.slice(0, 3).map((r) => r.id),
    });
  } catch (e: any) {
    console.error("[ProviderSourcesImport] Error:", e);
    res.status(500).json({ error: e.message || "Import failed" });
  }
});

router.get("/provider-sources/imported", async (req: Request, res: Response) => {
  try {
    const state = String(req.query.state || "").trim().toUpperCase();
    const sourceTag = String(req.query.sourceTag || "").trim();

    const db = getDb();
    let query = db.select().from(clinicImportsTable);
    const conditions = [];
    if (state) conditions.push(eq(clinicImportsTable.state, state));
    if (sourceTag) conditions.push(eq(clinicImportsTable.sourceTag, sourceTag));

    const rows = conditions.length > 0
      ? await query.where(and(...conditions))
      : await query;

    res.json({ count: rows.length, rows });
  } catch (e: any) {
    console.error("[ProviderSourcesImport] Query error:", e);
    res.status(500).json({ error: e.message || "Query failed" });
  }
});

export default router;
