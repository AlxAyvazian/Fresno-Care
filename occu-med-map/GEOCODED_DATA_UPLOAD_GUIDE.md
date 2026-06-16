# Geocoded Data Upload Guide

Comprehensive guide for uploading pre-geocoded medical provider data to the Neon database to save scraping power.

## Overview

This system allows you to upload existing geocoded medical provider data (CSV, XLSX, or JSON) directly to the Neon database, bypassing the need to scrape this data from APIs. This is useful for:

- Pre-existing datasets you already have
- High-quality purchased data
- Government or public health datasets
- Historical data archives
- Region-specific data not available via APIs

## Supported File Formats

### CSV Files
- Standard CSV format with headers
- UTF-8 encoding recommended
- Comma-separated values
- First row should contain column headers

### Excel Files (XLSX, XLS)
- Microsoft Excel format
- First sheet is used for data
- Headers in first row

### JSON Files
- Array of objects
- Each object represents one provider
- Nested objects supported

## Required Data Fields

Your data file should contain at minimum these fields:

### Required Fields
- **name**: Provider name
- **address**: Full address
- **lat**: Latitude (decimal)
- **lng**: Longitude (decimal)
- **category**: Medical category

### Optional Fields
- **phone**: Phone number
- **website**: Website URL
- **country**: Country name or code
- **city**: City name
- **state**: State/province name
- **postal_code**: ZIP/postal code

### Field Name Variations
The upload script automatically handles common field name variations:

| Standard | Alternative Names |
|----------|------------------|
| name | Name, provider_name |
| address | Address, full_address, formatted_address |
| lat | lat, latitude, Lat, Latitude |
| lng | lng, longitude, lon, Lon, Lng, Longitude |
| category | category, Category, type, Type, medical_category |
| phone | phone, Phone, contact_phone |
| website | website, Website, url |
| country | country, Country |
| city | city, City |
| state | state, State, province |
| postal_code | postal_code, postalCode, zip, Zip |

## Target Categories

Data will only be uploaded if the category matches one of the 18 target categories:

1. **Dentist** (excludes: orthodontist, periodontist, oral surgeon, etc.)
2. **General Practitioner** (excludes: pediatrician, geriatrician)
3. **Cardiologist** (excludes: cardiac surgeon)
4. **Internal Medicine**
5. **Occupational Health Specialist**
6. **Occupational Health Clinic**
7. **Audiologist**
8. **Radiology Imaging Center** (excludes: surgery center)
9. **Medical Clinic** (excludes: surgical clinic, cosmetic clinic)
10. **Private Practice** (excludes: dental specialist)
11. **Urgent Care** (excludes: emergency room)
12. **Polyclinic** (excludes: hospital)
13. **Hospital** (excludes: surgical hospital, nursing home)
14. **Primary Care Provider** (excludes: pediatrician)
15. **Independent Medical Examiner** (excludes: forensic pathologist)
16. **Orthopedist** (excludes: orthopedic surgeon)
17. **Pulmonologist**
18. **Neurologist** (excludes: neurosurgeon)

### Category Normalization
The script automatically normalizes common category names:

| Input Category | Normalized To |
|----------------|---------------|
| General Dentist | Dentist |
| Family Dentist | Dentist |
| Family Doctor | General Practitioner |
| Primary Care | Primary Care Provider |
| Heart Doctor | Cardiologist |
| Occ Med | Occupational Health Clinic |
| Hearing Doctor | Audiologist |
| Imaging Center | Radiology Imaging Center |
| Medical Center | Hospital |
| Walk-in Clinic | Urgent Care |
| Bone Doctor | Orthopedist |
| Lung Doctor | Pulmonologist |
| Brain Doctor | Neurologist |

## Usage

### Basic Upload

```bash
pnpm upload:geocoded <file_path> [batch_name]
```

### Examples

```bash
# Upload CSV file
pnpm upload:geocoded ./data/us-dentists.csv "US Dentists"

# Upload Excel file
pnpm upload:geocoded ./data/hospitals.xlsx "Global Hospitals"

# Upload JSON file
pnpm upload:geocoded ./data/providers.json "European Providers"

# Upload without batch name (uses "Manual Upload")
pnpm upload:geocoded ./data/clinics.csv
```

