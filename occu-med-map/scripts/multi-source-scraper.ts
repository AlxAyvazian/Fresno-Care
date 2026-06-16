import { neon } from '@neondatabase/serverless';
import dotenv from 'dotenv';

dotenv.config();

// Data source configurations
interface DataSource {
  name: string;
  enabled: boolean;
  priority: number;
  rateLimit: number; // requests per minute
  dailyLimit: number;
  requiresAuth: boolean;
  regions: string[]; // 'global', 'europe', 'asia', etc.
}

const DATA_SOURCES: DataSource[] = [
  {
    name: 'openstreetmap',
    enabled: true,
    priority: 1,
    rateLimit: 60,
    dailyLimit: 1000000,
    requiresAuth: false,
    regions: ['global']
  },
  {
    name: 'google_maps',
    enabled: true,
    priority: 2,
    rateLimit: 50,
    dailyLimit: 150000,
    requiresAuth: true,
    regions: ['global']
  },
  {
    name: 'foursquare',
    enabled: false, // Requires API key
    priority: 3,
    rateLimit: 50,
    dailyLimit: 100000,
    requiresAuth: true,
    regions: ['global']
  },
  {
    name: 'tomtom',
    enabled: false, // Requires API key
    priority: 4,
    rateLimit: 10,
    dailyLimit: 2500,
    requiresAuth: true,
    regions: ['global']
  },
  {
    name: 'geoapify',
    enabled: false, // Requires API key
    priority: 5,
    rateLimit: 12,
    dailyLimit: 3000,
    requiresAuth: true,
    regions: ['global']
  },
  {
    name: 'npi_registry',
    enabled: false, // US only, no auth required
    priority: 6,
    rateLimit: 30,
    dailyLimit: 10000,
    requiresAuth: false,
    regions: ['north_america']
  },
  {
    name: 'hrsa',
    enabled: false, // US only, requires data download
    priority: 7,
    rateLimit: 5,
    dailyLimit: 1000,
    requiresAuth: false,
    regions: ['north_america']
  }
];

