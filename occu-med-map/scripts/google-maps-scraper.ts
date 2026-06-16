import { neon } from '@neondatabase/serverless';
import dotenv from 'dotenv';

dotenv.config();

// Database schema for global medical providers
const SCHEMA_SQL = `
-- Medical providers table
CREATE TABLE IF NOT EXISTS medical_providers (
  id SERIAL PRIMARY KEY,
  place_id TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  formatted_address TEXT,
  lat DECIMAL(10, 7) NOT NULL,
  lng DECIMAL(10, 7) NOT NULL,
  types TEXT[],
  category TEXT,
  subcategory TEXT,
  phone TEXT,
  website TEXT,
  rating DECIMAL(3, 2),
  user_ratings_total INTEGER,
  price_level INTEGER,
  opening_hours JSONB,
  business_status TEXT,
  permanently_closed BOOLEAN DEFAULT FALSE,
  country_code TEXT,
  administrative_area_level_1 TEXT,
  administrative_area_level_2 TEXT,
  locality TEXT,
  postal_code TEXT,
  scraped_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  data_source TEXT DEFAULT 'google_maps',
  raw_data JSONB
);

-- Indexes for efficient querying
CREATE INDEX IF NOT EXISTS idx_medical_providers_place_id ON medical_providers(place_id);
CREATE INDEX IF NOT EXISTS idx_medical_providers_lat_lng ON medical_providers(lat, lng);
CREATE INDEX IF NOT EXISTS idx_medical_providers_category ON medical_providers(category);
CREATE INDEX IF NOT EXISTS idx_medical_providers_country ON medical_providers(country_code);
CREATE INDEX IF NOT EXISTS idx_medical_providers_locality ON medical_providers(locality);
CREATE INDEX IF NOT EXISTS idx_medical_providers_scraped_at ON medical_providers(scraped_at);

-- Scraping metadata table
CREATE TABLE IF NOT EXISTS scraping_metadata (
  id SERIAL PRIMARY KEY,
  search_term TEXT NOT NULL,
  location TEXT,
  lat DECIMAL(10, 7),
  lng DECIMAL(10, 7),
  radius_meters INTEGER,
  results_found INTEGER,
  results_saved INTEGER,
  api_calls_made INTEGER,
  started_at TIMESTAMP DEFAULT NOW(),
  completed_at TIMESTAMP,
  status TEXT DEFAULT 'in_progress',
  error_message TEXT
);

-- Medical categories reference table
CREATE TABLE IF NOT EXISTS medical_categories (
  id SERIAL PRIMARY KEY,
  category_name TEXT UNIQUE NOT NULL,
  search_terms TEXT[],
  priority INTEGER DEFAULT 0,
  enabled BOOLEAN DEFAULT TRUE
);

-- Insert common medical categories
INSERT INTO medical_categories (category_name, search_terms, priority) VALUES
('Hospital', ARRAY['hospital', 'medical center', 'emergency room'], 1),
('Clinic', ARRAY['clinic', 'medical clinic', 'health center'], 2),
('Doctor', ARRAY['doctor', 'physician', 'general practitioner', 'GP'], 3),
('Urgent Care', ARRAY['urgent care', 'walk-in clinic'], 4),
('Pharmacy', ARRAY['pharmacy', 'drugstore'], 5),
('Dentist', ARRAY['dentist', 'dental clinic', 'dental care'], 6),
('Laboratory', ARRAY['laboratory', 'lab', 'diagnostic center'], 7),
('Radiology', ARRAY['radiology', 'imaging center', 'x-ray', 'mri'], 8),
('Physical Therapy', ARRAY['physical therapy', 'physiotherapy', 'rehabilitation'], 9),
('Mental Health', ARRAY['psychiatrist', 'psychologist', 'mental health clinic'], 10),
('Optometry', ARRAY['optometrist', 'eye doctor', 'vision center'], 11),
('Audiology', ARRAY['audiologist', 'hearing clinic', 'hearing aid'], 12),
('Nursing Home', ARRAY['nursing home', 'assisted living', 'care facility'], 13),
('Specialist', ARRAY['cardiologist', 'dermatologist', 'orthopedic', 'pediatrician'], 14),
('Emergency', ARRAY['emergency department', 'trauma center', 'urgent care'], 15)
ON CONFLICT (category_name) DO NOTHING;
`;

