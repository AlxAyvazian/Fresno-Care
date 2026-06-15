const fs = require('fs');

const raw = fs.readFileSync('bluehive_providers_FINAL_CLEAN.csv', 'utf-8');

function parseCsv(text) {
  const rows = [];
  let currentRow = [];
  let currentField = '';
  let inQuotes = false;

  for (let i = 0; i < text.length; i++) {
    const char = text[i];
    const nextChar = text[i + 1];

    if (inQuotes) {
      if (char === '"' && nextChar === '"') {
        currentField += '"';
        i++;
      } else if (char === '"') {
        inQuotes = false;
      } else {
        currentField += char;
      }
    } else {
      if (char === '"') {
        inQuotes = true;
      } else if (char === ',') {
        currentRow.push(currentField);
        currentField = '';
      } else if (char === '\n') {
        currentRow.push(currentField);
        rows.push(currentRow);
        currentRow = [];
        currentField = '';
      } else if (char === '\r') {
        if (nextChar === '\n') i++;
        currentRow.push(currentField);
        rows.push(currentRow);
        currentRow = [];
        currentField = '';
      } else {
        currentField += char;
      }
    }
  }

  if (currentField !== '' || currentRow.length > 0) {
    currentRow.push(currentField);
    rows.push(currentRow);
  }

  return rows;
}

const rows = parseCsv(raw);
console.log('Parsed rows:', rows.length);
console.log('Header columns:', rows[0].length);
console.log('Data rows:', rows.length - 1);

let mismatch = 0;
for (let i = 1; i < rows.length; i++) {
  if (rows[i].length !== 17) mismatch++;
}
console.log('Rows with wrong column count:', mismatch);
