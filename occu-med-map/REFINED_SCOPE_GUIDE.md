# Refined Medical Provider Scraping Scope

Updated scope focusing on specific medical provider types with exclusion filters to ensure data quality and relevance.

## Target Medical Categories (18 Total)

### Primary Care & General Medicine
1. **Dentist** (excludes: orthodontist, periodontist, oral surgeon, endodontist, pediatric dentist)
2. **General Practitioner** (excludes: pediatrician, geriatrician)
3. **Internal Medicine** (no exclusions)
4. **Primary Care Provider** (excludes: pediatrician, geriatrician)

### Specialists
5. **Cardiologist** (excludes: cardiac surgeon, cardiothoracic surgeon)
6. **Orthopedist** (excludes: orthopedic surgeon, sports medicine surgeon)
7. **Pulmonologist** (no exclusions)
8. **Neurologist** (excludes: neurosurgeon)

### Occupational Health
9. **Occupational Health Specialist** (no exclusions)
10. **Occupational Health Clinic** (no exclusions)
11. **Independent Medical Examiner** (excludes: forensic pathologist, coroner)

### Diagnostic & Imaging
12. **Audiologist** (no exclusions)
13. **Radiology Imaging Center** (excludes: surgery center, surgical center)

### Facilities
14. **Medical Clinic** (excludes: surgical clinic, cosmetic clinic, urgent care, emergency clinic)
15. **Private Practice** (excludes: dental specialist, surgical practice)
16. **Urgent Care** (excludes: emergency room, emergency department, trauma center)
17. **Polyclinic** (excludes: hospital, surgical center)
18. **Hospital** (excludes: surgical hospital, rehabilitation hospital, nursing home, long term care)

## Excluded Categories (Not Scraped)

### Long-term Care
- Nursing homes
- Assisted living facilities
- Rehabilitation centers
- Long-term care facilities

### Emergency & Surgical
- Emergency medicine
- Emergency rooms
- Trauma centers
- Surgical hospitals
- Surgery centers
- Surgical clinics

### Dental Specialists
- Orthodontists
- Periodontists
- Oral surgeons
- Endodontists
- Pediatric dentists

### Other Specialties
- Dermatologists
- Pediatricians
- Geriatricians
- Neurosurgeons
- Cardiac surgeons
- Orthopedic surgeons
- Cosmetic clinics
- Physical therapy
- Mental health
- Optometry
- Pharmacies

## Data Sources

### Primary Sources (Enabled by Default)

#### 1. OpenStreetMap/Overpass API
- **Cost**: Free
- **Rate Limit**: 60 requests/minute
- **Daily Limit**: 1,000,000 requests
- **Coverage**: Global
- **Auth Required**: No
- **Strengths**: Unlimited usage, global coverage, no API key
- **Weaknesses**: Variable data quality, some regions less complete

#### 2. Google Maps Places API
- **Cost**: Free tier (150,000 calls/day)
- **Rate Limit**: 50 requests/minute
- **Daily Limit**: 150,000 requests
- **Coverage**: Global
- **Auth Required**: Yes (API key)
- **Strengths**: High-quality data, comprehensive details
- **Weaknesses**: Daily quota limits, requires API key

### Secondary Sources (Optional - Require API Keys)

#### 3. Foursquare Places API
- **Cost**: Free tier (100,000 calls/day)
- **Rate Limit**: 50 requests/minute
- **Daily Limit**: 100,000 requests
- **Coverage**: Global (100M+ POIs across 200+ countries)
- **Auth Required**: Yes (API key)
- **Strengths**: 100M+ POIs, excellent business data, ratings
- **Weaknesses**: Requires API key, focused on commercial venues

#### 4. TomTom API
- **Cost**: Free tier (2,500 non-tile requests/day)
- **Rate Limit**: 10 requests/minute
- **Daily Limit**: 2,500 requests
- **Coverage**: Global
- **Auth Required**: Yes (API key)
- **Strengths**: Good mapping data, POI search
- **Weaknesses**: Low daily quota, requires API key

#### 5. Geoapify API
- **Cost**: Free tier (3,000 credits/day)
- **Rate Limit**: 12 requests/minute
- **Daily Limit**: 3,000 requests
- **Coverage**: Global
- **Auth Required**: Yes (API key)
- **Strengths**: Maps, geocoding, places, routing, isochrones
- **Weaknesses**: Low daily quota, requires API key

### US-Specific Sources (Optional)

#### 6. NPPES/NPI Registry
- **Cost**: Free
- **Rate Limit**: 30 requests/minute
- **Daily Limit**: 10,000 requests
- **Coverage**: USA only
- **Auth Required**: No
- **Strengths**: Official US provider registry, comprehensive
- **Weaknesses**: US only, limited to registered providers

#### 7. HRSA Data Warehouse
- **Cost**: Free
- **Rate Limit**: 5 requests/minute
- **Daily Limit**: 1,000 requests
- **Coverage**: USA only
- **Auth Required**: No (requires data download)
- **Strengths**: Health centers, workforce data, facility context
- **Weaknesses**: US only, requires manual data download

### Occupational Health Sources (Future Implementation)

#### FMCSA National Registry
- DOT medical examiners
- US only
- No auth required

#### FAA AME Locator
- FAA examiners
- US only
- No auth required

#### CAOHC / Audiology Programs
- Hearing/audiogram capability leads
- US only
- No auth required

#### DATIA / Drug Testing Networks
- Drug screen collectors/MRO-related leads
- US only
- No auth required

