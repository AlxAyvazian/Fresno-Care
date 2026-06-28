import { neon } from '@neondatabase/serverless';

let dbInstance: any = null;

export function getNeonClient() {
  if (!dbInstance) {
    const databaseUrl = import.meta.env.VITE_NEON_DATABASE_URL;
    if (!databaseUrl) {
      throw new Error('VITE_NEON_DATABASE_URL environment variable is not set');
    }
    dbInstance = neon(databaseUrl);
  }
  return dbInstance;
}

export interface MedicalProvider {
  id: number;
  place_id: string;
  name: string;
  formatted_address: string;
  lat: number;
  lng: number;
  types: string[];
  category: string;
  phone: string | null;
  website: string | null;
  rating: number | null;
  user_ratings_total: number | null;
  price_level: number | null;
  opening_hours: any;
  business_status: string | null;
  permanently_closed: boolean;
  country_code: string | null;
  administrative_area_level_1: string | null;
  administrative_area_level_2: string | null;
  locality: string | null;
  postal_code: string | null;
  scraped_at: string;
  updated_at: string;
  data_source: string;
}

export async function getMedicalProvidersByBounds(
  bounds: { north: number; south: number; east: number; west: number },
  categories?: string[]
): Promise<MedicalProvider[]> {
  const db = getNeonClient();
  
  let query = `
    SELECT * FROM medical_providers
    WHERE lat BETWEEN $1 AND $2
    AND lng BETWEEN $3 AND $4
    AND permanently_closed = false
  `;
  
  const params: (number | string[])[] = [bounds.south, bounds.north, bounds.west, bounds.east];
  
  if (categories && categories.length > 0) {
    query += ` AND category = ANY($5)`;
    params.push(categories);
  }
  
  query += ` ORDER BY rating DESC NULLS LAST LIMIT 1000`;
  
  try {
    const result = await db.query(query, params);
    return result.rows;
  } catch (error) {
    console.error('Error fetching medical providers:', error);
    return [];
  }
}

export async function getMedicalProvidersByLocation(
  lat: number,
  lng: number,
  radiusKm: number = 50,
  categories?: string[]
): Promise<MedicalProvider[]> {
  const db = getNeonClient();
  
  // Simple bounding box calculation for radius
  const latDelta = radiusKm / 111; // ~111km per degree latitude
  const lngDelta = radiusKm / (111 * Math.cos(lat * Math.PI / 180));
  
  const bounds = {
    north: lat + latDelta,
    south: lat - latDelta,
    east: lng + lngDelta,
    west: lng - lngDelta
  };
  
  return getMedicalProvidersByBounds(bounds, categories);
}

export async function getMedicalProviderCategories(): Promise<string[]> {
  const db = getNeonClient();
  
  try {
    const result = await db.query(`
      SELECT DISTINCT category 
      FROM medical_providers 
      WHERE category IS NOT NULL 
      ORDER BY category
    `);
    return result.rows.map((row: any) => row.category);
  } catch (error) {
    console.error('Error fetching categories:', error);
    return [];
  }
}

export async function getMedicalProviderStats(): Promise<{
  total: number;
  byCategory: Record<string, number>;
  byCountry: Record<string, number>;
}> {
  const db = getNeonClient();
  
  try {
    const totalResult = await db.query(`
      SELECT COUNT(*) as count 
      FROM medical_providers 
      WHERE permanently_closed = false
    `);
    
    const categoryResult = await db.query(`
      SELECT category, COUNT(*) as count 
      FROM medical_providers 
      WHERE category IS NOT NULL AND permanently_closed = false
      GROUP BY category 
      ORDER BY count DESC
    `);
    
    const countryResult = await db.query(`
      SELECT country_code, COUNT(*) as count 
      FROM medical_providers 
      WHERE country_code IS NOT NULL AND permanently_closed = false
      GROUP BY country_code 
      ORDER BY count DESC
    `);
    
    const byCategory: Record<string, number> = {};
    categoryResult.rows.forEach((row: any) => {
      byCategory[row.category] = parseInt(row.count);
    });
    
    const byCountry: Record<string, number> = {};
    countryResult.rows.forEach((row: any) => {
      byCountry[row.country_code] = parseInt(row.count);
    });
    
    return {
      total: parseInt(totalResult.rows[0].count),
      byCategory,
      byCountry
    };
  } catch (error) {
    console.error('Error fetching stats:', error);
    return { total: 0, byCategory: {}, byCountry: {} };
  }
}
