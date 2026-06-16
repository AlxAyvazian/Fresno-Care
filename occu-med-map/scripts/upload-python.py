#!/usr/bin/env python3
import pandas as pd
import sys
import os
import hashlib
import json
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

def generate_hash(name, address, lat, lng):
    """Generate hash from name, address, lat, lng"""
    s = f"{name}|{address}|{lat}|{lng}"
    return hashlib.md5(s.encode()).hexdigest()

def map_to_standard_format(df):
    """Map columns to standard format"""
    column_mapping = {
        'name': ['name', 'Name', 'provider_name', 'Provider Name', 'Clinic / Provider Name'],
        'address': ['address', 'Address', 'full_address', 'formatted_address', 'Full Address'],
        'lat': ['lat', 'latitude', 'Lat', 'Latitude'],
        'lng': ['lng', 'longitude', 'Lng', 'Longitude', 'lon', 'Lon'],
        'category': ['category', 'Category', 'type', 'Type'],
        'phone': ['phone', 'Phone', 'contact_phone', 'Phone Number'],
        'website': ['website', 'Website', 'url'],
        'country': ['country', 'Country'],
        'city': ['city', 'City', 'LayoutClinicDetails » SelectedZipCodeCities::zipcodeCity'],
        'state': ['state', 'State', 'province'],
        'postal_code': ['postal_code', 'postalCode', 'zip', 'Zip', 'Zip Code']
    }
    
    mapped_df = df.copy()
    
    for standard_col, possible_cols in column_mapping.items():
        for possible_col in possible_cols:
            if possible_col in df.columns and standard_col not in mapped_df.columns:
                mapped_df[standard_col] = df[possible_col]
                break
    
    # Set default category
    if 'category' not in mapped_df.columns:
        mapped_df['category'] = 'Urgent Care'
    
    return mapped_df

def validate_category(category):
    """Validate category against target list"""
    target_categories = [
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
        'Neurologist',
        'Laboratory'
    ]
    
    return category in target_categories

def normalize_category(category):
    """Normalize category names"""
    mappings = {
        'General Dentist': 'Dentist',
        'Family Dentist': 'Dentist',
        'Family Doctor': 'General Practitioner',
        'Primary Care': 'Primary Care Provider',
        'Heart Doctor': 'Cardiologist',
        'Occupational Doctor': 'Occupational Health Specialist',
        'Occ Med': 'Occupational Health Clinic',
        'Hearing Doctor': 'Audiologist',
        'Imaging Center': 'Radiology Imaging Center',
        'Medical Center': 'Hospital',
        'Walk-in Clinic': 'Urgent Care',
        'Immediate Care': 'Urgent Care',
        'Bone Doctor': 'Orthopedist',
        'Lung Doctor': 'Pulmonologist',
        'Brain Doctor': 'Neurologist'
    }
    
    if category in mappings:
        return mappings[category]
    
    return category