// Comprehensive global cities (195+ capitals + major cities)
const GLOBAL_CITIES = [
  // North America
  { name: 'Washington D.C.', country: 'USA', lat: 38.9072, lng: -77.0369, region: 'north_america' },
  { name: 'New York', country: 'USA', lat: 40.7128, lng: -74.0060, region: 'north_america' },
  { name: 'Los Angeles', country: 'USA', lat: 34.0522, lng: -118.2437, region: 'north_america' },
  { name: 'Chicago', country: 'USA', lat: 41.8781, lng: -87.6298, region: 'north_america' },
  { name: 'Houston', country: 'USA', lat: 29.7604, lng: -95.3698, region: 'north_america' },
  { name: 'Phoenix', country: 'USA', lat: 33.4484, lng: -112.0740, region: 'north_america' },
  { name: 'Toronto', country: 'Canada', lat: 43.6532, lng: -79.3832, region: 'north_america' },
  { name: 'Vancouver', country: 'Canada', lat: 49.2827, lng: -123.1207, region: 'north_america' },
  { name: 'Montreal', country: 'Canada', lat: 45.5017, lng: -73.5673, region: 'north_america' },
  { name: 'Mexico City', country: 'Mexico', lat: 19.4326, lng: -99.1332, region: 'north_america' },
  { name: 'Guatemala City', country: 'Guatemala', lat: 14.6349, lng: -90.5069, region: 'north_america' },
  { name: 'San Jose', country: 'Costa Rica', lat: 9.9281, lng: -84.0907, region: 'north_america' },
  { name: 'Panama City', country: 'Panama', lat: 8.9824, lng: -79.5199, region: 'north_america' },
  { name: 'Havana', country: 'Cuba', lat: 23.1136, lng: -82.3666, region: 'north_america' },
  { name: 'Santo Domingo', country: 'Dominican Republic', lat: 18.4861, lng: -69.9312, region: 'north_america' },
  
  // Europe
  { name: 'London', country: 'UK', lat: 51.5074, lng: -0.1278, region: 'europe' },
  { name: 'Paris', country: 'France', lat: 48.8566, lng: 2.3522, region: 'europe' },
  { name: 'Berlin', country: 'Germany', lat: 52.5200, lng: 13.4050, region: 'europe' },
  { name: 'Madrid', country: 'Spain', lat: 40.4168, lng: -3.7038, region: 'europe' },
  { name: 'Rome', country: 'Italy', lat: 41.9028, lng: 12.4964, region: 'europe' },
  { name: 'Moscow', country: 'Russia', lat: 55.7558, lng: 37.6173, region: 'europe' },
  { name: 'Amsterdam', country: 'Netherlands', lat: 52.3676, lng: 4.9041, region: 'europe' },
  { name: 'Vienna', country: 'Austria', lat: 48.2082, lng: 16.3738, region: 'europe' },
  { name: 'Warsaw', country: 'Poland', lat: 52.2297, lng: 21.0122, region: 'europe' },
  { name: 'Prague', country: 'Czech Republic', lat: 50.0755, lng: 14.4378, region: 'europe' },
  { name: 'Budapest', country: 'Hungary', lat: 47.4979, lng: 19.0402, region: 'europe' },
  { name: 'Stockholm', country: 'Sweden', lat: 59.3293, lng: 18.0686, region: 'europe' },
  { name: 'Oslo', country: 'Norway', lat: 59.9139, lng: 10.7522, region: 'europe' },
  { name: 'Copenhagen', country: 'Denmark', lat: 55.6761, lng: 12.5683, region: 'europe' },
  { name: 'Helsinki', country: 'Finland', lat: 60.1695, lng: 24.9354, region: 'europe' },
  { name: 'Athens', country: 'Greece', lat: 37.9838, lng: 23.7275, region: 'europe' },
  { name: 'Lisbon', country: 'Portugal', lat: 38.7223, lng: -9.1393, region: 'europe' },
  { name: 'Dublin', country: 'Ireland', lat: 53.3498, lng: -6.2603, region: 'europe' },
  { name: 'Brussels', country: 'Belgium', lat: 50.8503, lng: 4.3517, region: 'europe' },
  { name: 'Zurich', country: 'Switzerland', lat: 47.3769, lng: 8.5417, region: 'europe' },
  
  // Asia
  { name: 'Tokyo', country: 'Japan', lat: 35.6762, lng: 139.6503, region: 'asia' },
  { name: 'Beijing', country: 'China', lat: 39.9042, lng: 116.4074, region: 'asia' },
  { name: 'Shanghai', country: 'China', lat: 31.2304, lng: 121.4737, region: 'asia' },
  { name: 'Seoul', country: 'South Korea', lat: 37.5665, lng: 126.9780, region: 'asia' },
  { name: 'Mumbai', country: 'India', lat: 19.0760, lng: 72.8777, region: 'asia' },
  { name: 'Delhi', country: 'India', lat: 28.6139, lng: 77.2090, region: 'asia' },
  { name: 'Bangkok', country: 'Thailand', lat: 13.7563, lng: 100.5018, region: 'asia' },
  { name: 'Singapore', country: 'Singapore', lat: 1.3521, lng: 103.8198, region: 'asia' },
  { name: 'Hong Kong', country: 'Hong Kong', lat: 22.3193, lng: 114.1694, region: 'asia' },
  { name: 'Jakarta', country: 'Indonesia', lat: -6.2088, lng: 106.8456, region: 'asia' },
  { name: 'Manila', country: 'Philippines', lat: 14.5995, lng: 120.9842, region: 'asia' },
  { name: 'Kuala Lumpur', country: 'Malaysia', lat: 3.1390, lng: 101.6869, region: 'asia' },
  { name: 'Taipei', country: 'Taiwan', lat: 25.0330, lng: 121.5654, region: 'asia' },
  { name: 'Ho Chi Minh City', country: 'Vietnam', lat: 10.8231, lng: 106.6297, region: 'asia' },
  { name: 'Dhaka', country: 'Bangladesh', lat: 23.8103, lng: 90.4125, region: 'asia' },
  { name: 'Karachi', country: 'Pakistan', lat: 24.8607, lng: 67.0011, region: 'asia' },
  { name: 'Tehran', country: 'Iran', lat: 35.6892, lng: 51.3890, region: 'asia' },
  { name: 'Riyadh', country: 'Saudi Arabia', lat: 24.7136, lng: 46.6753, region: 'asia' },
  { name: 'Dubai', country: 'UAE', lat: 25.2048, lng: 55.2708, region: 'asia' },
  { name: 'Tel Aviv', country: 'Israel', lat: 32.0853, lng: 34.7818, region: 'asia' },
  
  // South America
  { name: 'São Paulo', country: 'Brazil', lat: -23.5505, lng: -46.6333, region: 'south_america' },
  { name: 'Buenos Aires', country: 'Argentina', lat: -34.6037, lng: -58.3816, region: 'south_america' },
  { name: 'Rio de Janeiro', country: 'Brazil', lat: -22.9068, lng: -43.1729, region: 'south_america' },
  { name: 'Lima', country: 'Peru', lat: -12.0464, lng: -77.0428, region: 'south_america' },
  { name: 'Bogota', country: 'Colombia', lat: 4.7110, lng: -74.0721, region: 'south_america' },
  { name: 'Santiago', country: 'Chile', lat: -33.4489, lng: -70.6693, region: 'south_america' },
  { name: 'Caracas', country: 'Venezuela', lat: 10.4806, lng: -66.9036, region: 'south_america' },
  { name: 'Quito', country: 'Ecuador', lat: -0.1807, lng: -78.4678, region: 'south_america' },
  { name: 'La Paz', country: 'Bolivia', lat: -16.4897, lng: -68.1193, region: 'south_america' },
  { name: 'Montevideo', country: 'Uruguay', lat: -34.9011, lng: -56.1645, region: 'south_america' },
  { name: 'Asuncion', country: 'Paraguay', lat: -25.2637, lng: -57.5759, region: 'south_america' },
  
  // Africa
  { name: 'Cairo', country: 'Egypt', lat: 30.0444, lng: 31.2357, region: 'africa' },
  { name: 'Lagos', country: 'Nigeria', lat: 6.5244, lng: 3.3792, region: 'africa' },
  { name: 'Johannesburg', country: 'South Africa', lat: -26.2041, lng: 28.0473, region: 'africa' },
  { name: 'Cape Town', country: 'South Africa', lat: -33.9249, lng: 18.4241, region: 'africa' },
  { name: 'Nairobi', country: 'Kenya', lat: -1.2921, lng: 36.8219, region: 'africa' },
  { name: 'Casablanca', country: 'Morocco', lat: 33.5731, lng: -7.5898, region: 'africa' },
  { name: 'Algiers', country: 'Algeria', lat: 36.7538, lng: 3.0588, region: 'africa' },
  { name: 'Tunis', country: 'Tunisia', lat: 36.8065, lng: 10.1815, region: 'africa' },
  { name: 'Addis Ababa', country: 'Ethiopia', lat: 9.1450, lng: 38.7617, region: 'africa' },
  { name: 'Accra', country: 'Ghana', lat: 5.6037, lng: -0.1870, region: 'africa' },
  { name: 'Dakar', country: 'Senegal', lat: 14.7167, lng: -17.4677, region: 'africa' },
  { name: 'Abidjan', country: 'Ivory Coast', lat: 5.3600, lng: -4.0083, region: 'africa' },
  
  // Oceania
  { name: 'Sydney', country: 'Australia', lat: -33.8688, lng: 151.2093, region: 'oceania' },
  { name: 'Melbourne', country: 'Australia', lat: -37.8136, lng: 144.9631, region: 'oceania' },
  { name: 'Brisbane', country: 'Australia', lat: -27.4698, lng: 153.0251, region: 'oceania' },
  { name: 'Perth', country: 'Australia', lat: -31.9505, lng: 115.8605, region: 'oceania' },
  { name: 'Auckland', country: 'New Zealand', lat: -36.8485, lng: 174.7633, region: 'oceania' },
  { name: 'Wellington', country: 'New Zealand', lat: -41.2924, lng: 174.7787, region: 'oceania' },
  { name: 'Suva', country: 'Fiji', lat: -18.1248, lng: 178.4501, region: 'oceania' },
  { name: 'Port Moresby', country: 'Papua New Guinea', lat: -9.4434, lng: 147.1803, region: 'oceania' }
];

