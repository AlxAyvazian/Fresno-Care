import { load } from 'cheerio';
import fs from 'fs/promises';

const BASE_URL = 'https://bluehive.com';
const CHECKPOINT_FILE = '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/.bluehive-scrape-checkpoint.json';
const CSV_FILE = '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/bluehive_providers.csv';
const JSONL_FILE = '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/bluehive_providers.jsonl';
const AUDIT_FILE = '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/bluehive_scrape_audit.csv';
const RECOVERY_REPORT_FILE = '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/bluehive_missing_city_recovery_report.csv';

interface Checkpoint {
  states: string[];
  cities: Record<string, string[]>;
  providers: Record<string, string[]>;
  completed: string[];
  failed: string[];
}

interface ProviderData {
  clinic_name: string;
  address_1: string;
  address_2: string;
  city: string;
  state: string;
  zip: string;
  phone: string;
  fax: string;
  website: string;
  hours: string;
  services: string;
  service_categories: string;
  accepts_new_patients: string;
  telehealth: string;
  source_url: string;
  source_city_url: string;
  source_state_url: string;
}

const delay = (ms: number) => new Promise<void>((r) => setTimeout(r, ms));

const PROVIDER_HEADERS = [
  'clinic_name',
  'address_1',
  'address_2',
  'city',
  'state',
  'zip',
  'phone',
  'fax',
  'website',
  'hours',
  'services',
  'service_categories',
  'accepts_new_patients',
  'telehealth',
  'source_url',
  'source_city_url',
  'source_state_url',
];

const AUDIT_HEADERS = ['url', 'status', 'error', 'source_page_type', 'timestamp'];

async function ensureCsvHeader() {
  try {
    await fs.access(CSV_FILE);
  } catch {
    await fs.writeFile(CSV_FILE, PROVIDER_HEADERS.join(',') + '\n');
  }
}

async function appendProviderCsv(provider: ProviderData) {
  const line = PROVIDER_HEADERS.map((h) => escapeCsv((provider as any)[h] || '')).join(',');
  await fs.appendFile(CSV_FILE, line + '\n');
}

async function appendProviderJsonl(provider: ProviderData) {
  await fs.appendFile(JSONL_FILE, JSON.stringify(provider) + '\n');
}

async function ensureAuditHeader() {
  try {
    await fs.access(AUDIT_FILE);
  } catch {
    await fs.writeFile(AUDIT_FILE, AUDIT_HEADERS.join(',') + '\n');
  }
}

async function appendAudit(audit: { url: string; status: string; error?: string; source_page_type: string; timestamp: string }) {
  const line = AUDIT_HEADERS.map((h) => escapeCsv((audit as any)[h] || '')).join(',');
  await fs.appendFile(AUDIT_FILE, line + '\n');
}

async function fetchHtml(url: string, retries = 3): Promise<string> {
  let lastErr: Error | undefined;
  for (let i = 0; i < retries; i++) {
    try {
      const res = await fetch(url, {
        headers: {
          'User-Agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
          Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.5',
        },
      });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      return await res.text();
    } catch (err) {
      lastErr = err as Error;
      const wait = 1000 * (i + 1) + Math.random() * 1000;
      console.log(`  Retry ${i + 1}/${retries} for ${url} after ${Math.round(wait)}ms`);
      await delay(wait);
    }
  }
  throw lastErr;
}

async function loadCheckpoint(): Promise<Checkpoint> {
  try {
    const raw = await fs.readFile(CHECKPOINT_FILE, 'utf-8');
    return JSON.parse(raw);
  } catch {
    return { states: [], cities: {}, providers: {}, completed: [], failed: [] };
  }
}

async function saveCheckpoint(cp: Checkpoint) {
  await fs.writeFile(CHECKPOINT_FILE, JSON.stringify(cp, null, 2));
}

function segments(url: string): string[] {
  return url.replace(/\/$/, '').split('/').filter(Boolean);
}

function extractStates($: any): string[] {
  const urls = new Set<string>();
  $('a[href^="/provider/"]').each((_: any, el: any) => {
    const href = $(el).attr('href');
    if (!href) return;
    const segs = segments(href);
    if (segs.length === 2 && segs[0] === 'provider') {
      urls.add(href);
    }
  });
  return [...urls].sort();
}