### View Current Stats

```bash
# View database stats without uploading
pnpm upload:geocoded
```

## Database Schema

### New Columns Added

#### medical_providers Table
- **source_type**: Indicates data source ('scraped' or 'uploaded')
- **source_id**: Unique identifier for deduplication

#### uploaded_data_batches Table
Tracks upload batches:
- **batch_name**: Name of the upload batch
- **file_name**: Original file name
- **total_records**: Total records in file
- **successful_uploads**: Successfully uploaded records
- **failed_uploads**: Failed uploads
- **upload_date**: When upload occurred
- **categories**: Categories found in upload
- **notes**: Optional notes

## Data Processing

### Validation Steps

1. **File Format Validation**: Checks if file is CSV, XLSX, or JSON
2. **Coordinate Validation**: Ensures lat/lng are valid (not 0,0)
3. **Category Validation**: Checks if category matches target list
4. **Deduplication**: Uses hash of name+address+coordinates to prevent duplicates
5. **Data Normalization**: Standardizes field names and category names

### Upload Process

1. Read file and parse data
2. Create batch record in database
3. Process each record:
   - Map field names to standard format
   - Validate coordinates
   - Normalize category
   - Check against target categories
   - Generate unique source_id
   - Upload to database
4. Update batch record with results
5. Display statistics

### Progress Tracking

- Progress updates every 100 records
- Real-time success/failure counting
- Categories found tracking
- Final statistics display

## Category Toggles in UI

The Network Map application includes category toggles for filtering:

### Accessing Toggles
1. Enable Neon medical providers in the map
2. Category toggle panel appears in top-left corner
3. All 18 categories shown in 2-column grid
4. Check/uncheck to filter providers

### Toggle Features
- **Color-coded checkboxes**: Each category has unique color
- **Real-time filtering**: Map updates immediately when toggled
- **All enabled by default**: All categories start enabled
- **Loading indicator**: Shows when data is loading
- **Scrollable list**: Long list scrolls within panel