// Refined medical categories - specific target list only
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

// Unified provider data structure
interface UnifiedProvider {
  name: string;
  address: string;
  lat: number;
  lng: number;
  category: string;
  phone?: string;
  website?: string;
  rating?: number;
  source: string;
  sourceId: string;
  country?: string;
  city?: string;
  rawData?: any;
}

// Rate limiter class
class RateLimiter {
  private requests: number[] = [];
  private limit: number;
  private window: number = 60000; // 1 minute window

  constructor(limit: number) {
    this.limit = limit;
  }

  async wait(): Promise<void> {
    const now = Date.now();
    this.requests = this.requests.filter(time => now - time < this.window);
    
    if (this.requests.length >= this.limit) {
      const oldestRequest = this.requests[0];
      const waitTime = this.window - (now - oldestRequest) + 100;
      await new Promise(resolve => setTimeout(resolve, waitTime));
    }
    
    this.requests.push(now);
  }
}

// OpenStreetMap/Overpass API Scraper
class OpenStreetMapScraper {
  private rateLimiter: RateLimiter;
  private baseUrl = 'https://overpass-api.de/api/interpreter';

  constructor() {
    this.rateLimiter = new RateLimiter(60); // 60 requests per minute
  }

  async searchMedicalProviders(
    lat: number,
    lng: number,
    radius: number,
    category: any
  ): Promise<UnifiedProvider[]> {
    await this.rateLimiter.wait();

    // Overpass QL query for medical facilities
    const query = `
      [out:json][timeout:25];
      (
        node["amenity"~"hospital|clinic|doctors|pharmacy|dentist"](around:${radius},${lat},${lng});
        way["amenity"~"hospital|clinic|doctors|pharmacy|dentist"](around:${radius},${lat},${lng});
        relation["amenity"~"hospital|clinic|doctors|pharmacy|dentist"](around:${radius},${lat},${lng});
      );
      out center;
    `;

    try {
      const response = await fetch(`${this.baseUrl}?data=${encodeURIComponent(query)}`);
      const data = await response.json();
      
      const providers = data.elements
        .map((element: any) => this.normalizeToUnified(element, category))
        .filter((provider: UnifiedProvider | null) => provider !== null);
      
      return providers as UnifiedProvider[];
    } catch (error) {
      console.error('OpenStreetMap API error:', error);
      return [];
    }
  }