def generate_sql_insert(provider):
    """Generate SQL INSERT statement for a provider"""
    source_id = f"uploaded_{generate_hash(provider['name'], provider['address'], provider['lat'], provider['lng'])}"
    
    # Safely get values with defaults
    name = provider.get('name', 'Unknown')
    address = provider.get('address', '')
    lat = provider.get('lat', 0)
    lng = provider.get('lng', 0)
    category = provider.get('category', 'Medical Clinic')
    phone = provider.get('phone')
    website = provider.get('website')
    country = provider.get('country')
    city = provider.get('city')
    state = provider.get('state')
    postal_code = provider.get('postal_code')
    
    # Convert provider dict to proper JSON (handle NaN and use double quotes)
    provider_dict = {}
    for key, value in provider.items():
        if pd.isna(value):
            provider_dict[key] = None
        elif isinstance(value, pd.Timestamp):
            provider_dict[key] = str(value)
        elif hasattr(value, 'dtype') and str(value.dtype).startswith('datetime64'):
            provider_dict[key] = str(value)
        else:
            provider_dict[key] = value
    
    raw_data_json = json.dumps(provider_dict, default=str)
    # Escape single quotes for SQL
    raw_data_escaped = raw_data_json.replace("'", "''")
    
    sql = f"""
    INSERT INTO medical_providers (
        place_id, name, formatted_address, lat, lng, types, category,
        phone, website, country_code, locality, administrative_area_level_1,
        postal_code, data_source, source_id, source_type, confidence_score,
        raw_data, scraped_at, updated_at
    ) VALUES (
        '{source_id}',
        '{str(name).replace("'", "''")}',
        '{str(address).replace("'", "''")}',
        {lat},
        {lng},
        ARRAY['{category}'],
        '{category}',
        {f"'{str(phone)}'" if pd.notna(phone) and phone else 'NULL'},
        {f"'{str(website)}'" if pd.notna(website) and website else 'NULL'},
        {f"'{str(country)}'" if pd.notna(country) and country else 'NULL'},
        {f"'{str(city)}'" if pd.notna(city) and city else 'NULL'},
        {f"'{str(state)}'" if pd.notna(state) and state else 'NULL'},
        {f"'{str(postal_code)}'" if pd.notna(postal_code) and postal_code else 'NULL'},
        'uploaded',
        '{source_id}',
        'uploaded',
        0.95,
        '{raw_data_escaped}'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT (source_id) 
    DO UPDATE SET
        name = EXCLUDED.name,
        formatted_address = EXCLUDED.formatted_address,
        phone = EXCLUDED.phone,
        website = EXCLUDED.website,
        updated_at = NOW(),
        confidence_score = GREATEST(medical_providers.confidence_score, EXCLUDED.confidence_score);
    """
    
    return sql

def main():
    if len(sys.argv) < 2:
        print("Usage: python upload-python.py <input_file> [batch_name] [category]")
        print("\nExample:")
        print("  python upload-python.py ./data/urgent-cares-dedup.xlsx 'US Urgent Cares' 'Urgent Care'")
        print("  python upload-python.py ./data/mainstreet-family-care-dedup.xlsx 'MainStreet Family Care' 'Occupational Health Clinic'")
        sys.exit(1)
    
    input_file = sys.argv[1]
    batch_name = sys.argv[2] if len(sys.argv) > 2 else 'Manual Upload'
    override_category = sys.argv[3] if len(sys.argv) > 3 else None
    
    database_url = os.getenv('NEON_DATABASE_URL')
    
    if not database_url:
        print("Warning: NEON_DATABASE_URL not found in .env file")
        print("SQL file will be generated for manual upload")
        database_url = "YOUR_DATABASE_URL_HERE"
    
    try:
        # Read Excel file
        print(f"Reading file: {input_file}")
        df = pd.read_excel(input_file)
        
        print(f"Total records: {len(df)}")
        
        # Map to standard format
        print("Mapping to standard format...")
        mapped_df = map_to_standard_format(df)
        
        # Validate and normalize categories
        print("Validating categories...")
        valid_providers = []
        skipped = 0
        
        for _, row in mapped_df.iterrows():
            category = str(row.get('category', ''))
            
            # Use override category if provided
            if override_category:
                category = override_category
            else:
                category = normalize_category(category)
            
            if validate_category(category):
                row['category'] = category
                valid_providers.append(row)
            else:
                skipped += 1
        
        valid_df = pd.DataFrame(valid_providers)
        
        print(f"Valid records: {len(valid_df)}")
        print(f"Skipped (invalid category): {skipped}")
        
        # Generate SQL file
        output_sql = input_file.replace('.xlsx', '.sql').replace('.xls', '.sql')
        
        print(f"Generating SQL file: {output_sql}")
        
        with open(output_sql, 'w') as f:
            # Write header
            f.write(f"-- Batch: {batch_name}\n")
            f.write(f"-- Source: {input_file}\n")
            f.write(f"-- Total records: {len(valid_df)}\n")
            f.write(f"-- Generated: {pd.Timestamp.now()}\n\n")
            
            # Write INSERT statements
            for i, (_, provider) in enumerate(valid_df.iterrows()):
                sql = generate_sql_insert(provider)
                f.write(sql + "\n")
                
                if (i + 1) % 100 == 0:
                    print(f"Progress: {i + 1}/{len(valid_df)}")
        
        print(f"\nSQL file generated: {output_sql}")
        print(f"\nTo upload to database, run:")
        print(f"  psql {database_url} -f {output_sql}")
        
    except FileNotFoundError:
        print(f"Error: File not found: {input_file}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()
