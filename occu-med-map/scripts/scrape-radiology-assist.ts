import 'dotenv/config';
import { load } from 'cheerio';
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
  fetchHtml,
  fetchWithRetry,
  loadCheckpoint,
  RateLimiter,
  saveCheckpoint,
} from './lib/scraper-utils.js';

const DRY_RUN = process.argv.includes('--dry-run');

const USERNAME = process.env.RADIOLOGY_ASSIST_USERNAME;
const PASSWORD = process.env.RADIOLOGY_ASSIST_PASSWORD;

if (!USERNAME || !PASSWORD) {
  console.error('Missing RADIOLOGY_ASSIST_USERNAME or RADIOLOGY_ASSIST_PASSWORD.');
  console.error('Add them to .env, then rerun.');
  process.exit(1);
}

if (DRY_RUN) {
  console.log('[Dry-run] Radiology Assist credentials are configured.');
}

const BASE_URL = process.env.RADIOLOGY_ASSIST_BASE_URL || 'https://assisthealthgroup.com/client';
const SEEDS_FILE = process.env.RADIOLOGY_ASSIST_SEEDS || '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map/config/radiology-assist-provider-seeds.csv';
const OUTPUT_DIR = process.env.RADIOLOGY_ASSIST_OUTPUT_DIR || '/Users/ayvazian/CascadeProjects/Network-Map-PR35/occu-med-map';
const CHECKPOINT_FILE = path.join(OUTPUT_DIR, '.radiology-assist-scrape-checkpoint.json');

const PRICES_CSV = path.join(OUTPUT_DIR, 'radiology_assist_prices.csv');
const PRICES_JSONL = path.join(OUTPUT_DIR, 'radiology_assist_prices.jsonl');
const FACILITIES_CSV = path.join(OUTPUT_DIR, 'radiology_assist_facilities.csv');
const FACILITIES_JSONL = path.join(OUTPUT_DIR, 'radiology_assist_facilities.jsonl');
const AUDIT_FILE = path.join(OUTPUT_DIR, 'radiology_assist_audit.csv');

const PRICE_HEADERS = [
  'facility_name',
  'service_name',
  'modality',
  'body_part',
  'price',
  'address',
  'city',
  'state',
  'zip',
  'phone',
  'source_seed',
  'scrape_timestamp',
];

const FACILITY_HEADERS = [
  'seed_search_type',
  'seed_search_value',
  'seed_state',
  'facility_name',
  'address',
  'city',
  'state',
  'zip',
  'phone',
  'modalities_available',
  'facility_profile_url',
  'notes',
  'scrape_timestamp',
];

interface RadiAssistCheckpoint {
  loggedIn: boolean;
  directoryChecked: boolean;
  directoryExists: boolean;
  completedQueries: string[];
  failedQueries: string[];
  seenFacilities: string[];
}

interface SeedRow {
  search_type: 'zip' | 'city';
  search_value: string;
  state_optional: string;
}

interface StudyDef {
  modality: string;
  body_part: string;
  protocol: string;
  cpt_code: string;
  service_name: string;
}

interface PriceRecord {
  facility_name: string;
  service_name: string;
  modality: string;
  body_part: string;
  price: string;
  address: string;
  city: string;
  state: string;
  zip: string;
  phone: string;
  source_seed: string;
  scrape_timestamp: string;
}

interface FacilityRecord {
  seed_search_type: string;
  seed_search_value: string;
  seed_state: string;
  facility_name: string;
  address: string;
  city: string;
  state: string;
  zip: string;
  phone: string;
  modalities_available: string;
  facility_profile_url: string;
  notes: string;
  scrape_timestamp: string;
}

const rateLimiter = new RateLimiter(1000);
let sessionCookie = '';

function normalizeWhitespace(text: string): string {
  return text.replace(/\s+/g, ' ').trim();
}

function extractZip(addressText: string): string {
  const match = addressText.match(/\b(\d{5}(-\d{4})?)\b/);
  return match ? match[1] : '';
}

function extractState(addressText: string): string {
  const match = addressText.match(/,\s*([A-Z]{2})\s*\d{5}/);
  return match ? match[1] : '';
}

function extractCity(addressText: string): string {
  const match = addressText.match(/,\s*([A-Za-z\s]+),?\s*[A-Z]{2}\s*\d{5}/);
  return match ? normalizeWhitespace(match[1]) : '';
}

function cleanAddress(addressText: string): string {
  return normalizeWhitespace(
    addressText.replace(/,\s*[A-Za-z\s]+,?\s*[A-Z]{2}\s*\d{5}(-\d{4})?/, '').replace(/,\s*$/, '')
  );
}