  private normalizeToUnified(element: any, category: any): UnifiedProvider | null {
    const lat = element.lat || element.center?.lat;
    const lng = element.lon || element.center?.lon;
    const tags = element.tags || {};

    const normalizedCategory = this.categorizeFromTags(tags, category.category, category.exclude);
    if (!normalizedCategory) {
      return null; // Exclude this provider
    }

    return {
      name: tags.name || tags['name:en'] || 'Unknown Medical Facility',
      address: this.formatAddress(tags),
      lat,
      lng,
      category: normalizedCategory,
      phone: tags.phone || tags['contact:phone'],
      website: tags.website || tags['contact:website'],
      source: 'openstreetmap',
      sourceId: `osm_${element.type}_${element.id}`,
      rawData: element
    };
  }

  private formatAddress(tags: any): string {
    const parts = [
      tags['addr:housenumber'],
      tags['addr:street'],
      tags['addr:city'],
      tags['addr:state'],
      tags['addr:country']
    ].filter(Boolean);
    
    return parts.length > 0 ? parts.join(', ') : 'Address not available';
  }

  private categorizeFromTags(tags: any, defaultCategory: string, exclude: string[]): string | null {
    const amenity = tags.amenity || '';
    const healthcare = tags.healthcare || '';
    const name = (tags.name || tags['name:en'] || '').toLowerCase();
    
    // Check if name contains excluded terms
    for (const excludeTerm of exclude) {
      if (name.includes(excludeTerm.toLowerCase())) {
        return null; // Exclude this provider
      }
    }
    
    if (amenity.includes('hospital') || healthcare.includes('hospital')) return 'Hospital';
    if (amenity.includes('clinic') || healthcare.includes('clinic')) return 'Medical Clinic';
    if (amenity.includes('doctor') || healthcare.includes('doctor')) return 'General Practitioner';
    if (amenity.includes('pharmacy')) return null; // Exclude pharmacies
    if (amenity.includes('dentist')) return 'Dentist';
    
    return defaultCategory;
  }
}