// Medical category search terms for global scraping - refined target list
const MEDICAL_CATEGORIES = [
  { 
    category: 'Dentist', 
    terms: ['dentist', 'dental clinic', 'dental practice', 'general dentist'],
    exclude: ['orthodontist', 'periodontist', 'oral surgeon', 'endodontist', 'pediatric dentist']
  },
  { 
    category: 'General Practitioner', 
    terms: ['general practitioner', 'GP', 'family doctor', 'family physician', 'primary care physician'],
    exclude: ['pediatrician', 'geriatrician']
  },
  { 
    category: 'Cardiologist', 
    terms: ['cardiologist', 'heart doctor', 'cardiac specialist', 'cardiology clinic'],
    exclude: ['cardiac surgeon', 'cardiothoracic surgeon']
  },
  { 
    category: 'Internal Medicine', 
    terms: ['internal medicine', 'internist', 'internal medicine physician'],
    exclude: []
  },
  { 
    category: 'Occupational Health Specialist', 
    terms: ['occupational health doctor', 'occupational medicine physician', 'occupational health specialist'],
    exclude: []
  },
  { 
    category: 'Occupational Health Clinic', 
    terms: ['occupational health clinic', 'occupational medicine clinic', 'workplace health clinic', 'industrial medicine clinic'],
    exclude: []
  },
  { 
    category: 'Audiologist', 
    terms: ['audiologist', 'hearing doctor', 'audiology clinic', 'hearing specialist'],
    exclude: []
  },
  { 
    category: 'Radiology Imaging Center', 
    terms: ['radiology center', 'imaging center', 'diagnostic imaging', 'medical imaging', 'radiology clinic'],
    exclude: ['surgery center', 'surgical center']
  },
  { 
    category: 'Medical Clinic', 
    terms: ['medical clinic', 'clinic', 'health clinic', 'outpatient clinic'],
    exclude: ['surgical clinic', 'cosmetic clinic', 'urgent care', 'emergency clinic']
  },
  { 
    category: 'Private Practice', 
    terms: ['private practice', 'medical practice', 'physician practice', 'doctor office'],
    exclude: ['dental specialist', 'surgical practice']
  },
  { 
    category: 'Urgent Care', 
    terms: ['urgent care', 'walk-in clinic', 'immediate care', 'urgent care center'],
    exclude: ['emergency room', 'emergency department', 'trauma center']
  },
  { 
    category: 'Polyclinic', 
    terms: ['polyclinic', 'multi-specialty clinic', 'medical center'],
    exclude: ['hospital', 'surgical center']
  },
  { 
    category: 'Hospital', 
    terms: ['hospital', 'medical center'],
    exclude: ['surgical hospital', 'rehabilitation hospital', 'nursing home', 'long term care']
  },
  { 
    category: 'Primary Care Provider', 
    terms: ['primary care', 'primary care provider', 'PCP', 'family medicine'],
    exclude: ['pediatrician', 'geriatrician']
  },
  { 
    category: 'Independent Medical Examiner', 
    terms: ['independent medical examiner', 'IME', 'medical examiner', 'independent medical evaluation'],
    exclude: ['forensic pathologist', 'coroner']
  },
  { 
    category: 'Orthopedist', 
    terms: ['orthopedist', 'orthopedic doctor', 'orthopedic physician', 'bone doctor'],
    exclude: ['orthopedic surgeon', 'sports medicine surgeon']
  },
  { 
    category: 'Pulmonologist', 
    terms: ['pulmonologist', 'lung doctor', 'pulmonary specialist', 'respiratory doctor'],
    exclude: []
  },
  { 
    category: 'Neurologist', 
    terms: ['neurologist', 'brain doctor', 'neurology specialist', 'nerve specialist'],
    exclude: ['neurosurgeon']
  }
];

// Major cities/regions for global grid-based scraping
const GLOBAL_REGIONS = [
  // North America
  { name: 'New York', lat: 40.7128, lng: -74.0060, radius: 50000 },
  { name: 'Los Angeles', lat: 34.0522, lng: -118.2437, radius: 50000 },
  { name: 'Chicago', lat: 41.8781, lng: -87.6298, radius: 50000 },
  { name: 'Toronto', lat: 43.6532, lng: -79.3832, radius: 50000 },
  { name: 'Mexico City', lat: 19.4326, lng: -99.1332, radius: 50000 },
  
  // Europe
  { name: 'London', lat: 51.5074, lng: -0.1278, radius: 50000 },
  { name: 'Paris', lat: 48.8566, lng: 2.3522, radius: 50000 },
  { name: 'Berlin', lat: 52.5200, lng: 13.4050, radius: 50000 },
  { name: 'Madrid', lat: 40.4168, lng: -3.7038, radius: 50000 },
  { name: 'Rome', lat: 41.9028, lng: 12.4964, radius: 50000 },
  { name: 'Moscow', lat: 55.7558, lng: 37.6173, radius: 50000 },
  
  // Asia
  { name: 'Tokyo', lat: 35.6762, lng: 139.6503, radius: 50000 },
  { name: 'Shanghai', lat: 31.2304, lng: 121.4737, radius: 50000 },
  { name: 'Mumbai', lat: 19.0760, lng: 72.8777, radius: 50000 },
  { name: 'Singapore', lat: 1.3521, lng: 103.8198, radius: 50000 },
  { name: 'Hong Kong', lat: 22.3193, lng: 114.1694, radius: 50000 },
  { name: 'Seoul', lat: 37.5665, lng: 126.9780, radius: 50000 },
  
  // South America
  { name: 'São Paulo', lat: -23.5505, lng: -46.6333, radius: 50000 },
  { name: 'Buenos Aires', lat: -34.6037, lng: -58.3816, radius: 50000 },
  
  // Africa
  { name: 'Cairo', lat: 30.0444, lng: 31.2357, radius: 50000 },
  { name: 'Johannesburg', lat: -26.2041, lng: 28.0473, radius: 50000 },
  
  // Oceania
  { name: 'Sydney', lat: -33.8688, lng: 151.2093, radius: 50000 },
  { name: 'Melbourne', lat: -37.8136, lng: 144.9631, radius: 50000 },
];

