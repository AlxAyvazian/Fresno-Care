const fs = require('fs');

const JSONL_FILE = 'bluehive_providers.jsonl';
const CHECKPOINT_FILE = '.bluehive-scrape-checkpoint.json';
const FINAL_CSV = 'bluehive_providers_FINAL_CLEAN.csv';
const FINAL_JSON = 'bluehive_providers_FINAL_CLEAN.json';
const VALIDATION_REPORT = 'bluehive_final_validation_report.csv';

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

function escapeCsv(val) {
  if (val === null || val === undefined) return '';
  const s = String(val);
  if (/[",\n\r]/.test(s)) {
    return `"${s.replace(/"/g, '""')}"`;
  }
  return s;
}

function normalize(str) {
  return String(str || '').toLowerCase().trim().replace(/\s+/g, ' ');
}

// Read JSONL
console.log('Reading JSONL...');
const raw = fs.readFileSync(JSONL_FILE, 'utf-8');
const lines = raw.trim().split('\n').filter(Boolean);
console.log(`  Total JSONL lines: ${lines.length}`);

const records = [];
for (const line of lines) {
  try {
    records.push(JSON.parse(line));
  } catch {
    console.error('  Failed to parse line:', line.slice(0, 100));
  }
}
console.log(`  Parsed records: ${records.length}`);

// Deduplicate
const seenSourceUrl = new Set();
const seenComposite = new Set();
const uniqueRecords = [];
const duplicates = [];

for (const r of records) {
  const sourceUrl = r.source_url || '';
  const compositeKey = `${normalize(r.clinic_name)}|${normalize(r.address_1)}|${normalize(r.city)}|${normalize(r.state)}|${normalize(r.phone)}`;

  const dupSource = seenSourceUrl.has(sourceUrl);
  const dupComposite = seenComposite.has(compositeKey);

  if (dupSource || dupComposite) {
    duplicates.push({ record: r, dupSource, dupComposite });
  } else {
    seenSourceUrl.add(sourceUrl);
    seenComposite.add(compositeKey);
    uniqueRecords.push(r);
  }
}

console.log(`  Unique records: ${uniqueRecords.length}`);
console.log(`  Duplicates removed: ${duplicates.length}`);

// Write clean CSV
console.log('\nWriting final CSV...');
let csvContent = PROVIDER_HEADERS.map(escapeCsv).join(',') + '\n';
for (const r of uniqueRecords) {
  const line = PROVIDER_HEADERS.map((h) => escapeCsv(r[h] || '')).join(',');
  csvContent += line + '\n';
}
fs.writeFileSync(FINAL_CSV, csvContent);
console.log(`  Wrote ${FINAL_CSV}`);

// Write clean JSON
console.log('\nWriting final JSON...');
fs.writeFileSync(FINAL_JSON, JSON.stringify(uniqueRecords, null, 2));
console.log(`  Wrote ${FINAL_JSON}`);

// Validation stats
const checkpoint = JSON.parse(fs.readFileSync(CHECKPOINT_FILE, 'utf-8'));

const states = new Set();
const cities = new Set();
let blankClinicName = 0;
let blankAddress = 0;
let blankPhone = 0;
let dupSourceUrl = 0;
let dupComposite = 0;

for (const r of uniqueRecords) {
  if (r.state) states.add(r.state);
  if (r.city) cities.add(`${r.city}, ${r.state}`);
  if (!normalize(r.clinic_name)) blankClinicName++;
  if (!normalize(r.address_1)) blankAddress++;
  if (!normalize(r.phone)) blankPhone++;
}

for (const d of duplicates) {
  if (d.dupSource) dupSourceUrl++;
  if (d.dupComposite) dupComposite++;
}

// Write validation report
console.log('\nWriting validation report...');
const reportRows = [
  ['metric', 'value'],
  ['total_provider_profiles_completed_from_checkpoint', checkpoint.completed.length],
  ['failed_count_from_checkpoint', checkpoint.failed.length],
  ['jsonl_record_count', records.length],
  ['final_unique_csv_row_count', uniqueRecords.length],
  ['duplicate_records_removed', duplicates.length],
  ['states_represented', states.size],
  ['city_count_represented', cities.size],
  ['blank_clinic_name_count', blankClinicName],
  ['blank_address_count', blankAddress],
  ['blank_phone_count', blankPhone],
  ['duplicate_source_url_count', dupSourceUrl],
  ['duplicate_clinic_address_phone_count', dupComposite],
];

let reportCsv = '';
for (const row of reportRows) {
  reportCsv += row.map(escapeCsv).join(',') + '\n';
}
fs.writeFileSync(VALIDATION_REPORT, reportCsv);
console.log(`  Wrote ${VALIDATION_REPORT}`);

// Console summary
console.log('\n========================================');
console.log('  FINAL CLEAN FILES GENERATED');
console.log('========================================');
console.log(`Checkpoint completed profiles: ${checkpoint.completed.length}`);
console.log(`Checkpoint failed: ${checkpoint.failed.length}`);
console.log(`JSONL record count: ${records.length}`);
console.log(`Final unique CSV rows: ${uniqueRecords.length}`);
console.log(`Duplicates removed: ${duplicates.length}`);
console.log(`States represented: ${states.size}`);
console.log(`Cities represented: ${cities.size}`);
console.log(`Blank clinic_name: ${blankClinicName}`);
console.log(`Blank address: ${blankAddress}`);
console.log(`Blank phone: ${blankPhone}`);
console.log(`Duplicate source_url: ${dupSourceUrl}`);
console.log(`Duplicate clinic/address/phone: ${dupComposite}`);
console.log('========================================');