// Multi-source coordinator
class MultiSourceCoordinator {
  private db: any;
  private sources: Map<string, any>;
  private progress: Map<string, any> = new Map();

  constructor(databaseUrl: string) {
    this.db = neon(databaseUrl);
    this.sources = new Map();
    
    // Initialize enabled sources
    const osmScraper = new OpenStreetMapScraper();
    this.sources.set('openstreetmap', osmScraper);
  }

  async initializeDatabase() {
    console.log('Initializing multi-source database schema...');
    
    const schema = `
      -- Update medical_providers table to support multiple sources
      ALTER TABLE medical_providers 
      ADD COLUMN IF NOT EXISTS source_id TEXT,
      ADD COLUMN IF NOT EXISTS data_source TEXT DEFAULT 'google_maps',
      ADD COLUMN IF NOT EXISTS confidence_score DECIMAL(3,2) DEFAULT 1.00;
      
      -- Create index on source_id for deduplication
      CREATE INDEX IF NOT EXISTS idx_medical_providers_source_id ON medical_providers(source_id);
      
      -- Scraping progress table
      CREATE TABLE IF NOT EXISTS scraping_progress (
        id SERIAL PRIMARY KEY,
        source TEXT NOT NULL,
        city_name TEXT NOT NULL,
        country TEXT NOT NULL,
        category TEXT NOT NULL,
        status TEXT DEFAULT 'pending',
        providers_found INTEGER DEFAULT 0,
        providers_saved INTEGER DEFAULT 0,
        started_at TIMESTAMP DEFAULT NOW(),
        completed_at TIMESTAMP,
        error_message TEXT
      );
      
      -- Coverage tracking table
      CREATE TABLE IF NOT EXISTS coverage_tracking (
        id SERIAL PRIMARY KEY,
        city_name TEXT NOT NULL,
        country TEXT NOT NULL,
        region TEXT NOT NULL,
        lat DECIMAL(10,7) NOT NULL,
        lng DECIMAL(10,7) NOT NULL,
        total_providers INTEGER DEFAULT 0,
        sources_used TEXT[],
        last_scraped TIMESTAMP DEFAULT NOW()
      );
    `;
    
    try {
      await this.db.query(schema);
      console.log('Multi-source database schema initialized');
    } catch (error) {
      console.error('Error initializing database:', error);
    }
  }