const SERVICE_SLUGS = [
  'chest-x-ray',
  'dot-physical',
  'drug-test',
  'flu-vaccine',
  'titer-screening',
  'glucose-screening',
  'sports-physical',
  'preventive-health-exam',
  'faa-medical-class-2',
  'faa-medical-class-3',
  'pre-placement-post-offer-evaluation',
  'hepatitis-b-vaccine',
];

function isServiceSlug(href: string): boolean {
  for (const slug of SERVICE_SLUGS) {
    if (href.includes(slug)) return true;
  }
  return false;
}

function extractCities($: any, stateUrl: string): string[] {
  const stateSegs = segments(stateUrl);
  const urls = new Set<string>();
  // Only extract from the "Browse by City" section
  const browseHeading = $('h2:contains("Browse by City")');
  if (browseHeading.length > 0) {
    const container = browseHeading.parent();
    container.find('a[href^="/provider/"]').each((_: any, el: any) => {
      const href = $(el).attr('href');
      if (!href) return;
      const segs = segments(href);
      if (
        segs.length === 3 &&
        segs[0] === 'provider' &&
        segs[1] === stateSegs[1] &&
        !isServiceSlug(href)
      ) {
        urls.add(href);
      }
    });
  }
  return [...urls].sort();
}

function extractProviders($: any, stateUrl: string): string[] {
  const stateSegs = segments(stateUrl);
  const urls = new Set<string>();
  $('a[href^="/provider/"]').each((_: any, el: any) => {
    const href = $(el).attr('href');
    if (!href) return;
    const segs = segments(href);
    if (segs.length === 2 && segs[0] === 'provider' && segs[1] !== stateSegs[1]) {
      urls.add(href);
    }
  });
  return [...urls].sort();
}

function extractProviderData(html: string, sourceUrl: string): ProviderData | null {
  const $ = load(html);

  let medicalBusiness: any = null;
  let faqPage: any = null;
  let breadcrumbList: any = null;

  $('script[type="application/ld+json"]').each((_, el) => {
    try {
      const text = $(el).text().trim();
      if (!text) return;
      const json = JSON.parse(text);
      if (json['@type'] === 'MedicalBusiness') medicalBusiness = json;
      else if (json['@type'] === 'FAQPage') faqPage = json;
      else if (json['@type'] === 'BreadcrumbList') breadcrumbList = json;
    } catch {
      // ignore malformed JSON
    }
  });

  if (!medicalBusiness) return null;

  const addr = medicalBusiness.address || {};
  const street = addr.streetAddress || '';
  const parts = street.split(',').map((s: string) => s.trim());
  const address_1 = parts[0] || '';
  const address_2 = parts.slice(1).join(', ') || '';

  let hours = '';
  if (faqPage?.mainEntity && Array.isArray(faqPage.mainEntity)) {
    const entry = faqPage.mainEntity.find(
      (q: any) =>
        q.name?.toLowerCase().includes('hours') ||
        q.name?.toLowerCase().includes('office hours')
    );
    if (entry?.acceptedAnswer?.text) {
      hours = entry.acceptedAnswer.text.replace(/\r\n/g, '\n').replace(/\r/g, '\n').trim();
    }
  }

  const servicesArr: string[] = [];
  if (
    medicalBusiness.hasOfferCatalog?.itemListElement &&
    Array.isArray(medicalBusiness.hasOfferCatalog.itemListElement)
  ) {
    for (const item of medicalBusiness.hasOfferCatalog.itemListElement) {
      const name = item?.itemOffered?.name;
      if (name && !servicesArr.includes(name)) servicesArr.push(name);
    }
  }

  if (servicesArr.length === 0) {
    $('[data-service-name]').each((_, el) => {
      const name = $(el).attr('data-service-name');
      if (name && !servicesArr.includes(name)) servicesArr.push(name);
    });
  }

  const categoriesSet = new Set<string>();
  $('[data-service-category]').each((_, el) => {
    const cat = $(el).attr('data-service-category');
    if (cat) categoriesSet.add(cat);
  });

  let website = '';
  const socialHosts = ['facebook.com', 'twitter.com', 'instagram.com', 'linkedin.com', 'youtube.com'];
  if (medicalBusiness.sameAs && Array.isArray(medicalBusiness.sameAs)) {
    const nonSocial = medicalBusiness.sameAs.find(
      (u: string) => !socialHosts.some((h) => u.includes(h))
    );
    if (nonSocial) website = nonSocial;
  }
  if (!website && medicalBusiness.url) {
    website = medicalBusiness.url;
  }

  const bodyText = $('body').text().toLowerCase();
  const accepts_new_patients = bodyText.includes('accepts new patients') ? 'Yes' : '';
  const telehealth = bodyText.includes('telehealth') ? 'Yes' : '';

  let source_city_url = '';
  let source_state_url = '';
  if (breadcrumbList?.itemListElement && Array.isArray(breadcrumbList.itemListElement)) {
    const stateItem = breadcrumbList.itemListElement.find((it: any) => it.position === 3);
    const cityItem = breadcrumbList.itemListElement.find((it: any) => it.position === 4);
    if (stateItem?.item) source_state_url = stateItem.item;
    if (cityItem?.item) source_city_url = cityItem.item;
  }

  return {
    clinic_name: medicalBusiness.name || '',
    address_1,
    address_2,
    city: addr.addressLocality || '',
    state: addr.addressRegion || '',
    zip: addr.postalCode || '',
    phone: medicalBusiness.telephone || '',
    fax: medicalBusiness.faxNumber || '',
    website,
    hours,
    services: servicesArr.join('; '),
    service_categories: [...categoriesSet].join('; '),
    accepts_new_patients,
    telehealth,
    source_url: sourceUrl,
    source_city_url,
    source_state_url,
  };
}

