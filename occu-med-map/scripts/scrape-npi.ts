import 'dotenv/config';
import fs from 'fs/promises';
import path from 'path';
import {
  appendAudit,
  appendCsvRow,
  appendJsonl,
  backupFileIfExists,
  delay,
  ensureAuditHeader,
  ensureFileHeader,
  fetchJson,
  loadCheckpoint,
  RateLimiter,
  saveCheckpoint,
} from './lib/scraper-utils.js';

const DRY_RUN = process.argv.includes('--dry-run');

const OUTPUT_DIR = process.env.NPI_OUTPUT_DIR || '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map';
const CHECKPOINT_FILE = path.join(OUTPUT_DIR, '.npi-scrape-checkpoint.json');
const CSV_FILE = path.join(OUTPUT_DIR, 'npi_registry_providers.csv');
const JSONL_FILE = path.join(OUTPUT_DIR, 'npi_registry_providers.jsonl');
const AUDIT_FILE = path.join(OUTPUT_DIR, 'npi_registry_audit.csv');

const API_BASE = 'https://npiregistry.cms.hhs.gov/api';
const API_VERSION = '2.1';

const PROVIDER_HEADERS = [
  'npi_number',
  'entity_type',
  'organization_name',
  'provider_first_name',
  'provider_last_name',
  'taxonomy_description',
  'address_1',
  'address_2',
  'city',
  'state',
  'zip',
  'phone',
  'fax',
];

interface NpiCheckpoint {
  taxonomySearches: string[];
  stateSearches: string[];
  completedQueries: string[];
  failedQueries: string[];
  seenNpi: string[];
}

interface NpiProvider {
  npi_number: string;
  entity_type: string;
  organization_name: string;
  provider_first_name: string;
  provider_last_name: string;
  taxonomy_description: string;
  address_1: string;
  address_2: string;
  city: string;
  state: string;
  zip: string;
  phone: string;
  fax: string;
  source_query: string;
}

const rateLimiter = new RateLimiter(300);

const DEFAULT_TAXONOMIES = [
  'Urgent Care',
  'Occupational Health',
  'Occupational Medicine',
  'Occupational Health Specialist',
  'Occupational Health Provider',
  'Primary Care',
  'General Practice',
  'General Practitioner',
  'Internal Medicine',
  'Family Medicine',
  'Emergency Medicine',
  'Orthopedics',
  'Orthopedic Surgery',
  'Neurology',
  'Cardiology',
  'Pulmonology',
  'Physical Medicine',
  'Physical Medicine & Rehabilitation',
  'Pain Medicine',
  'Sports Medicine',
  'Chiropractic',
  'Physical Therapy',
  'Radiology',
  'Diagnostic Imaging',
  'Dentistry',
  'Dental',
];

const US_STATES = [
  'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
  'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
  'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
  'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
  'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY',
  'DC',
];

function pickPrimaryTaxonomy(taxonomies: any[]): any | null {
  if (!taxonomies || !Array.isArray(taxonomies)) return null;
  const primary = taxonomies.find((t) => t.primary === true);
  if (primary) return primary;
  return taxonomies[0] || null;
}

function pickPracticeAddress(addresses: any[]): any | null {
  if (!addresses || !Array.isArray(addresses)) return null;
  const practice = addresses.find((a) => a.address_purpose === 'LOCATION');
  if (practice) return practice;
  return addresses[0] || null;
}

function normalizePhone(phone: string): string {
  if (!phone) return '';
  const digits = phone.replace(/\D/g, '');
  if (digits.length === 10) {
    return `(${digits.slice(0, 3)}) ${digits.slice(3, 6)}-${digits.slice(6, 10)}`;
  }
  return phone;
}

function normalizeZip(zip: string): string {
  if (!zip) return '';
  const digits = zip.replace(/\D/g, '');
  if (digits.length === 9) {
    return `${digits.slice(0, 5)}-${digits.slice(5, 9)}`;
  }
  return digits.slice(0, 5);
}