  async scrapeCity(city: any, category: any, sources: string[] = ['openstreetmap']) {
    console.log(`Scraping ${city.name}, ${city.country} for ${category.category}...`);
    
    const progressId = await this.trackProgress(city, category, sources[0], 'in_progress');
    let totalFound = 0;
    let totalSaved = 0;

    for (const sourceName of sources) {
      const source = this.sources.get(sourceName);
      if (!source) continue;

      try {
        const providers = await source.searchMedicalProviders(
          city.lat,
          city.lng,
          50000, // 50km radius
          category.category
        );

        totalFound += providers.length;
        
        for (const provider of providers) {
          const saved = await this.saveProvider(provider, city);
          if (saved) totalSaved++;
        }

        console.log(`${sourceName}: ${providers.length} found`);
      } catch (error) {
        console.error(`Error with ${sourceName}:`, error);
      }
    }

    await this.updateProgress(progressId, 'completed', totalFound, totalSaved);
    await this.updateCoverage(city, sources, totalSaved);
    
    console.log(`Completed ${city.name}: ${totalFound} found, ${totalSaved} saved`);
    return { found: totalFound, saved: totalSaved };
  }

  async saveProvider(provider: UnifiedProvider, city: any): Promise<boolean> {
    const query = `
      INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, data_source, source_id,
        confidence_score, raw_data
      ) VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15
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
        provider.sourceId,
        provider.name,
        provider.address,
        provider.lat,
        provider.lng,
        [provider.category],
        provider.category,
        provider.phone || null,
        provider.website || null,
        city.country,
        city.name,
        provider.source,
        provider.sourceId,
        0.8, // Confidence score for OSM data
        JSON.stringify(provider.rawData)
      ]);
      
      return result.rows.length > 0;
    } catch (error) {
      console.error('Error saving provider:', error);
      return false;
    }
  }

  async trackProgress(city: any, category: any, source: string, status: string): Promise<number> {
    const result = await this.db.query(
      `INSERT INTO scraping_progress (source, city_name, country, category, status)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING id`,
      [source, city.name, city.country, category.category, status]
    );
    return result.rows[0].id;
  }

  async updateProgress(id: number, status: string, found: number, saved: number) {
    await this.db.query(
      `UPDATE scraping_progress 
       SET status = $1, providers_found = $2, providers_saved = $3, completed_at = NOW()
       WHERE id = $4`,
      [status, found, saved, id]
    );
  }

  async updateCoverage(city: any, sources: string[], totalProviders: number) {
    await this.db.query(
      `INSERT INTO coverage_tracking (city_name, country, region, lat, lng, total_providers, sources_used)
       VALUES ($1, $2, $3, $4, $5, $6, $7)
       ON CONFLICT (city_name, country)
       DO UPDATE SET
         total_providers = coverage_tracking.total_providers + EXCLUDED.total_providers,
         sources_used = array_distinct(coverage_tracking.sources_used || EXCLUDED.sources_used),
         last_scraped = NOW()`,
      [city.name, city.country, city.region, city.lat, city.lng, totalProviders, sources]
    );
  }

  async runGlobalScrape() {
    console.log('Starting multi-source global medical provider scrape...');
    console.log(`Cities: ${GLOBAL_CITIES.length}`);
    console.log(`Categories: ${MEDICAL_CATEGORIES.length}`);
    console.log(`Enabled sources: ${Array.from(this.sources.keys()).join(', ')}`);

    let totalFound = 0;
    let totalSaved = 0;

    for (const city of GLOBAL_CITIES) {
      for (const category of MEDICAL_CATEGORIES) {
        const results = await this.scrapeCity(city, category, ['openstreetmap']);
        totalFound += results.found;
        totalSaved += results.saved;
        
        // Rate limiting between cities
        await new Promise(resolve => setTimeout(resolve, 1000));
      }
    }

    console.log(`Multi-source scrape completed: ${totalFound} found, ${totalSaved} saved`);
  }
}

// Main execution
async function main() {
  const databaseUrl = process.env.NEON_DATABASE_URL;

  if (!databaseUrl) {
    console.error('NEON_DATABASE_URL environment variable is required');
    process.exit(1);
  }

  const coordinator = new MultiSourceCoordinator(databaseUrl);
  
  try {
    await coordinator.initializeDatabase();
    await coordinator.runGlobalScrape();
  } catch (error) {
    console.error('Multi-source scraping failed:', error);
    process.exit(1);
  }
}

main();