### Category Colors
- **Dentist**: Cyan (#06b6d4)
- **General Practitioner**: Green (#84cc16)
- **Cardiologist**: Red (#dc2626)
- **Internal Medicine**: Blue (#3b82f6)
- **Occupational Health Specialist**: Orange (#f97316)
- **Occupational Health Clinic**: Light Orange (#fb923c)
- **Audiologist**: Sky (#22d3ee)
- **Radiology Imaging Center**: Purple (#8b5cf6)
- **Medical Clinic**: Emerald (#10b981)
- **Private Practice**: Teal (#14b8a6)
- **Urgent Care**: Amber (#f59e0b)
- **Polyclinic**: Cyan (#06b6d4)
- **Hospital**: Red (#ef4444)
- **Primary Care Provider**: Green (#84cc16)
- **Independent Medical Examiner**: Orange (#f97316)
- **Orthopedist**: Orange (#f97316)
- **Pulmonologist**: Blue (#3b82f6)
- **Neurologist**: Purple (#8b5cf6)

## Example Data Files

### CSV Example

```csv
name,address,lat,lng,category,phone,website,city,state,country
"Smith Dental Clinic","123 Main St",40.7128,-74.0060,Dentist,"555-1234","http://smithdental.com","New York","NY","USA"
"City Hospital","456 Health Ave",40.7589,-73.9851,Hospital,"555-5678","http://cityhospital.com","New York","NY","USA"
"Dr. Jones Cardiology","789 Heart Blvd",40.7614,-73.9776,Cardiologist,"555-9012","http://jonescardio.com","New York","NY","USA"
```

### JSON Example

```json
[
  {
    "name": "Smith Dental Clinic",
    "address": "123 Main St",
    "lat": 40.7128,
    "lng": -74.0060,
    "category": "Dentist",
    "phone": "555-1234",
    "website": "http://smithdental.com",
    "city": "New York",
    "state": "NY",
    "country": "USA"
  },
  {
    "name": "City Hospital",
    "address": "456 Health Ave",
    "lat": 40.7589,
    "lng": -73.9851,
    "category": "Hospital",
    "phone": "555-5678",
    "website": "http://cityhospital.com",
    "city": "New York",
    "state": "NY",
    "country": "USA"
  }
]
```

## Troubleshooting

### File Not Found
**Error**: `File not found: <file_path>`
**Solution**: Check file path is correct and file exists

### Invalid Coordinates
**Error**: `Skipping record: Invalid coordinates`
**Solution**: Ensure lat/lng fields contain valid decimal numbers (not 0,0)

### Invalid Category
**Error**: `Skipping invalid category: <category>`
**Solution**: Check category matches one of the 18 target categories

### Database Connection Error
**Error**: `NEON_DATABASE_URL environment variable is required`
**Solution**: Ensure NEON_DATABASE_URL is set in .env file

### Unsupported Format
**Error**: `Unsupported file format`
**Solution**: Use CSV, XLSX, or JSON format

## Monitoring Uploads

### Check Upload Stats

```sql
-- View all upload batches
SELECT * FROM uploaded_data_batches ORDER BY upload_date DESC;

-- View stats by source type
SELECT 
  source_type,
  COUNT(*) as count,
  COUNT(DISTINCT category) as categories
FROM medical_providers
GROUP BY source_type;

-- View uploaded data by category
SELECT 
  category,
  COUNT(*) as count
FROM medical_providers
WHERE source_type = 'uploaded'
GROUP BY category
ORDER BY count DESC;
```

### Command Line Stats

Running `pnpm upload:geocoded` without arguments displays:
- Database stats by source type
- Uploaded data by category

## Best Practices

### Data Preparation
1. **Clean data**: Remove duplicates before upload
2. **Validate coordinates**: Ensure lat/lng are accurate
3. **Standardize categories**: Use target category names
4. **Include metadata**: Add city, state, country for better filtering
5. **Test sample**: Upload small sample first

### File Organization
- Use descriptive batch names
- Organize by region or category
- Keep original files for reference
- Document data sources

### Upload Strategy
1. Start with small batches (100-1000 records)
2. Verify data quality in database
3. Scale up to larger batches
4. Monitor for duplicates
5. Update exclusion lists if needed

## Integration with Scraping

### Complementary Approach
- **Upload first**: Upload existing high-quality data
- **Scrape gaps**: Use scrapers to fill missing regions/categories
- **Deduplication**: System prevents duplicates via source_id
- **Confidence scoring**: Uploaded data gets 0.95 confidence score

### Source Type Filtering
You can filter by source type in queries:

```sql
-- Only uploaded data
SELECT * FROM medical_providers WHERE source_type = 'uploaded';

-- Only scraped data
SELECT * FROM medical_providers WHERE source_type = 'scraped';

-- Both types
SELECT * FROM medical_providers;
```

## Performance

### Upload Speed
- **Small files** (<1000 records): <1 minute
- **Medium files** (1000-10000 records): 1-5 minutes
- **Large files** (>10000 records): 5-30 minutes

### Database Performance
- **Indexes**: Automatically created on source_type and source_id
- **Batch inserts**: Efficient upsert operations
- **Deduplication**: Hash-based for fast duplicate detection

## Security

### Data Privacy
- Never upload sensitive patient data
- Remove personal health information (PHI)
- Anonymize provider names if needed
- Comply with data privacy regulations

### API Keys
- Keep NEON_DATABASE_URL secure
- Never commit to version control
- Use environment variables
- Rotate credentials regularly

## Next Steps

1. **Prepare your data**: Format as CSV/XLSX/JSON
2. **Test upload**: Upload small sample first
3. **Verify quality**: Check database for accuracy
4. **Upload full dataset**: Process complete dataset
5. **Test UI**: Verify category toggles work
6. **Integrate with scraping**: Use scrapers for gaps

## Support

For issues with:
- **Upload script**: Check console logs and error messages
- **Database**: Verify NEON_DATABASE_URL and connection
- **Data quality**: Review uploaded data in database
- **UI integration**: Check browser console for errors