#### ACOEM / NAOHP Directories
- Occupational health practices
- US only
- No auth required

#### ACR Accredited Facilities
- Imaging/radiology leads
- US only
- No auth required

#### State Licensing Boards
- Dentists, physicians, clinics, labs
- US only
- No auth required

#### State Health Department Facility Lists
- Licensed facilities, hospitals, urgent cares, labs
- US only
- No auth required

#### Quest/Labcorp/CRL Networks
- Lab collection availability
- US only
- No auth required

#### Dental Board / DSO Websites
- Dental exam network building
- US only
- No auth required

## Exclusion Filtering System

### How It Works
Each category has an `exclude` array containing terms that should be filtered out:

```typescript
{
  category: 'Dentist',
  terms: ['dentist', 'dental clinic', 'dental practice', 'general dentist'],
  exclude: ['orthodontist', 'periodontist', 'oral surgeon', 'endodontist', 'pediatric dentist']
}
```

### Filtering Logic
1. **Name-based filtering**: Provider names are checked against exclude terms
2. **Category-based filtering**: Provider categories are checked against exclude terms
3. **Null return**: Excluded providers return null and are not saved to database
4. **Case-insensitive**: Filtering is case-insensitive for robustness

### Example Exclusions
- "Smith Orthodontics" → Excluded (contains "orthodontist")
- "Children's Dental Clinic" → Excluded (contains "pediatric")
- "General Dentistry of Dr. Jones" → Included (no exclude terms)
- "Cardiac Surgery Center" → Excluded (contains "surgery")

## Geographic Coverage

### Current Coverage (60+ cities)
- **North America**: 15 cities
- **Europe**: 15 cities
- **Asia**: 15 cities
- **South America**: 11 cities
- **Africa**: 12 cities
- **Oceania**: 8 cities

### Coverage Strategy
- **Tier 1**: Capital cities of all 195+ countries
- **Tier 2**: Major metropolitan areas (population > 1M)
- **Tier 3**: Regional centers (population > 500K)
- **Tier 4**: Rural areas via OpenStreetMap

## Expected Results

### Data Volume Estimates
- **Providers per city**: 200-2,000 (depending on size and category)
- **Total providers**: 50,000-200,000 globally
- **Database size**: 200MB-1GB

### Category Distribution
- **General Practice**: ~30% of providers
- **Specialists**: ~25% of providers
- **Facilities**: ~25% of providers
- **Occupational Health**: ~10% of providers
- **Diagnostic**: ~10% of providers

### Geographic Distribution
- **North America**: ~35% of providers
- **Europe**: ~30% of providers
- **Asia**: ~20% of providers
- **Other regions**: ~15% of providers

## Configuration

### Enable/Disable Sources
Edit `scripts/multi-source-scraper.ts`:

```typescript
const DATA_SOURCES: DataSource[] = [
  {
    name: 'foursquare',
    enabled: true,  // Set to true to enable
    priority: 3,
    // ...
  }
];
```

### Add API Keys
Add to `.env` file:

```env
FOURSQUARE_API_KEY=your_key_here
TOMTOM_API_KEY=your_key_here
GEOAPIFY_API_KEY=your_key_here
```

### Modify Categories
Edit `MEDICAL_CATEGORIES` array in scraper files to add/remove categories or exclusions.

## Usage

### Run with OpenStreetMap Only (Free)
```bash
pnpm scrape:multi-source
```

### Run with Multiple Sources
1. Add API keys to `.env`
2. Enable sources in `multi-source-scraper.ts`
3. Run scraper

### Run Google Maps Only
```bash
pnpm scrape:google-maps
```

## Quality Assurance

### Data Validation
- **Duplicate detection**: Via source_id
- **Exclusion filtering**: Automatic filtering of unwanted provider types
- **Confidence scoring**: Data quality scores per source
- **Address validation**: Format and completeness checks

### Monitoring
- **Progress tracking**: Real-time database updates
- **Coverage analytics**: Track which cities/regions are covered
- **Error logging**: Comprehensive error tracking
- **Source attribution**: Track which source provided each provider

## Next Steps

1. **Test with sample cities**: Run scraper on 5-10 cities first
2. **Validate exclusions**: Ensure unwanted providers are filtered
3. **Monitor data quality**: Check confidence scores and accuracy
4. **Scale up**: Gradually increase to full global scrape
5. **Add more sources**: Implement occupational health sources
6. **Automate**: Schedule regular scraping runs

## Cost Analysis

### Free Tier Usage
- **OpenStreetMap**: Free (unlimited)
- **Google Maps**: Free (150K/day)
- **Foursquare**: Free (100K/day)
- **TomTom**: Free (2.5K/day)
- **Geoapify**: Free (3K/day)

### Estimated Costs
- **OpenStreetMap only**: $0
- **OpenStreetMap + Google Maps**: $0 (within free tiers)
- **All sources**: $0 (within free tiers for initial scrape)
- **Large-scale operations**: May require paid tiers for Google Maps/Foursquare

## Maintenance

### Regular Updates
- **Weekly**: Re-scrape major cities
- **Monthly**: Full global refresh
- **Quarterly**: Review and update exclusion lists

### Data Quality
- Monitor exclusion effectiveness
- Review duplicate providers
- Validate geographic accuracy
- Check for closed facilities

### Source Monitoring
- Track API quota usage
- Monitor error rates
- Update source configurations
- Add new sources as available
