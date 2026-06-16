import * as XLSX from 'xlsx';
import * as fs from 'fs';
import * as path from 'path';

interface Provider {
  name: string;
  address: string;
  lat: number;
  lng: number;
  category: string;
  phone?: string;
  website?: string;
  country?: string;
  city?: string;
  state?: string;
  postal_code?: string;
  [key: string]: any;
}

class DataDeduplicator {
  deduplicateProviders(providers: Provider[]): Provider[] {
    const seen = new Set<string>();
    const deduplicated: Provider[] = [];

    for (const provider of providers) {
      // Create hash from name, address, lat, lng
      const hash = this.generateHash(provider.name, provider.address, provider.lat, provider.lng);
      
      if (!seen.has(hash)) {
        seen.add(hash);
        deduplicated.push(provider);
      }
    }

    return deduplicated;
  }

  generateHash(name: string, address: string, lat: number, lng: number): string {
    const str = `${name}|${address}|${lat}|${lng}`;
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
      const char = str.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash;
    }
    return Math.abs(hash).toString(36);
  }

  analyzeFile(filePath: string): any {
    const workbook = XLSX.readFile(filePath);
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(worksheet);

    const analysis = {
      totalRecords: data.length,
      columns: Object.keys(data[0] || {}),
      sampleData: data.slice(0, 5),
      nullCounts: this.countNulls(data),
      duplicateEstimate: this.estimateDuplicates(data)
    };

    return analysis;
  }

  countNulls(data: any[]): Record<string, number> {
    const nullCounts: Record<string, number> = {};
    
    if (data.length === 0) return nullCounts;

    Object.keys(data[0]).forEach(key => {
      nullCounts[key] = 0;
    });

    data.forEach(row => {
      Object.keys(row).forEach(key => {
        if (row[key] === null || row[key] === undefined || row[key] === '') {
          nullCounts[key]++;
        }
      });
    });

    return nullCounts;
  }

  estimateDuplicates(data: any[]): number {
    const seen = new Set<string>();
    let duplicates = 0;

    data.forEach(row => {
      const name = row.name || row.Name || '';
      const address = row.address || row.Address || '';
      const lat = row.lat || row.latitude || row.Lat || row.Latitude || 0;
      const lng = row.lng || row.longitude || row.Lng || row.Longitude || 0;

      const hash = this.generateHash(name, address, lat, lng);
      
      if (seen.has(hash)) {
        duplicates++;
      } else {
        seen.add(hash);
      }
    });

    return duplicates;
  }

  processAndSave(filePath: string, outputPath: string): Provider[] {
    const workbook = XLSX.readFile(filePath);
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(worksheet);

    console.log(`Processing ${data.length} records...`);

    // Map to standard format
    const providers: Provider[] = data.map((row: any) => ({
      name: row.name || row.Name || row.provider_name || row['Provider Name'] || 'Unknown',
      address: row.address || row.Address || row.full_address || row.formatted_address || row['Full Address'] || '',
      lat: parseFloat(row.lat || row.latitude || row.Lat || row.Latitude || row['Latitude'] || '0'),
      lng: parseFloat(row.lng || row.longitude || row.Lng || row.Longitude || row['Longitude'] || '0'),
      category: row.category || row.Category || row.type || row.Type || row['Category'] || 'Urgent Care',
      phone: row.phone || row.Phone || row.contact_phone || row['Phone'] || null,
      website: row.website || row.Website || row.url || row['Website'] || null,
      country: row.country || row.Country || row['Country'] || null,
      city: row.city || row.City || row['City'] || null,
      state: row.state || row.State || row.province || row['State'] || null,
      postal_code: row.postal_code || row.postalCode || row.zip || row.Zip || row['Zip Code'] || null
    }));

    // Deduplicate
    const deduplicated = this.deduplicateProviders(providers);
    
    console.log(`Original: ${providers.length} records`);
    console.log(`After deduplication: ${deduplicated.length} records`);
    console.log(`Removed: ${providers.length - deduplicated.length} duplicates`);

    // Save deduplicated data
    const newWorkbook = XLSX.utils.book_new();
    const newWorksheet = XLSX.utils.json_to_sheet(deduplicated);
    XLSX.utils.book_append_sheet(newWorkbook, newWorksheet, 'Deduplicated');
    XLSX.writeFile(newWorkbook, outputPath);

    console.log(`Saved deduplicated data to: ${outputPath}`);

    return deduplicated;
  }
}

// Main execution
async function main() {
  const filePath = process.argv[2];
  const outputPath = process.argv[3] || './data/deduplicated.xlsx';

  if (!filePath) {
    console.log('Usage: pnpm deduplicate <input_file> [output_file]');
    console.log('\nExample:');
    console.log('  pnpm deduplicate ./data/urgent-cares.xlsx ./data/urgent-cares-dedup.xlsx');
    process.exit(1);
  }

  if (!fs.existsSync(filePath)) {
    console.error(`File not found: ${filePath}`);
    process.exit(1);
  }

  const deduplicator = new DataDeduplicator();

  console.log('Analyzing file...');
  const analysis = deduplicator.analyzeFile(filePath);

  console.log('\n=== File Analysis ===');
  console.log(`Total records: ${analysis.totalRecords}`);
  console.log(`Columns: ${analysis.columns.join(', ')}`);
  console.log(`Estimated duplicates: ${analysis.duplicateEstimate}`);
  console.log('\n=== Null Counts ===');
  Object.entries(analysis.nullCounts).forEach(([col, count]) => {
    console.log(`${col}: ${count} nulls`);
  });
  console.log('\n=== Sample Data ===');
  console.log(JSON.stringify(analysis.sampleData, null, 2));

  console.log('\n=== Processing ===');
  const deduplicated = deduplicator.processAndSave(filePath, outputPath);

  console.log('\n=== Complete ===');
  console.log(`Original: ${analysis.totalRecords}`);
  console.log(`Deduplicated: ${deduplicated.length}`);
  console.log(`Duplicates removed: ${analysis.totalRecords - deduplicated.length}`);
}

main();