async function searchNpi(params: Record<string, string>): Promise<any> {
  const query = new URLSearchParams({ version: API_VERSION, ...params });
  const url = `${API_BASE}/?${query.toString()}`;
  await rateLimiter.throttle();
  return fetchJson(url, { retries: 3, baseDelayMs: 1000 });
}

async function fetchAllForQuery(
  baseParams: Record<string, string>,
  queryLabel: string
): Promise<NpiProvider[]> {
  const providers: NpiProvider[] = [];
  let skip = 0;
  const limit = 200;
  let total = -1;

  while (true) {
    const params = { ...baseParams, limit: String(limit), skip: String(skip) };
    try {
      const data = await searchNpi(params);
      const results = data?.results || [];
      if (total < 0 && data?.result_count != null) {
        total = data.result_count;
      }

      for (const r of results) {
        const taxonomy = pickPrimaryTaxonomy(r.taxonomies);
        const addr = pickPracticeAddress(r.addresses);
        const basic = r.basic || {};
        const entityType = r.enumeration_type === 'NPI-1' ? 'Individual' : 'Organization';

        providers.push({
          npi_number: String(r.number || ''),
          entity_type: entityType,
          organization_name: basic.organization_name || basic.organization_subpart_name || '',
          provider_first_name: basic.first_name || '',
          provider_last_name: basic.last_name || '',
          taxonomy_description: taxonomy?.desc || taxonomy?.description || '',
          address_1: addr?.address_1 || '',
          address_2: addr?.address_2 || '',
          city: addr?.city || '',
          state: addr?.state || '',
          zip: normalizeZip(addr?.postal_code || ''),
          phone: normalizePhone(addr?.telephone_number || ''),
          fax: normalizePhone(addr?.fax_number || ''),
          source_query: queryLabel,
        });
      }

      if (results.length < limit) break;
      skip += limit;
    } catch (err: any) {
      console.error(`  API error for ${queryLabel}: ${err.message}`);
      break;
    }
  }

  return providers;
}