function dedupeKey(p: ProviderData): string {
  const name = p.clinic_name.toLowerCase().trim().replace(/\s+/g, ' ');
  const addr = (p.address_1 + ' ' + p.address_2).toLowerCase().trim().replace(/\s+/g, ' ');
  const phone = p.phone.trim().replace(/\D/g, '');
  if (phone) {
    return `${name}|${addr}|${phone}`;
  }
  return `${name}|${addr}|${p.city.toLowerCase().trim()}|${p.state.toLowerCase().trim()}`;
}

function escapeCsv(val: string): string {
  if (!val) return '';
  if (/[",\n\r]/.test(val)) {
    return `"${val.replace(/"/g, '""')}"`;
  }
  return val;
}

async function buildSeenKeysFromCsv(): Promise<Set<string>> {
  const seen = new Set<string>();
  try {
    const raw = await fs.readFile(CSV_FILE, 'utf-8');
    const lines = raw.trim().split('\n');
    if (lines.length <= 1) return seen;
    const headers = lines[0].split(',');
    const idx: Record<string, number> = {};
    for (let i = 0; i < headers.length; i++) {
      idx[headers[i].trim()] = i;
    }
    for (let i = 1; i < lines.length; i++) {
      const row = lines[i].split(',');
      if (row.length < 3) continue;
      const name = (row[idx['clinic_name']] || '').toLowerCase().trim().replace(/\s+/g, ' ');
      const addr1 = (row[idx['address_1']] || '').toLowerCase().trim().replace(/\s+/g, ' ');
      const addr2 = (row[idx['address_2']] || '').toLowerCase().trim().replace(/\s+/g, ' ');
      const phone = (row[idx['phone']] || '').trim().replace(/\D/g, '');
      const city = (row[idx['city']] || '').toLowerCase().trim();
      const state = (row[idx['state']] || '').toLowerCase().trim();
      const addr = (addr1 + ' ' + addr2).trim();
      if (phone) {
        seen.add(`${name}|${addr}|${phone}`);
      } else {
        seen.add(`${name}|${addr}|${city}|${state}`);
      }
    }
  } catch {
    // file not found or unreadable
  }
  return seen;
}

function cityNameFromUrl(url: string): string {
  const segs = segments(url);
  if (segs.length < 3) return '';
  return segs[2].replace(/-/g, ' ');
}

const REPORT_HEADERS = [
  'state',
  'city',
  'city_url',
  'provider_urls_found',
  'new_provider_urls_added',
  'already_known_provider_urls',
  'providers_scraped',
  'duplicates_skipped',
  'failed',
  'status',
  'notes',
];

async function ensureReportHeader() {
  try {
    await fs.access(RECOVERY_REPORT_FILE);
  } catch {
    await fs.writeFile(RECOVERY_REPORT_FILE, REPORT_HEADERS.join(',') + '\n');
  }
}

async function appendReportRow(row: Record<string, string | number>) {
  const line = REPORT_HEADERS.map((h) => escapeCsv(String(row[h] || ''))).join(',');
  await fs.appendFile(RECOVERY_REPORT_FILE, line + '\n');
}

async function runRecovery() {
  console.log('\n========================================');
  console.log('  MISSING CITY RECOVERY MODE');
  console.log('========================================\n');

  const checkpoint = await loadCheckpoint();
  await ensureCsvHeader();
  await ensureAuditHeader();
  await ensureReportHeader();

  // Build seenKeys from existing CSV so new providers don't duplicate
  const seenKeys = await buildSeenKeysFromCsv();
  let uniqueCount = 0;
  let skippedDuplicateCount = 0;

  // Compute missing cities
  const allCities = [...new Set(Object.values(checkpoint.cities).flat())];
  const visitedCities = new Set(Object.keys(checkpoint.providers));
  const missingCities = allCities.filter((c) => !visitedCities.has(c)).sort();

  // Count by state
  const missingByState: Record<string, number> = {};
  for (const city of missingCities) {
    const state = city.split('/')[2] || 'unknown';
    missingByState[state] = (missingByState[state] || 0) + 1;
  }

  const totalProviderUrlsBefore = Object.values(checkpoint.providers).flat().length;

  console.log('Recovery analysis:');
  console.log(`  States discovered: ${checkpoint.states.length}`);
  console.log(`  Total city URLs: ${allCities.length}`);
  console.log(`  Cities already visited: ${visitedCities.size}`);
  console.log(`  Missing cities: ${missingCities.length}`);
  console.log(`  Provider URLs before recovery: ${totalProviderUrlsBefore}`);
  console.log('\nMissing cities by state (top 10):');
  Object.entries(missingByState)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 10)
    .forEach(([s, c]) => console.log(`  ${s}: ${c}`));
  console.log();

  if (missingCities.length === 0) {
    console.log('No missing cities found. Nothing to recover.');
    return;
  }

  // Phase 1: Visit missing cities and collect provider URLs
  console.log(`\n--- Phase 1: Collecting provider URLs from ${missingCities.length} missing cities ---\n`);

  const knownProviderUrls = new Set(Object.values(checkpoint.providers).flat());
  const initialKnownCount = knownProviderUrls.size;

  for (let i = 0; i < missingCities.length; i += 8) {
    const batch = missingCities.slice(i, i + 8);
    const batchPromises = batch.map(async (cityUrl) => {
      const city = cityNameFromUrl(cityUrl);
      const state = cityUrl.split('/')[2] || '';
      const reportRow: Record<string, string | number> = {
        state,
        city,
        city_url: cityUrl,
        provider_urls_found: 0,
        new_provider_urls_added: 0,
        already_known_provider_urls: 0,
        providers_scraped: 0,
        duplicates_skipped: 0,
        failed: 0,
        status: '',
        notes: '',
      };

      try {
        console.log(`Scraping city: ${cityUrl}`);
        const html = await fetchHtml(`${BASE_URL}${cityUrl}`);
        const $ = load(html);
        const providers = extractProviders($, `/provider/${state}/`);

        checkpoint.providers[cityUrl] = providers;
        reportRow.provider_urls_found = providers.length;

        let newCount = 0;
        let alreadyKnown = 0;
        for (const p of providers) {
          if (knownProviderUrls.has(p)) {
            alreadyKnown++;
          } else {
            knownProviderUrls.add(p);
            newCount++;
          }
        }
        reportRow.new_provider_urls_added = newCount;
        reportRow.already_known_provider_urls = alreadyKnown;
        reportRow.status = 'success';

        await appendAudit({
          url: `${BASE_URL}${cityUrl}`,
          status: 'success',
          source_page_type: 'city',
          timestamp: new Date().toISOString(),
        });
      } catch (err: any) {
        console.error(`  Failed: ${cityUrl} - ${err.message}`);
        reportRow.status = 'failed';
        reportRow.notes = err.message;
        checkpoint.providers[cityUrl] = checkpoint.providers[cityUrl] || [];
        await appendAudit({
          url: `${BASE_URL}${cityUrl}`,
          status: 'failed',
          error: err.message,
          source_page_type: 'city',
          timestamp: new Date().toISOString(),
        });
      }

      await appendReportRow(reportRow);
    });

    await Promise.all(batchPromises);
    await saveCheckpoint(checkpoint);
    await delay(200 + Math.random() * 300);

    if (i % 50 === 0 && i > 0) {
      console.log(`\n--- Progress: ${i}/${missingCities.length} cities processed ---\n`);
    }
  }

  const totalProviderUrlsAfter = Object.values(checkpoint.providers).flat().length;
  const newProviderUrlsAdded = totalProviderUrlsAfter - totalProviderUrlsBefore;

  console.log(`\n--- Phase 1 complete ---`);
  console.log(`  Provider URLs before: ${totalProviderUrlsBefore}`);
  console.log(`  Provider URLs after: ${totalProviderUrlsAfter}`);
  console.log(`  New provider URLs added: ${newProviderUrlsAdded}`);

  // Phase 2: Scrape only new provider URLs
  const completedSet = new Set(checkpoint.completed);
  const failedSet = new Set(checkpoint.failed);
  const allProviderUrls = new Set(Object.values(checkpoint.providers).flat());
  const newProviderUrls = [...allProviderUrls].filter(
    (u) => !completedSet.has(u) && !failedSet.has(u)
  );

  console.log(`\n--- Phase 2: Scraping ${newProviderUrls.length} new provider URLs ---\n`);

  let completedCount = 0;
  let failedCount = 0;
  let progressCounter = 0;

  // Map to track per-city metrics for report update
  const cityReportIndex = new Map<string, number>();

  for (let i = 0; i < newProviderUrls.length; i += 8) {
    const batch = newProviderUrls.slice(i, i + 8);
    const batchPromises = batch.map(async (providerPath) => {
      const fullUrl = `${BASE_URL}${providerPath}`;
      console.log(`Scraping provider: ${providerPath}`);

      // Find which city this provider belongs to (for reporting)
      let sourceCity = '';
      for (const [cityUrl, providers] of Object.entries(checkpoint.providers)) {
        if (providers.includes(providerPath)) {
          sourceCity = cityUrl;
          break;
        }
      }

      try {
        const html = await fetchHtml(fullUrl);
        const data = extractProviderData(html, fullUrl);

        if (data) {
          const key = dedupeKey(data);
          if (!seenKeys.has(key)) {
            seenKeys.add(key);
            uniqueCount++;
            await appendProviderCsv(data);
            await appendProviderJsonl(data);
            console.log(`  Recorded: ${data.clinic_name} (${data.city}, ${data.state})`);
          } else {
            skippedDuplicateCount++;
            console.log(`  Duplicate skipped: ${data.clinic_name}`);
          }
          await appendAudit({
            url: fullUrl,
            status: 'success',
            source_page_type: 'provider',
            timestamp: new Date().toISOString(),
          });
        } else {
          console.log(`  No MedicalBusiness JSON-LD found`);
          await appendAudit({
            url: fullUrl,
            status: 'no-data',
            source_page_type: 'provider',
            timestamp: new Date().toISOString(),
          });
        }

        checkpoint.completed.push(providerPath);
        completedSet.add(providerPath);
        completedCount++;
      } catch (err: any) {
        console.error(`  Failed: ${providerPath} - ${err.message}`);
        checkpoint.failed.push(fullUrl);
        failedSet.add(fullUrl);
        await appendAudit({
          url: fullUrl,
          status: 'failed',
          error: err.message,
          source_page_type: 'provider',
          timestamp: new Date().toISOString(),
        });
        failedCount++;
      }
    });

    await Promise.all(batchPromises);
    await saveCheckpoint(checkpoint);
    progressCounter += batch.length;

    if (progressCounter >= 50) {
      progressCounter = 0;
      console.log(
        `\n--- Progress: ${completedCount} completed, ${failedCount} failed, ${uniqueCount} unique, ${skippedDuplicateCount} duplicates skipped ---\n`
      );
    }

    await delay(200 + Math.random() * 300);
  }

  console.log(`\n========================================`);
  console.log('  RECOVERY COMPLETE');
  console.log('========================================');
  console.log(`States discovered: ${checkpoint.states.length}`);
  console.log(`Total cities: ${allCities.length}`);
  console.log(`Cities already visited: ${visitedCities.size}`);
  console.log(`Missing cities recovered: ${missingCities.length}`);
  console.log(`Total provider URLs before recovery: ${totalProviderUrlsBefore}`);
  console.log(`Total provider URLs after recovery: ${totalProviderUrlsAfter}`);
  console.log(`New provider URLs added: ${newProviderUrlsAdded}`);
  console.log(`New provider profiles scraped: ${completedCount}`);
  console.log(`Duplicates skipped: ${skippedDuplicateCount}`);
  console.log(`Failures: ${failedCount}`);
  console.log(`Final CSV row count: ${seenKeys.size + 1} (including header)`);
  console.log(`Final JSONL row count: ${uniqueCount}`);
  console.log(`Recovery report: ${RECOVERY_REPORT_FILE}`);
  console.log('========================================');
}

