#!/usr/bin/env python3
import pandas as pd
import sys
import hashlib

def generate_hash(name, address, lat, lng):
    """Generate hash from name, address, lat, lng"""
    s = f"{name}|{address}|{lat}|{lng}"
    return hashlib.md5(s.encode()).hexdigest()

def deduplicate_providers(df):
    """Deduplicate providers based on hash"""
    seen = set()
    deduplicated = []
    
    for _, row in df.iterrows():
        name = str(row.get('name') or row.get('Name') or row.get('provider_name') or 'Unknown')
        address = str(row.get('address') or row.get('Address') or row.get('full_address') or '')
        lat = float(row.get('lat') or row.get('latitude') or row.get('Lat') or row.get('Latitude') or 0)
        lng = float(row.get('lng') or row.get('longitude') or row.get('Lng') or row.get('Longitude') or 0)
        
        hash_val = generate_hash(name, address, lat, lng)
        
        if hash_val not in seen:
            seen.add(hash_val)
            deduplicated.append(row)
    
    return pd.DataFrame(deduplicated)

def analyze_file(df):
    """Analyze the dataframe"""
    analysis = {
        'total_records': len(df),
        'columns': list(df.columns),
        'sample_data': df.head(5).to_dict('records'),
        'null_counts': df.isnull().sum().to_dict(),
        'duplicate_estimate': 0
    }
    
    # Estimate duplicates
    seen = set()
    duplicates = 0
    for _, row in df.iterrows():
        name = str(row.get('name') or row.get('Name') or row.get('provider_name') or '')
        address = str(row.get('address') or row.get('Address') or row.get('full_address') or '')
        lat = float(row.get('lat') or row.get('latitude') or row.get('Lat') or row.get('Latitude') or 0)
        lng = float(row.get('lng') or row.get('longitude') or row.get('Lng') or row.get('Longitude') or 0)
        
        hash_val = generate_hash(name, address, lat, lng)
        if hash_val in seen:
            duplicates += 1
        else:
            seen.add(hash_val)
    
    analysis['duplicate_estimate'] = duplicates
    return analysis

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

def main():
    if len(sys.argv) < 2:
        print("Usage: python deduplicate.py <input_file> [output_file]")
        print("\nExample:")
        print("  python deduplicate.py ./data/urgent-cares.xlsx ./data/urgent-cares-dedup.xlsx")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else './data/deduplicated.xlsx'
    
    try:
        # Read Excel file
        print(f"Reading file: {input_file}")
        df = pd.read_excel(input_file)
        
        # Analyze
        print("\n=== File Analysis ===")
        analysis = analyze_file(df)
        print(f"Total records: {analysis['total_records']}")
        print(f"Columns: {', '.join(analysis['columns'])}")
        print(f"Estimated duplicates: {analysis['duplicate_estimate']}")
        print("\n=== Null Counts ===")
        for col, count in analysis['null_counts'].items():
            print(f"{col}: {count} nulls")
        print("\n=== Sample Data ===")
        print(analysis['sample_data'][:2])  # Show first 2 records
        
        # Map to standard format
        print("\n=== Mapping to Standard Format ===")
        mapped_df = map_to_standard_format(df)
        
        # Deduplicate
        print("=== Deduplicating ===")
        deduplicated_df = deduplicate_providers(mapped_df)
        
        print(f"Original: {len(df)} records")
        print(f"After deduplication: {len(deduplicated_df)} records")
        print(f"Removed: {len(df) - len(deduplicated_df)} duplicates")
        
        # Save
        print(f"\nSaving to: {output_file}")
        deduplicated_df.to_excel(output_file, index=False, sheet_name='Deduplicated')
        
        print("\n=== Complete ===")
        print(f"Original: {len(df)}")
        print(f"Deduplicated: {len(deduplicated_df)}")
        print(f"Duplicates removed: {len(df) - len(deduplicated_df)}")
        
    except FileNotFoundError:
        print(f"Error: File not found: {input_file}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