function facilityDedupeKey(f: FacilityRecord): string {
  return `${f.facility_name.toLowerCase().trim()}|${f.address.toLowerCase().trim()}|${f.city.toLowerCase().trim()}|${f.state.toLowerCase().trim()}|${f.zip.trim()}`;
}

async function loadSeeds(): Promise<SeedRow[]> {
  const raw = await fs.readFile(SEEDS_FILE, 'utf-8');
  const lines = raw.trim().split('\n');
  const rows: SeedRow[] = [];
  for (let i = 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;
    const parts = line.split(',');
    if (parts.length < 2) continue;
    rows.push({
      search_type: parts[0].trim() as 'zip' | 'city',
      search_value: parts[1].trim(),
      state_optional: (parts[2] || '').trim(),
    });
  }
  return rows;
}

function getDefaultStudies(): StudyDef[] {
  const envStudies = process.env.RADIOLOGY_ASSIST_STUDIES;
  if (envStudies) {
    // Format: modality|body_part|protocol|cpt_code|service_name;...
    return envStudies.split(';').map((s) => {
      const parts = s.split('|');
      return {
        modality: parts[0] || '',
        body_part: parts[1] || '',
        protocol: parts[2] || '',
        cpt_code: parts[3] || '',
        service_name: parts[4] || '',
      };
    });
  }
  return [
    { modality: 'MRI', body_part: 'Brain', protocol: 'Without Contrast', cpt_code: '70551', service_name: 'MRI Brain Without Contrast' },
    { modality: 'MRI', body_part: 'Brain', protocol: 'With Contrast', cpt_code: '70552', service_name: 'MRI Brain With Contrast' },
    { modality: 'CT', body_part: 'Brain', protocol: 'Without Contrast', cpt_code: '70450', service_name: 'CT Brain Without Contrast' },
    { modality: 'CT', body_part: 'Chest', protocol: 'Without Contrast', cpt_code: '71250', service_name: 'CT Chest Without Contrast' },
    { modality: 'CT', body_part: 'Abdomen & Pelvis', protocol: 'Without Contrast', cpt_code: '74176', service_name: 'CT Abdomen & Pelvis Without Contrast' },
    { modality: 'Ultrasound', body_part: 'Abdomen', protocol: 'Complete', cpt_code: '76700', service_name: 'Ultrasound Abdomen Complete' },
    { modality: 'Xray', body_part: 'Chest', protocol: '2 Views', cpt_code: '71046', service_name: 'X-Ray Chest 2 Views' },
    { modality: 'Mammogram', body_part: 'Screening', protocol: 'Bilateral', cpt_code: '77067', service_name: 'Mammogram Screening Bilateral' },
  ];
}

function extractCookies(setCookieHeader: string | null): string {
  if (!setCookieHeader) return '';
  // Node fetch may concatenate multiple Set-Cookie headers with comma
  // We need to split carefully since cookie values can contain commas
  // A simple approach: split by ", " when followed by a cookie name pattern
  const parts = setCookieHeader.split(/,\s*(?=[^,]+=)/);
  return parts.map((p) => p.split(';')[0].trim()).join('; ');
}

