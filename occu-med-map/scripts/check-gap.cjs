const fs = require('fs');

const raw = fs.readFileSync('bluehive_scrape_audit.csv', 'utf-8').trim();
const lines = raw.split('\n');
const headers = lines[0].split(',');
console.log('Headers:', headers);

let providerNoData = 0;
let providerSuccess = 0;
let providerFailed = 0;
let citySuccess = 0;
let cityFailed = 0;

for (let i = 1; i < lines.length; i++) {
  const parts = lines[i].split(',');
  const status = parts[1];
  const sourceType = parts[3];
  if (sourceType === 'provider') {
    if (status === 'success') providerSuccess++;
    else if (status === 'no-data') providerNoData++;
    else if (status === 'failed') providerFailed++;
  } else if (sourceType === 'city') {
    if (status === 'success') citySuccess++;
    else if (status === 'failed') cityFailed++;
  }
}

console.log('Provider audits:');
console.log('  success:', providerSuccess);
console.log('  no-data:', providerNoData);
console.log('  failed:', providerFailed);
console.log('City audits:');
console.log('  success:', citySuccess);
console.log('  failed:', cityFailed);

const jsonlLines = fs.readFileSync('bluehive_providers.jsonl', 'utf-8').trim().split('\n').length;
console.log('JSONL records:', jsonlLines);
console.log('Expected JSONL (providerSuccess - duplicates):', providerSuccess - 3);
console.log('Gap (JSONL - expected):', jsonlLines - (providerSuccess - 3));
