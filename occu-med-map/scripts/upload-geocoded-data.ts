import { neon } from '@neondatabase/serverless';
import * as XLSX from 'xlsx';
import * as fs from 'fs';
import dotenv from 'dotenv';

dotenv.config();

// Target categories matching the refined scope
const TARGET_CATEGORIES = [
  'Dentist',
  'General Practitioner',
  'Cardiologist',
  'Internal Medicine',
  'Occupational Health Specialist',
  'Occupational Health Clinic',
  'Audiologist',
  'Radiology Imaging Center',
  'Medical Clinic',
  'Private Practice',
  'Urgent Care',
  'Polyclinic',
  'Hospital',
  'Primary Care Provider',
  'Independent Medical Examiner',
  'Orthopedist',
  'Pulmonologist',
  'Neurologist'
];

interface GeocodedProvider {
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
  [key: string]: any; // Allow additional fields
}

class GeocodedDataUploader {
  private db: any;
  private databaseUrl: string;

  constructor(databaseUrl: string) {
    this.databaseUrl = databaseUrl;
    this.db = neon(databaseUrl);
  }

  async initializeDatabase() {
    console.log('Initializing database for geocoded data upload...');
    
    const schema = `
      -- Add column to track data source type
      ALTER TABLE medical_providers 
      ADD COLUMN IF NOT EXISTS source_type TEXT DEFAULT 'scraped';
      
      -- Create index on source_type
      CREATE INDEX IF NOT EXISTS idx_medical_providers_source_type ON medical_providers(source_type);
      
      -- Create uploaded data tracking table
      CREATE TABLE IF NOT EXISTS uploaded_data_batches (
        id SERIAL PRIMARY KEY,
        batch_name TEXT NOT NULL,
        file_name TEXT NOT NULL,
        total_records INTEGER DEFAULT 0,
        successful_uploads INTEGER DEFAULT 0,
        failed_uploads INTEGER DEFAULT 0,
        upload_date TIMESTAMP DEFAULT NOW(),
        categories TEXT[],
        notes TEXT
      );
    `;
    
    try {
      await this.db.query(schema);
      console.log('Database initialized for geocoded data upload');
    } catch (error) {
      console.error('Error initializing database:', error);
      throw error;
    }
  }

  validateCategory(category: string): boolean {
    return TARGET_CATEGORIES.includes(category);
  }

  normalizeCategory(category: string): string {
    // Normalize category names to match target categories
    const normalized = category.trim();
    
    // Common mappings
    const mappings: Record<string, string> = {
      'General Dentist': 'Dentist',
      'Family Dentist': 'Dentist',
      'Dental Clinic': 'Dentist',
      'Family Doctor': 'General Practitioner',
      'Family Physician': 'General Practitioner',
      'Primary Care': 'Primary Care Provider',
      'PCP': 'Primary Care Provider',
      'Heart Doctor': 'Cardiologist',
      'Heart Specialist': 'Cardiologist',
      'Occupational Doctor': 'Occupational Health Specialist',
      'Occ Med': 'Occupational Health Clinic',
      'Hearing Doctor': 'Audiologist',
      'Imaging Center': 'Radiology Imaging Center',
      'Diagnostic Imaging': 'Radiology Imaging Center',
      'Medical Center': 'Hospital',
      'Walk-in Clinic': 'Urgent Care',
      'Immediate Care': 'Urgent Care',
      'Bone Doctor': 'Orthopedist',
      'Lung Doctor': 'Pulmonologist',
      'Brain Doctor': 'Neurologist'
    };
    
    if (mappings[normalized]) {
      return mappings[normalized];
    }
    
    return normalized;
  }

  async uploadProvider(provider: GeocodedProvider, batchId: number): Promise<boolean> {
    const normalizedCategory = this.normalizeCategory(provider.category);
    
    if (!this.validateCategory(normalizedCategory)) {
      console.log(`Skipping invalid category: ${provider.category} -> ${normalizedCategory}`);
      return false;
    }

    // Generate source_id from provider data
    const sourceId = `uploaded_${this.generateHash(provider.name, provider.address, provider.lat, provider.lng)}`;

    const query = `
      INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
      ) VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, NOW(), NOW()
      )
      ON CONFLICT (source_id) 
      DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score)
      RETURNING id
    `;

    try {
      const result = await this.db.query(query, [
        sourceId,
        provider.name,
        provider.address,
        provider.lat,
        provider.lng,
        [normalizedCategory],
        normalizedCategory,
        provider.phone || null,
        provider.website || null,
        provider.country || null,
        provider.city || null,
        provider.state || null,
        provider.postal_code || null,
        'uploaded',
        sourceId,
        'uploaded',
        0.95, // High confidence for uploaded data
        JSON.stringify(provider)
      ]);
      
      return result.rows.length > 0;
    } catch (error) {
      console.error('Error uploading provider:', error);
      return false;
    }
  }