async function main() {
  if (process.argv.includes('--recover')) {
    await runRecovery();
    return;
  }

  const checkpoint = await loadCheckpoint();
  const seenKeys = new Set<string>();
  let uniqueCount = 0;
  let skippedDuplicateCount = 0;

  // Ensure incremental output files have headers
  await ensureCsvHeader();
  await ensureAuditHeader();

  // Step 1: States (only if not already discovered)
  if (checkpoint.states.length === 0) {
    console.log('Fetching main directory page...');
    const html = await fetchHtml(`${BASE_URL}/provider/`);
    const $ = load(html);
    checkpoint.states = extractStates($);
    console.log(`States found: ${checkpoint.states.length}`);
    for (const s of checkpoint.states.slice(0, 10)) {
      console.log(`  ${s}`);
    }
    await saveCheckpoint(checkpoint);
    await delay(500 + Math.random() * 500);
  } else {
    console.log(`Resuming: ${checkpoint.states.length} states already discovered`);
  }

  // Count existing provider URLs in checkpoint
  const existingProviderUrls = new Set<string>();
  for (const cityUrl of Object.keys(checkpoint.providers)) {
    for (const p of checkpoint.providers[cityUrl]) {
      existingProviderUrls.add(p);
    }
  }

  // Step 2: Cities per state (skip if provider URLs already collected)
  if (existingProviderUrls.size === 0) {
    let totalCities = 0;
    for (const stateUrl of checkpoint.states) {
      if (!checkpoint.cities[stateUrl]) {
        console.log(`Scraping state: ${stateUrl}`);
        const html = await fetchHtml(`${BASE_URL}${stateUrl}`);
        const $ = load(html);
        checkpoint.cities[stateUrl] = extractCities($, stateUrl);
        totalCities += checkpoint.cities[stateUrl].length;
        console.log(`  Cities found: ${checkpoint.cities[stateUrl].length}`);
        await saveCheckpoint(checkpoint);
        await delay(500 + Math.random() * 500);
      } else {
        totalCities += checkpoint.cities[stateUrl].length;
      }
    }
    console.log(`Total cities discovered: ${totalCities}`);
  } else {
    console.log(`Skipping city crawl: ${existingProviderUrls.size} provider URLs already in checkpoint`);
  }

  // Step 3: Provider links from city pages (skip if already collected)
  let totalProviderLinks = 0;
  const allProviderUrls = new Set<string>(existingProviderUrls);
  if (existingProviderUrls.size === 0) {
    for (const stateUrl of checkpoint.states) {
      const cities = checkpoint.cities[stateUrl] || [];
      for (const cityUrl of cities) {
        if (!checkpoint.providers[cityUrl]) {
          console.log(`Scraping city: ${cityUrl}`);
          const html = await fetchHtml(`${BASE_URL}${cityUrl}`);
          const $ = load(html);
          checkpoint.providers[cityUrl] = extractProviders($, stateUrl);
          totalProviderLinks += checkpoint.providers[cityUrl].length;
          console.log(`  Providers found: ${checkpoint.providers[cityUrl].length}`);
          await saveCheckpoint(checkpoint);
          await delay(500 + Math.random() * 500);
        } else {
          totalProviderLinks += checkpoint.providers[cityUrl].length;
        }
        for (const p of checkpoint.providers[cityUrl]) allProviderUrls.add(p);
      }
    }
    console.log(`Total provider profile links found: ${allProviderUrls.size}`);
  } else {
    console.log(`Using ${allProviderUrls.size} provider URLs from checkpoint`);
  }

  // Step 4: Scrape provider pages
  const completedSet = new Set(checkpoint.completed);
  const failedSet = new Set(checkpoint.failed);
  let completedCount = 0;
  let failedCount = 0;
  let progressCounter = 0;
  const sortedUrls = [...allProviderUrls].sort();
  const remainingUrls = sortedUrls.filter((u) => !completedSet.has(u) && !failedSet.has(u));

  console.log(`\nStarting provider scrape:`);
  console.log(`  Total provider URLs: ${sortedUrls.length}`);
  console.log(`  Already completed: ${completedSet.size}`);
  console.log(`  Already failed: ${failedSet.size}`);
  console.log(`  Remaining: ${remainingUrls.length}`);

  const CONCURRENCY = 8;

  for (let i = 0; i < remainingUrls.length; i += CONCURRENCY) {
    const batch = remainingUrls.slice(i, i + CONCURRENCY);
    const batchPromises = batch.map(async (providerPath) => {

      const fullUrl = `${BASE_URL}${providerPath}`;
      console.log(`Scraping provider: ${providerPath}`);

      try {
        const html = await fetchHtml(fullUrl);
        const data = extractProviderData(html, fullUrl);

        if (data) {
          const key = dedupeKey(data);
          if (!seenKeys.has(key)) {
            seenKeys.add(key);
            uniqueCount++;
            await appendProviderCsv(data);
            await appendProviderJsonl(data);
            console.log(`  Recorded: ${data.clinic_name} (${data.city}, ${data.state})`);
          } else {
            skippedDuplicateCount++;
            console.log(`  Duplicate skipped: ${data.clinic_name}`);
          }
          await appendAudit({ url: fullUrl, status: 'success', source_page_type: 'provider', timestamp: new Date().toISOString() });
        } else {
          console.log(`  No MedicalBusiness JSON-LD found`);
          await appendAudit({ url: fullUrl, status: 'no-data', source_page_type: 'provider', timestamp: new Date().toISOString() });
        }

        checkpoint.completed.push(providerPath);
        completedSet.add(providerPath);
        completedCount++;
      } catch (err: any) {
        console.error(`  Failed: ${providerPath} - ${err.message}`);
        checkpoint.failed.push(fullUrl);
        failedSet.add(fullUrl);
        await appendAudit({
          url: fullUrl,
          status: 'failed',
          error: err.message,
          source_page_type: 'provider',
          timestamp: new Date().toISOString(),
        });
        failedCount++;
      }
    });

    await Promise.all(batchPromises);
    await saveCheckpoint(checkpoint);
    progressCounter += batch.length;

    if (progressCounter >= 50) {
      progressCounter = 0;
      console.log(
        `\n--- Progress: ${completedCount} completed, ${failedCount} failed, ${uniqueCount} unique, ${skippedDuplicateCount} duplicates skipped ---\n`
      );
    }

    await delay(200 + Math.random() * 300);
  }

  console.log(`\n========================================`);
  console.log(`Scrape complete.`);
  console.log(`Provider profiles processed: ${completedCount}`);
  console.log(`  Newly completed: ${completedCount}`);
  console.log(`  Failed: ${failedCount}`);
  console.log(`Unique providers written: ${uniqueCount}`);
  console.log(`Duplicates skipped: ${skippedDuplicateCount}`);
  if (failedCount > 0) {
    console.log(`Failed URLs:\n  ${[...failedSet].join('\n  ')}`);
  }
  console.log(`========================================`);

  // Final summary JSON export
  console.log('\nIncremental files written during scrape:');
  console.log(`  ${CSV_FILE}`);
  console.log(`  ${JSONL_FILE}`);
  console.log(`  ${AUDIT_FILE}`);
}

main().catch((err) => {
  console.error('Fatal error:', err);
  process.exit(1);
});