async function attemptLogin(): Promise<boolean> {
  console.log('Attempting login...');

  // Step 1: GET login page to extract nonce and capture any initial cookies
  const getRes = await fetch(`${BASE_URL}/`, {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    },
    redirect: 'manual',
  });

  const initialCookies = extractCookies(getRes.headers.get('set-cookie'));
  const loginPageHtml = await getRes.text();
  const $ = load(loginPageHtml);

  // Ultimate Member form fields (may vary by site config; use generic selectors)
  const usernameField = $('input[name^="username-"]').first().attr('name') || 'username-6';
  const passwordField = $('input[name^="user_password-"]').first().attr('name') || 'user_password-6';
  const nonce = String($('input[name="_wpnonce"]').val() || '');
  const referer = String($('input[name="_wp_http_referer"]').val() || '/');
  const formId = String($('input[name="form_id"]').val() || '6');

  const formData = new URLSearchParams();
  formData.append(usernameField, USERNAME!);
  formData.append(passwordField, PASSWORD!);
  formData.append('form_id', formId);
  formData.append('_wpnonce', nonce);
  formData.append('_wp_http_referer', referer);
  formData.append('rememberme', '1');

  try {
    // Step 2: POST login with redirect: manual so we can capture cookies from 302
    const postRes = await fetch(`${BASE_URL}/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        Referer: `${BASE_URL}/`,
        Cookie: initialCookies,
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
      body: formData.toString(),
      redirect: 'manual',
    });

    // Capture login cookies from the 302 response
    const loginCookies = extractCookies(postRes.headers.get('set-cookie'));
    sessionCookie = loginCookies || initialCookies;

    const location = postRes.headers.get('location') || `${BASE_URL}/client-home/`;
    const redirectUrl = location.startsWith('http') ? location : `${BASE_URL}${location}`;

    // Step 3: Follow redirect with login cookies
    const finalRes = await fetch(redirectUrl, {
      headers: {
        Cookie: sessionCookie,
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
      redirect: 'manual',
    });

    const finalCookies = extractCookies(finalRes.headers.get('set-cookie'));
    if (finalCookies) {
      sessionCookie = finalCookies;
    }

    const postHtml = await finalRes.text();
    const post$ = load(postHtml);
    const logoutLink = post$('a[href*="logout"], a[href*="signout"]').length > 0;
    const dashboardIndicator = post$('.um-account-nav, .um-profile, .um-account-tab, .um-logout').length > 0;
    const welcomeText = /welcome|log\s*out|sign\s*out|my\s*account|dashboard|client.home|track.status/i.test(post$('body').text());

    if (logoutLink || dashboardIndicator || welcomeText) {
      console.log('Login successful.');
      return true;
    }

    console.error('Login may have failed: no dashboard/logout indicators found in response.');
    return false;
  } catch (err: any) {
    console.error(`Login request failed: ${err.message}`);
    return false;
  }
}

async function fetchWithSession(url: string): Promise<string> {
  await rateLimiter.throttle();
  const res = await fetchWithRetry(url, {
    headers: sessionCookie ? { Cookie: sessionCookie } : undefined,
    retries: 2,
  });
  const newCookie = res.headers.get('set-cookie');
  if (newCookie) {
    sessionCookie = extractCookies(newCookie);
  }
  return res.text();
}

async function checkDirectoryExists(): Promise<boolean> {
  console.log('Checking for provider/facility directory page...');
  try {
    const html = await fetchWithSession(`${BASE_URL}/facilities`);
    const $ = load(html);
    const hasDirectory = $('a[href*="/facility/"], a[href*="/center/"]').length > 5;
    if (hasDirectory) {
      console.log('Directory page appears to exist with facility links.');
    } else {
      console.log('No obvious full directory found. Will use seed-based search.');
    }
    return hasDirectory;
  } catch (err: any) {
    console.log(`Directory check failed: ${err.message}. Will use seed-based search.`);
    return false;
  }
}

async function searchByStudyAndZip(study: StudyDef, zip: string): Promise<{ facilities: FacilityRecord[]; prices: PriceRecord[] }> {
  const facilities: FacilityRecord[] = [];
  const prices: PriceRecord[] = [];

  const queryLabel = `${study.modality}|${study.body_part}|${study.protocol}|${study.cpt_code}_zip=${zip}`;
  console.log(`Searching: ${study.service_name} near ${zip}`);

  try {
    const ajaxData = new URLSearchParams();
    ajaxData.append('Input_Study_Search[]', study.cpt_code);
    ajaxData.append('Input_Zipcode_Simple', zip);
    ajaxData.append('Sort', 'Distance');
    ajaxData.append('Input_Template', 'AHG_Client');
    ajaxData.append('Distance', '50');
    ajaxData.append('ra_payor_id', '99313');
    ajaxData.append('ra_affiliate_id', '');

    const res = await fetch('https://radiologyassist.com/js/Update_Search_Results/Update_Search_Results.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Referer': 'https://assisthealthgroup.com/client/ra-search-results/',
        'Cookie': sessionCookie,
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
      body: ajaxData.toString(),
    });

    const html = await res.text();
    const $ = load(html);

    // Extract facilities from the AJAX response HTML
    // Each facility has IDs like Facility_Name_{id}, Facility_Address_Street_{id}, etc.
    const facilityIds = new Set<string>();
    $('[id^="Facility_Name_"]').each((_, el) => {
      const id = $(el).attr('id')?.replace('Facility_Name_', '') || '';
      if (id) facilityIds.add(id);
    });

    for (const fid of facilityIds) {
      const name = normalizeWhitespace($(`#Facility_Name_${fid}`).text());
      const street = normalizeWhitespace($(`#Facility_Address_Street_${fid}`).text());
      const city = normalizeWhitespace($(`#Facility_Address_City_${fid}`).text());
      const state = normalizeWhitespace($(`#Facility_Address_State_${fid}`).text());
      const zipcode = normalizeWhitespace($(`#Facility_Address_Zipcode_${fid}`).text());
      const priceText = normalizeWhitespace($(`#Price_${fid}`).text());
      const priceMatch = priceText.match(/\$?([\d,]+\.?\d*)/);
      const price = priceMatch ? priceMatch[1] : '';

      // Distance is in text near the address, e.g. "(2.83 mi)"
      const distanceEl = $(`#Facility_Address_Zipcode_${fid}`).parent();
      const distanceMatch = distanceEl.text().match(/\(([\d.]+)\s*mi\)/);
      const distance = distanceMatch ? `${distanceMatch[1]} mi` : '';

      if (!name) continue;

      const facility: FacilityRecord = {
        seed_search_type: 'zip',
        seed_search_value: zip,
        seed_state: '',
        facility_name: name,
        address: street,
        city,
        state,
        zip: zipcode,
        phone: '',
        modalities_available: study.modality,
        facility_profile_url: '',
        notes: distance ? `Distance: ${distance}. Phone not exposed in search results.` : 'Phone not exposed in search results.',
        scrape_timestamp: new Date().toISOString(),
      };

      facilities.push(facility);

      prices.push({
        facility_name: name,
        service_name: study.service_name,
        modality: study.modality,
        body_part: study.body_part,
        price,
        address: street,
        city,
        state,
        zip: zipcode,
        phone: '',
        source_seed: queryLabel,
        scrape_timestamp: new Date().toISOString(),
      });
    }

    console.log(`  Facilities found: ${facilities.length}, Prices found: ${prices.length}`);
  } catch (err: any) {
    console.error(`  Search failed: ${queryLabel} - ${err.message}`);
  }

  return { facilities, prices };
}