async function main() {
  console.log('========================================');
  console.log('  NPI REGISTRY COLLECTOR');
  console.log(`  Dry-run: ${DRY_RUN}`);
  console.log('========================================\n');

  const checkpoint = await loadCheckpoint<NpiCheckpoint>(CHECKPOINT_FILE, {
    taxonomySearches: [],
    stateSearches: [],
    completedQueries: [],
    failedQueries: [],
    seenNpi: [],
  });

  // Load configuration
  const taxonomiesEnv = process.env.NPI_TAXONOMIES;
  const taxonomies = taxonomiesEnv ? taxonomiesEnv.split(',').map((t) => t.trim()) : DEFAULT_TAXONOMIES;

  const statesEnv = process.env.NPI_STATES;
  const states = statesEnv ? statesEnv.split(',').map((s) => s.trim().toUpperCase()) : US_STATES;

  const cityEnv = process.env.NPI_CITY;
  const orgNameEnv = process.env.NPI_ORGANIZATION_NAME;
  const firstNameEnv = process.env.NPI_FIRST_NAME;
  const lastNameEnv = process.env.NPI_LAST_NAME;
  const postalCodeEnv = process.env.NPI_POSTAL_CODE;

  if (checkpoint.taxonomySearches.length === 0) {
    checkpoint.taxonomySearches = taxonomies;
    if (!DRY_RUN) await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
  }
  if (checkpoint.stateSearches.length === 0) {
    checkpoint.stateSearches = states;
    if (!DRY_RUN) await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
  }

  if (!DRY_RUN) {
    await backupFileIfExists(CSV_FILE);
    await backupFileIfExists(JSONL_FILE);
    await backupFileIfExists(AUDIT_FILE);
    await ensureFileHeader(CSV_FILE, PROVIDER_HEADERS);
    await ensureAuditHeader(AUDIT_FILE);
  }

  const seenNpi = new Set<string>(checkpoint.seenNpi);
  let uniqueCount = 0;
  let skippedDuplicateCount = 0;

  const completedSet = new Set(checkpoint.completedQueries);
  const failedSet = new Set(checkpoint.failedQueries);

  // Build query matrix
  const queries: { label: string; params: Record<string, string> }[] = [];

  for (const taxonomy of checkpoint.taxonomySearches) {
    for (const state of checkpoint.stateSearches) {
      const params: Record<string, string> = {
        taxonomy_description: taxonomy,
        state,
        country_code: 'US',
      };
      if (cityEnv) params.city = cityEnv;
      if (orgNameEnv) params.organization_name = orgNameEnv;
      if (firstNameEnv) params.first_name = firstNameEnv;
      if (lastNameEnv) params.last_name = lastNameEnv;
      if (postalCodeEnv) params.postal_code = postalCodeEnv;

      const label = `taxonomy=${taxonomy}&state=${state}`;
      queries.push({ label, params });
    }
  }

  console.log(`Total queries to run: ${queries.length}`);
  console.log(`Taxonomies: ${checkpoint.taxonomySearches.length}`);
  console.log(`States: ${checkpoint.stateSearches.length}`);

  const remainingQueries = queries.filter((q) => !completedSet.has(q.label) && !failedSet.has(q.label));

  console.log(`Remaining queries: ${remainingQueries.length}`);
  console.log(`Already completed: ${completedSet.size}`);
  console.log(`Already failed: ${failedSet.size}\n`);

  for (let i = 0; i < remainingQueries.length; i++) {
    const { label, params } = remainingQueries[i];
    console.log(`Query ${i + 1}/${remainingQueries.length}: ${label}`);

    try {
      const providers = await fetchAllForQuery(params, label);
      console.log(`  Records returned: ${providers.length}`);

      for (const p of providers) {
        if (!p.npi_number) continue;
        if (seenNpi.has(p.npi_number)) {
          skippedDuplicateCount++;
          continue;
        }
        seenNpi.add(p.npi_number);
        checkpoint.seenNpi.push(p.npi_number);
        uniqueCount++;

        if (!DRY_RUN) {
          await appendCsvRow(CSV_FILE, PROVIDER_HEADERS, {
            npi_number: p.npi_number,
            entity_type: p.entity_type,
            organization_name: p.organization_name,
            provider_first_name: p.provider_first_name,
            provider_last_name: p.provider_last_name,
            taxonomy_description: p.taxonomy_description,
            address_1: p.address_1,
            address_2: p.address_2,
            city: p.city,
            state: p.state,
            zip: p.zip,
            phone: p.phone,
            fax: p.fax,
          });
          await appendJsonl(JSONL_FILE, p);
        }
      }

      if (!DRY_RUN) {
        await appendAudit(AUDIT_FILE, {
          url: `${API_BASE}/?${new URLSearchParams({ ...params, version: API_VERSION }).toString()}`,
          status: 'success',
          source_page_type: 'api',
          timestamp: new Date().toISOString(),
        });
      }

      checkpoint.completedQueries.push(label);
      completedSet.add(label);
    } catch (err: any) {
      console.error(`  Failed: ${label} - ${err.message}`);
      checkpoint.failedQueries.push(label);
      failedSet.add(label);
      if (!DRY_RUN) {
        await appendAudit(AUDIT_FILE, {
          url: `${API_BASE}/?${new URLSearchParams({ ...params, version: API_VERSION }).toString()}`,
          status: 'failed',
          error: err.message,
          source_page_type: 'api',
          timestamp: new Date().toISOString(),
        });
      }
    }

    if (!DRY_RUN) await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
    await delay(300 + Math.random() * 400);

    if (i % 50 === 0 && i > 0) {
      console.log(
        `\n--- Progress: ${i}/${remainingQueries.length} queries, ${uniqueCount} unique, ${skippedDuplicateCount} duplicates skipped ---\n`
      );
    }
  }

  console.log('\n========================================');
  console.log('  NPI REGISTRY COLLECTION COMPLETE');
  console.log(`  Unique providers: ${uniqueCount}`);
  console.log(`  Duplicates skipped: ${skippedDuplicateCount}`);
  console.log(`  Failed queries: ${failedSet.size}`);
  console.log(`  Dry-run: ${DRY_RUN}`);
  console.log('========================================');
}

main().catch((err) => {
  console.error('Fatal error:', err);
  process.exit(1);
});
