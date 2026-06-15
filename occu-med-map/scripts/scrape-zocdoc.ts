import 'dotenv/config';
import { load } from 'cheerio';
import fs from 'fs/promises';
import path from 'path';
import {
  appendAudit,
  appendCsvRow,
  appendJsonl,
  backupFileIfExists,
  buildSeenKeysFromCsv,
  delay,
  ensureAuditHeader,
  ensureFileHeader,
  fetchHtml,
  loadCheckpoint,
  RateLimiter,
  saveCheckpoint,
} from './lib/scraper-utils.js';

const DRY_RUN = process.argv.includes('--dry-run');

const ZOCDOC_USER = process.env.ZOCDOC_USERNAME;
const ZOCDOC_PASS = process.env.ZOCDOC_PASSWORD;

if (!ZOCDOC_USER || !ZOCDOC_PASS) {
  console.error('Missing ZOCDOC_USERNAME or ZOCDOC_PASSWORD.');
  console.error('Add them to .env, then rerun.');
  process.exit(1);
}

if (DRY_RUN) {
  console.log('[Dry-run] Zocdoc credentials are configured.');
}

const BASE_URL = process.env.ZOCDOC_BASE_URL || 'https://www.zocdoc.com';
const OUTPUT_DIR = process.env.ZOCDOC_OUTPUT_DIR || '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map';
const CHECKPOINT_FILE = path.join(OUTPUT_DIR, '.zocdoc-scrape-checkpoint.json');
const CSV_FILE = path.join(OUTPUT_DIR, 'zocdoc_providers.csv');
const JSONL_FILE = path.join(OUTPUT_DIR, 'zocdoc_providers.jsonl');
const AUDIT_FILE = path.join(OUTPUT_DIR, 'zocdoc_scrape_audit.csv');

const PROVIDER_HEADERS = [
  'provider_name',
  'practice_name',
  'specialty',
  'address',
  'city',
  'state',
  'zip',
  'fax',
  'phone',
];

interface ZocdocCheckpoint {
  startUrls: string[];
  completedUrls: string[];
  failedUrls: string[];
  nextUrls: string[];
}

interface ZocdocProvider {
  provider_name: string;
  practice_name: string;
  specialty: string;
  address: string;
  city: string;
  state: string;
  zip: string;
  fax: string;
  phone: string;
  source_url: string;
}

const rateLimiter = new RateLimiter(800);

function normalizeWhitespace(text: string): string {
  return text.replace(/\s+/g, ' ').trim();
}

function extractZipFromAddress(addressText: string): string {
  const match = addressText.match(/\b(\d{5}(-\d{4})?)\b/);
  return match ? match[1] : '';
}

function extractStateFromAddress(addressText: string): string {
  const match = addressText.match(/,\s*([A-Z]{2})\s*\d{5}/);
  return match ? match[1] : '';
}

function extractCityFromAddress(addressText: string): string {
  const match = addressText.match(/,\s*([A-Za-z\s]+),?\s*[A-Z]{2}\s*\d{5}/);
  return match ? normalizeWhitespace(match[1]) : '';
}

function cleanAddress(addressText: string): string {
  return normalizeWhitespace(
    addressText.replace(/,\s*[A-Za-z\s]+,?\s*[A-Z]{2}\s*\d{5}(-\d{4})?/, '').replace(/,\s*$/, '')
  );
}

function dedupeKey(p: ZocdocProvider): string {
  const name = p.provider_name.toLowerCase().trim().replace(/\s+/g, ' ');
  const practice = p.practice_name.toLowerCase().trim().replace(/\s+/g, ' ');
  const addr = p.address.toLowerCase().trim().replace(/\s+/g, ' ');
  const phone = p.phone.trim().replace(/\D/g, '');
  if (phone) {
    return `${name}|${practice}|${addr}|${phone}`;
  }
  return `${name}|${practice}|${addr}|${p.city.toLowerCase().trim()}|${p.state.toLowerCase().trim()}`;
}