class GoogleMapsScraper {
  private apiKey: string;
  private db: any;
  private baseUrl = 'https://maps.googleapis.com/maps/api/place';
  private apiCallsToday = 0;
  private maxDailyCalls = 150000; // Google Maps free tier limit

  constructor(apiKey: string, databaseUrl: string) {
    this.apiKey = apiKey;
    this.db = neon(databaseUrl);
  }

  async initializeDatabase() {
    console.log('Initializing database schema...');
    try {
      await this.db.query(SCHEMA_SQL);
      console.log('Database schema initialized successfully');
    } catch (error) {
      console.error('Error initializing database:', error);
      throw error;
    }
  }

  async searchPlaces(
    query: string,
    location: { lat: number; lng: number },
    radius: number = 50000,
    pageToken?: string
  ): Promise<any> {
    const url = `${this.baseUrl}/textsearch/json`;
    const params = new URLSearchParams({
      query: query,
      location: `${location.lat},${location.lng}`,
      radius: radius.toString(),
      key: this.apiKey,
    });

    if (pageToken) {
      params.append('pagetoken', pageToken);
    }

    this.apiCallsToday++;
    
    try {
      const response = await fetch(`${url}?${params}`);
      const data = await response.json();
      
      if (data.status === 'OK' || data.status === 'ZERO_RESULTS') {
        return data;
      } else {
        console.error(`API Error: ${data.status}`, data.error_message);
        return null;
      }
    } catch (error) {
      console.error('Error fetching places:', error);
      return null;
    }
  }

  async getPlaceDetails(placeId: string): Promise<any> {
    const url = `${this.baseUrl}/details/json`;
    const params = new URLSearchParams({
      place_id: placeId,
      fields: 'place_id,name,formatted_address,geometry,types,formatted_phone_number,website,rating,user_ratings_total,price_level,opening_hours,business_status,plus_code',
      key: this.apiKey,
    });

    this.apiCallsToday++;
    
    try {
      const response = await fetch(`${url}?${params}`);
      const data = await response.json();
      
      if (data.status === 'OK') {
        return data.result;
      } else {
        console.error(`Details API Error: ${data.status}`, data.error_message);
        return null;
      }
    } catch (error) {
      console.error('Error fetching place details:', error);
      return null;
    }
  }

  extractLocationComponents(addressComponents: any[]): any {
    const components: any = {
      country_code: null,
      administrative_area_level_1: null,
      administrative_area_level_2: null,
      locality: null,
      postal_code: null,
    };

    if (!addressComponents) return components;

    for (const component of addressComponents) {
      const types = component.types || [];
      if (types.includes('country')) {
        components.country_code = component.short_name;
      } else if (types.includes('administrative_area_level_1')) {
        components.administrative_area_level_1 = component.long_name;
      } else if (types.includes('administrative_area_level_2')) {
        components.administrative_area_level_2 = component.long_name;
      } else if (types.includes('locality')) {
        components.locality = component.long_name;
      } else if (types.includes('postal_code')) {
        components.postal_code = component.long_name;
      }
    }

    return components;
  }