  generateHash(name: string, address: string, lat: number, lng: number): string {
    const str = `${name}|${address}|${lat}|${lng}`;
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
      const char = str.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash; // Convert to 32bit integer
    }
    return Math.abs(hash).toString(36);
  }

  async uploadFromCSV(filePath: string, batchName: string): Promise<void> {
    console.log(`Reading CSV file: ${filePath}`);
    
    if (!fs.existsSync(filePath)) {
      throw new Error(`File not found: ${filePath}`);
    }

    const workbook = XLSX.readFile(filePath);
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(worksheet);

    await this.uploadData(data, batchName, filePath);
  }

  async uploadFromJSON(filePath: string, batchName: string): Promise<void> {
    console.log(`Reading JSON file: ${filePath}`);
    
    if (!fs.existsSync(filePath)) {
      throw new Error(`File not found: ${filePath}`);
    }

    const data = JSON.parse(fs.readFileSync(filePath, 'utf-8'));
    
    await this.uploadData(Array.isArray(data) ? data : [data], batchName, filePath);
  }

  async uploadData(data: any[], batchName: string, fileName: string): Promise<void> {
    console.log(`Processing ${data.length} records...`);
    
    // Create batch record
    const batchResult = await this.db.query(
      `INSERT INTO uploaded_data_batches (batch_name, file_name, total_records, categories)
       VALUES ($1, $2, $3, $4)
       RETURNING id`,
      [batchName, fileName, data.length, TARGET_CATEGORIES]
    );
    
    const batchId = batchResult.rows[0].id;
    let successful = 0;
    let failed = 0;
    const categoriesFound = new Set<string>();

    for (let i = 0; i < data.length; i++) {
      const record = data[i];
      
      try {
        // Map record fields to standard format
        const provider: GeocodedProvider = {
          name: record.name || record.Name || record.provider_name || 'Unknown',
          address: record.address || record.Address || record.full_address || record.formatted_address || '',
          lat: parseFloat(record.lat || record.latitude || record.Lat || record.Latitude || '0'),
          lng: parseFloat(record.lng || record.longitude || record.Lng || record.Longitude || record.lon || record.Lon || '0'),
          category: record.category || record.Category || record.type || record.Type || record.medical_category || 'Medical Clinic',
          phone: record.phone || record.Phone || record.contact_phone || null,
          website: record.website || record.Website || record.url || null,
          country: record.country || record.Country || null,
          city: record.city || record.City || null,
          state: record.state || record.State || record.province || null,
          postal_code: record.postal_code || record.postalCode || record.zip || record.Zip || null
        };

        // Validate coordinates
        if (provider.lat === 0 || provider.lng === 0) {
          console.log(`Skipping record ${i + 1}: Invalid coordinates`);
          failed++;
          continue;
        }

        // Upload provider
        const uploaded = await this.uploadProvider(provider, batchId);
        if (uploaded) {
          successful++;
          categoriesFound.add(provider.category);
        } else {
          failed++;
        }

        // Progress update every 100 records
        if ((i + 1) % 100 === 0) {
          console.log(`Progress: ${i + 1}/${data.length} (${successful} successful, ${failed} failed)`);
        }
      } catch (error) {
        console.error(`Error processing record ${i + 1}:`, error);
        failed++;
      }
    }

    // Update batch record
    await this.db.query(
      `UPDATE uploaded_data_batches 
       SET successful_uploads = $1, failed_uploads = $2, categories = $3
       WHERE id = $4`,
      [successful, failed, Array.from(categoriesFound), batchId]
    );

    console.log(`\nUpload complete:`);
    console.log(`Total records: ${data.length}`);
    console.log(`Successful: ${successful}`);
    console.log(`Failed: ${failed}`);
    console.log(`Categories found: ${Array.from(categoriesFound).join(', ')}`);
  }

  async getUploadStats() {
    const result = await this.db.query(`
      SELECT 
        source_type,
        COUNT(*) as count,
        COUNT(DISTINCT category) as categories
      FROM medical_providers
      GROUP BY source_type
    `);
    
    console.log('\nDatabase stats by source type:');
    result.rows.forEach((row: any) => {
      console.log(`${row.source_type}: ${row.count} providers, ${row.categories} categories`);
    });
  }

  async getCategoryStats() {
    const result = await this.db.query(`
      SELECT 
        category,
        COUNT(*) as count,
        source_type
      FROM medical_providers
      WHERE source_type = 'uploaded'
      GROUP BY category, source_type
      ORDER BY count DESC
    `);
    
    console.log('\nUploaded data by category:');
    result.rows.forEach((row: any) => {
      console.log(`${row.category}: ${row.count} providers`);
    });
  }
}

// Main execution
async function main() {
  const databaseUrl = process.env.NEON_DATABASE_URL;

  if (!databaseUrl) {
    console.error('NEON_DATABASE_URL environment variable is required');
    process.exit(1);
  }

  const uploader = new GeocodedDataUploader(databaseUrl);

  try {
    await uploader.initializeDatabase();

    // Get file path from command line arguments
    const filePath = process.argv[2];
    const batchName = process.argv[3] || 'Manual Upload';

    if (!filePath) {
      console.log('Usage: pnpm upload:geocoded <file_path> [batch_name]');
      console.log('\nSupported formats: CSV, XLSX, JSON');
      console.log('\nExample:');
      console.log('  pnpm upload:geocoded ./data/providers.csv "US Dentists"');
      console.log('  pnpm upload:geocoded ./data/hospitals.xlsx "Global Hospitals"');
      
      // Show current stats
      await uploader.getUploadStats();
      await uploader.getCategoryStats();
      return;
    }

    const fileExt = filePath.split('.').pop()?.toLowerCase();

    if (fileExt === 'csv' || fileExt === 'xlsx' || fileExt === 'xls') {
      await uploader.uploadFromCSV(filePath, batchName);
    } else if (fileExt === 'json') {
      await uploader.uploadFromJSON(filePath, batchName);
    } else {
      console.error('Unsupported file format. Use CSV, XLSX, or JSON');
      process.exit(1);
    }

    // Show stats after upload
    await uploader.getUploadStats();
    await uploader.getCategoryStats();

  } catch (error) {
    console.error('Upload failed:', error);
    process.exit(1);
  }
}

main();