async function main() {
  console.log('========================================');
  console.log('  RADIOLOGY ASSIST COLLECTOR');
  console.log(`  Dry-run: ${DRY_RUN}`);
  console.log('========================================\n');

  const rawCheckpoint = await loadCheckpoint<Partial<RadiAssistCheckpoint>>(CHECKPOINT_FILE, {});
  const checkpoint: RadiAssistCheckpoint = {
    loggedIn: rawCheckpoint.loggedIn ?? false,
    directoryChecked: rawCheckpoint.directoryChecked ?? false,
    directoryExists: rawCheckpoint.directoryExists ?? false,
    completedQueries: rawCheckpoint.completedQueries ?? [],
    failedQueries: rawCheckpoint.failedQueries ?? [],
    seenFacilities: rawCheckpoint.seenFacilities ?? [],
  };

  if (!DRY_RUN) {
    await backupFileIfExists(PRICES_CSV);
    await backupFileIfExists(PRICES_JSONL);
    await backupFileIfExists(FACILITIES_CSV);
    await backupFileIfExists(FACILITIES_JSONL);
    await backupFileIfExists(AUDIT_FILE);
    await ensureFileHeader(PRICES_CSV, PRICE_HEADERS);
    await ensureFileHeader(FACILITIES_CSV, FACILITY_HEADERS);
    await ensureAuditHeader(AUDIT_FILE);
  }

  // Step 1: Login
  if (!checkpoint.loggedIn) {
    if (DRY_RUN) {
      console.log('[DRY-RUN] Skipping login.');
      checkpoint.loggedIn = true;
    } else {
      const success = await attemptLogin();
      if (!success) {
        console.error('Login failed. Exiting.');
        process.exit(1);
      }
      checkpoint.loggedIn = true;
      await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
    }
  } else {
    console.log('Resuming: already logged in per checkpoint.');
  }

  // Step 2: Check directory
  if (!checkpoint.directoryChecked) {
    if (DRY_RUN) {
      console.log('[DRY-RUN] Skipping directory check.');
      checkpoint.directoryChecked = true;
      checkpoint.directoryExists = false;
    } else {
      const exists = await checkDirectoryExists();
      checkpoint.directoryChecked = true;
      checkpoint.directoryExists = exists;
      await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
    }
  }

  // Step 3: Load seeds and studies
  const seeds = await loadSeeds();
  const studies = getDefaultStudies();
  console.log(`Loaded ${seeds.length} seed rows from ${SEEDS_FILE}`);
  console.log(`Loaded ${studies.length} study definitions`);

  const completedSet = new Set(checkpoint.completedQueries);
  const failedSet = new Set(checkpoint.failedQueries);
  const seenFacilities = new Set<string>(checkpoint.seenFacilities);

  let uniqueFacilities = 0;
  let skippedFacilities = 0;
  let priceRecords = 0;

  // Build query matrix: study × zip
  const queries: { study: StudyDef; zip: string; label: string }[] = [];
  for (const seed of seeds) {
    if (seed.search_type === 'zip') {
      for (const study of studies) {
        const label = `${study.cpt_code}_${seed.search_value}`;
        queries.push({ study, zip: seed.search_value, label });
      }
    } else {
      // For city seeds, we still need a zip to search. Use the city name as zip input
      // The AJAX endpoint accepts "Zipcode or City"
      for (const study of studies) {
        const cityQuery = seed.state_optional
          ? `${seed.search_value}, ${seed.state_optional}`
          : seed.search_value;
        const label = `${study.cpt_code}_${cityQuery}`;
        queries.push({ study, zip: cityQuery, label });
      }
    }
  }

  const remainingQueries = queries.filter((q) => !completedSet.has(q.label) && !failedSet.has(q.label));

  console.log(`\nTotal queries: ${queries.length}`);
  console.log(`Remaining: ${remainingQueries.length}`);
  console.log(`Completed: ${completedSet.size}`);
  console.log(`Failed: ${failedSet.size}\n`);

  for (let i = 0; i < remainingQueries.length; i++) {
    const { study, zip, label } = remainingQueries[i];

    console.log(`Query ${i + 1}/${remainingQueries.length}: ${study.service_name} near ${zip}`);

    try {
      const { facilities, prices } = await searchByStudyAndZip(study, zip);

      for (const f of facilities) {
        const key = facilityDedupeKey(f);
        if (seenFacilities.has(key)) {
          skippedFacilities++;
          continue;
        }
        seenFacilities.add(key);
        checkpoint.seenFacilities.push(key);
        uniqueFacilities++;

        if (!DRY_RUN) {
          await appendCsvRow(FACILITIES_CSV, FACILITY_HEADERS, {
            seed_search_type: f.seed_search_type,
            seed_search_value: f.seed_search_value,
            seed_state: f.seed_state,
            facility_name: f.facility_name,
            address: f.address,
            city: f.city,
            state: f.state,
            zip: f.zip,
            phone: f.phone,
            modalities_available: f.modalities_available,
            facility_profile_url: f.facility_profile_url,
            notes: f.notes,
            scrape_timestamp: f.scrape_timestamp,
          });
          await appendJsonl(FACILITIES_JSONL, f);
        }
      }

      for (const p of prices) {
        priceRecords++;
        if (!DRY_RUN) {
          await appendCsvRow(PRICES_CSV, PRICE_HEADERS, {
            facility_name: p.facility_name,
            service_name: p.service_name,
            modality: p.modality,
            body_part: p.body_part,
            price: p.price,
            address: p.address,
            city: p.city,
            state: p.state,
            zip: p.zip,
            phone: p.phone,
            source_seed: p.source_seed,
            scrape_timestamp: p.scrape_timestamp,
          });
          await appendJsonl(PRICES_JSONL, p);
        }
      }

      if (!DRY_RUN) {
        await appendAudit(AUDIT_FILE, {
          url: 'https://radiologyassist.com/js/Update_Search_Results/Update_Search_Results.php',
          status: 'success',
          source_page_type: 'ajax',
          timestamp: new Date().toISOString(),
        });
      }

      checkpoint.completedQueries.push(label);
      completedSet.add(label);
    } catch (err: any) {
      console.error(`  Query failed: ${label} - ${err.message}`);
      checkpoint.failedQueries.push(label);
      failedSet.add(label);
      if (!DRY_RUN) {
        await appendAudit(AUDIT_FILE, {
          url: 'https://radiologyassist.com/js/Update_Search_Results/Update_Search_Results.php',
          status: 'failed',
          error: err.message,
          source_page_type: 'ajax',
          timestamp: new Date().toISOString(),
        });
      }
    }

    if (!DRY_RUN) await saveCheckpoint(CHECKPOINT_FILE, checkpoint);
    await delay(800 + Math.random() * 700);

    if (i % 10 === 0 && i > 0) {
      console.log(
        `\n--- Progress: ${i}/${remainingQueries.length} queries, ${uniqueFacilities} facilities, ${skippedFacilities} duplicates, ${priceRecords} prices ---\n`
      );
    }
  }

  console.log('\n========================================');
  console.log('  RADIOLOGY ASSIST COLLECTION COMPLETE');
  console.log(`  Unique facilities: ${uniqueFacilities}`);
  console.log(`  Duplicate facilities skipped: ${skippedFacilities}`);
  console.log(`  Price records: ${priceRecords}`);
  console.log(`  Failed queries: ${failedSet.size}`);
  console.log(`  Dry-run: ${DRY_RUN}`);
  console.log('========================================');
}

main().catch((err) => {
  console.error('Fatal error:', err);
  process.exit(1);
});