  async saveProvider(providerData: any, category: string): Promise<void> {
    const location = providerData.geometry?.location;
    if (!location) return;

    const locationComponents = this.extractLocationComponents(
      providerData.address_components || []
    );

    const query = `
      INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category, 
        phone, website, rating, user_ratings_total, price_level, 
        opening_hours, business_status, permanently_closed, 
        country_code, administrative_area_level_1, administrative_area_level_2, 
        locality, postal_code, raw_data
      ) VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15,
        $16, $17, $18, $19, $20, $21
      )
      ON CONFLICT (place_id) 
      DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        rating = EXCLUDED.rating,
        user_ratings_total = EXCLUDED.user_ratings_total,
        price_level = EXCLUDED.price_level,
        opening_hours = EXCLUDED.opening_hours,
        business_status = EXCLUDED.business_status,
        permanently_closed = EXCLUDED.permanently_closed,
        updated_at = NOW(),
        raw_data = EXCLUDED.raw_data
    `;

    try {
      await this.db.query(query, [
        providerData.place_id,
        providerData.name,
        providerData.formatted_address,
        location.lat,
        location.lng,
        providerData.types,
        category,
        providerData.formatted_phone_number || null,
        providerData.website || null,
        providerData.rating || null,
        providerData.user_ratings_total || null,
        providerData.price_level || null,
        providerData.opening_hours ? JSON.stringify(providerData.opening_hours) : null,
        providerData.business_status || null,
        providerData.business_status === 'PERMANENTLY_CLOSED',
        locationComponents.country_code,
        locationComponents.administrative_area_level_1,
        locationComponents.administrative_area_level_2,
        locationComponents.locality,
        locationComponents.postal_code,
        JSON.stringify(providerData),
      ]);
    } catch (error) {
      console.error('Error saving provider:', error);
    }
  }

  async scrapeRegion(
    region: { name: string; lat: number; lng: number; radius: number },
    category: { category: string; terms: string[] }
  ): Promise<{ found: number; saved: number; apiCalls: number }> {
    console.log(`Scraping ${region.name} for ${category.category}...`);
    
    let totalFound = 0;
    let totalSaved = 0;
    let totalApiCalls = 0;

    for (const term of category.terms) {
      let nextPageToken: string | undefined;
      let page = 0;

      do {
        const searchResult = await this.searchPlaces(
          `medical ${term}`,
          { lat: region.lat, lng: region.lng },
          region.radius,
          nextPageToken
        );

        if (!searchResult) break;

        totalApiCalls++;
        const results = searchResult.results || [];
        totalFound += results.length;

        for (const place of results) {
          // Get detailed information for each place
          const details = await this.getPlaceDetails(place.place_id);
          if (details) {
            totalApiCalls++;
            await this.saveProvider(details, category.category);
            totalSaved++;
          }
        }

        nextPageToken = searchResult.next_page_token;
        page++;

        // Rate limiting - wait between pages
        if (nextPageToken) {
          await new Promise(resolve => setTimeout(resolve, 2000));
        }

        // Safety check for API limits
        if (this.apiCallsToday >= this.maxDailyCalls) {
          console.log('Daily API limit reached, stopping...');
          return { found: totalFound, saved: totalSaved, apiCalls: totalApiCalls };
        }

      } while (nextPageToken && page < 3); // Max 3 pages per search term
    }

    console.log(`Completed ${region.name} for ${category.category}: ${totalFound} found, ${totalSaved} saved`);
    return { found: totalFound, saved: totalSaved, apiCalls: totalApiCalls };
  }

  async runFullScrape(): Promise<void> {
    console.log('Starting global medical provider scrape...');
    console.log(`Regions: ${GLOBAL_REGIONS.length}`);
    console.log(`Categories: ${MEDICAL_CATEGORIES.length}`);
    
    let totalFound = 0;
    let totalSaved = 0;
    let totalApiCalls = 0;

    for (const region of GLOBAL_REGIONS) {
      for (const category of MEDICAL_CATEGORIES) {
        const results = await this.scrapeRegion(region, category);
        totalFound += results.found;
        totalSaved += results.saved;
        totalApiCalls += results.apiCalls;

        // Rate limiting between region/category combinations
        await new Promise(resolve => setTimeout(resolve, 1000));

        if (this.apiCallsToday >= this.maxDailyCalls) {
          console.log('Daily API limit reached, stopping...');
          console.log(`Total: ${totalFound} found, ${totalSaved} saved, ${totalApiCalls} API calls`);
          return;
        }
      }
    }

    console.log(`Scrape completed: ${totalFound} found, ${totalSaved} saved, ${totalApiCalls} API calls`);
  }
}

// Main execution
async function main() {
  const apiKey = process.env.GOOGLE_MAPS_API_KEY;
  const databaseUrl = process.env.NEON_DATABASE_URL;

  if (!apiKey) {
    console.error('GOOGLE_MAPS_API_KEY environment variable is required');
    process.exit(1);
  }

  if (!databaseUrl) {
    console.error('NEON_DATABASE_URL environment variable is required');
    process.exit(1);
  }

  const scraper = new GoogleMapsScraper(apiKey, databaseUrl);
  
  try {
    await scraper.initializeDatabase();
    await scraper.runFullScrape();
  } catch (error) {
    console.error('Scraping failed:', error);
    process.exit(1);
  }
}

main();