async function parseProviderPage(html: string, url: string): Promise<ZocdocProvider | null> {
  const $ = load(html);

  let provider_name = '';
  let practice_name = '';
  let specialty = '';
  let address = '';
  let city = '';
  let state = '';
  let zip = '';
  let fax = '';
  let phone = '';

  // Try JSON-LD first
  $('script[type="application/ld+json"]').each((_, el) => {
    try {
      const text = $(el).text().trim();
      if (!text) return;
      const json = JSON.parse(text);
      if (json['@type'] === 'Physician' || json['@type'] === 'Person' || json['@type'] === 'MedicalBusiness') {
        provider_name = json.name || '';
        if (json.address) {
          const addr = json.address;
          address = addr.streetAddress || '';
          city = addr.addressLocality || '';
          state = addr.addressRegion || '';
          zip = addr.postalCode || '';
        }
        if (json.telephone) phone = json.telephone;
        if (json.faxNumber) fax = json.faxNumber;
        if (json.medicalSpecialty) specialty = typeof json.medicalSpecialty === 'string' ? json.medicalSpecialty : json.medicalSpecialty?.name || '';
      }
    } catch {
      // ignore malformed JSON
    }
  });

  // Fallback to common Zocdoc selectors
  if (!provider_name) {
    provider_name = normalizeWhitespace($('[data-test="doctor-name"]').first().text() || '');
  }
  if (!provider_name) {
    provider_name = normalizeWhitespace($('h1').first().text() || '');
  }

  if (!practice_name) {
    practice_name = normalizeWhitespace($('[data-test="practice-name"]').first().text() || '');
  }

  if (!specialty) {
    specialty = normalizeWhitespace($('[data-test="doctor-specialty"]').first().text() || '');
  }
  if (!specialty) {
    specialty = normalizeWhitespace($('.specialty-name').first().text() || '');
  }

  if (!address) {
    const addrEl = $('[data-test="address-line"]').first().text() || '';
    if (addrEl) {
      address = cleanAddress(addrEl);
      city = extractCityFromAddress(addrEl);
      state = extractStateFromAddress(addrEl);
      zip = extractZipFromAddress(addrEl);
    }
  }

  if (!phone) {
    phone = normalizeWhitespace($('[data-test="phone-number"]').first().text() || '');
  }
  if (!phone) {
    const phoneMatch = $('body').text().match(/(\(\d{3}\)\s*\d{3}-\d{4}|\d{3}-\d{3}-\d{4})/);
    if (phoneMatch) phone = phoneMatch[0];
  }

  if (!fax) {
    const faxMatch = $('body').text().match(/fax[:\s]*([\d\s()\-+ext.]+)/i);
    if (faxMatch) fax = normalizeWhitespace(faxMatch[1]);
  }

  if (!provider_name || !address) {
    return null;
  }

  return {
    provider_name,
    practice_name,
    specialty,
    address,
    city,
    state,
    zip,
    fax,
    phone,
    source_url: url,
  };
}

async function discoverProviderUrlsFromPage(html: string, baseUrl: string): Promise<string[]> {
  const $ = load(html);
  const urls = new Set<string>();

  // Common Zocdoc provider profile link patterns
  $('a[href*="/doctor/"]').each((_, el) => {
    const href = $(el).attr('href');
    if (href) {
      const full = href.startsWith('http') ? href : `${baseUrl}${href}`;
      urls.add(full);
    }
  });

  $('a[href*="/profile/"]').each((_, el) => {
    const href = $(el).attr('href');
    if (href) {
      const full = href.startsWith('http') ? href : `${baseUrl}${href}`;
      urls.add(full);
    }
  });

  return [...urls];
}

async function main() {
  console.log('========================================');
  console.log('  ZOCDOC PUBLIC DIRECTORY COLLECTOR');
  console.log(`  Dry-run: ${DRY_RUN}`);
  console.log('========================================\n');

  const checkpoint = await loadCheckpoint<ZocdocCheckpoint>(CHECKPOINT_FILE, {
    startUrls: [],
    completedUrls: [],
    failedUrls: [],
    nextUrls: [],
  });

  // Use env-configured seed URLs or a minimal default set
  const seedUrlsEnv = process.env.ZOCDOC_SEED_URLS;
  const seedUrls = seedUrlsEnv
    ? seedUrlsEnv.split(',').map((u) => u.trim())
    : [
        `${BASE_URL}/primary-care-physicians`,
        `${BASE_URL}/urgent-care-specialists`,
        `${BASE_URL}/occupational-medicine-specialists`,
      ];

  if (checkpoint.startUrls.length === 0) {
    checkpoint.startUrls = seedUrls;
    checkpoint.nextUrls = seedUrls;
    if (!DRY_RUN) await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
  }

  if (!DRY_RUN) {
    await backupFileIfExists(CSV_FILE);
    await backupFileIfExists(JSONL_FILE);
    await backupFileIfExists(AUDIT_FILE);
    await ensureFileHeader(CSV_FILE, PROVIDER_HEADERS);
    await ensureAuditHeader(AUDIT_FILE);
  }

  const seenKeys = DRY_RUN ? new Set<string>() : await buildSeenKeysFromCsv(CSV_FILE, ['provider_name', 'practice_name', 'address', 'city', 'state']);
  let uniqueCount = 0;
  let skippedDuplicateCount = 0;

  const completedSet = new Set(checkpoint.completedUrls);
  const failedSet = new Set(checkpoint.failedUrls);

  const remainingUrls = checkpoint.nextUrls.filter((u) => !completedSet.has(u) && !failedSet.has(u));

  console.log(`Starting crawl:`);
  console.log(`  Seed URLs: ${checkpoint.startUrls.length}`);
  console.log(`  URLs to visit: ${remainingUrls.length}`);
  console.log(`  Already completed: ${completedSet.size}`);
  console.log(`  Already failed: ${failedSet.size}`);

  const CONCURRENCY = 4;

  for (let i = 0; i < remainingUrls.length; i += CONCURRENCY) {
    const batch = remainingUrls.slice(i, i + CONCURRENCY);
    const batchPromises = batch.map(async (url) => {
      console.log(`Visiting: ${url}`);

      try {
        await rateLimiter.throttle();
        const html = await fetchHtml(url, { retries: 3, baseDelayMs: 1500 });

        // Discover more provider URLs from this page
        const discovered = await discoverProviderUrlsFromPage(html, BASE_URL);
        const newUrls = discovered.filter((u) => !completedSet.has(u) && !failedSet.has(u));
        for (const nu of newUrls) {
          if (!checkpoint.nextUrls.includes(nu)) {
            checkpoint.nextUrls.push(nu);
          }
        }

        // If this URL looks like a provider profile, extract data
        if (url.includes('/doctor/') || url.includes('/profile/')) {
          const data = await parseProviderPage(html, url);

          if (data) {
            const key = dedupeKey(data);
            if (!seenKeys.has(key)) {
              seenKeys.add(key);
              uniqueCount++;
              if (!DRY_RUN) {
                await appendCsvRow(CSV_FILE, PROVIDER_HEADERS, {
                  provider_name: data.provider_name,
                  practice_name: data.practice_name,
                  specialty: data.specialty,
                  address: data.address,
                  city: data.city,
                  state: data.state,
                  zip: data.zip,
                  fax: data.fax,
                  phone: data.phone,
                });
                await appendJsonl(JSONL_FILE, data);
              }
              console.log(`  Recorded: ${data.provider_name} (${data.city}, ${data.state})`);
            } else {
              skippedDuplicateCount++;
              console.log(`  Duplicate skipped: ${data.provider_name}`);
            }
          } else {
            console.log(`  No provider data extracted`);
          }
        }

        if (!DRY_RUN) {
          await appendAudit(AUDIT_FILE, {
            url,
            status: 'success',
            source_page_type: url.includes('/doctor/') || url.includes('/profile/') ? 'provider' : 'directory',
            timestamp: new Date().toISOString(),
          });
        }

        checkpoint.completedUrls.push(url);
        completedSet.add(url);
      } catch (err: any) {
        console.error(`  Failed: ${url} - ${err.message}`);
        checkpoint.failedUrls.push(url);
        failedSet.add(url);
        if (!DRY_RUN) {
          await appendAudit(AUDIT_FILE, {
            url,
            status: 'failed',
            error: err.message,
            source_page_type: 'unknown',
            timestamp: new Date().toISOString(),
          });
        }
      }
    });

    await Promise.all(batchPromises);
    if (!DRY_RUN) await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
    await delay(500 + Math.random() * 500);

    if (i % 20 === 0 && i > 0) {
      console.log(
        `\n--- Progress: ${i}/${remainingUrls.length} processed, ${uniqueCount} unique, ${skippedDuplicateCount} duplicates skipped ---\n`
      );
    }
  }

  console.log('\n========================================');
  console.log('  ZOCDOC COLLECTION COMPLETE');
  console.log(`  Unique providers: ${uniqueCount}`);
  console.log(`  Duplicates skipped: ${skippedDuplicateCount}`);
  console.log(`  Failed URLs: ${failedSet.size}`);
  console.log(`  Dry-run: ${DRY_RUN}`);
  console.log('========================================');
}

main().catch((err) => {
  console.error('Fatal error:', err);
  process.exit(1);
});
