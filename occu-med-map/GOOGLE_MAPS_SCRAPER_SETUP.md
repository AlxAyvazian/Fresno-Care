# Google Maps Medical Provider Scraper

Automated global medical provider data collection using Google Maps Places API with Neon PostgreSQL database storage.

## Overview

This scraper systematically collects medical provider data from Google Maps across 22 major global regions and 20+ medical categories, storing results in a Neon PostgreSQL database for integration with the Network Map application.

## Prerequisites

### 1. Google Maps API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing project
3. Enable the following APIs:
   - Places API
   - Places Details API
4. Create an API key with restrictions:
   - Application restrictions: None (or IP address if needed)
   - API restrictions: Only allow Places API
5. Copy the API key

**Important**: Google Maps free tier allows 150,000 API calls per day. The scraper includes rate limiting to stay within this quota.

### 2. Neon PostgreSQL Database

1. Go to [Neon Console](https://console.neon.tech/)
2. Create a new project
3. Copy the connection string (PostgreSQL URL)
4. Format: `postgresql://user:password@ep-xxx.aws.neon.tech/neondb?sslmode=require`

## Setup

### 1. Install Dependencies

```bash
cd occu-med-map
pnpm install
```

### 2. Configure Environment Variables

Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

Edit `.env` and add your credentials:

```env
GOOGLE_MAPS_API_KEY=your_actual_google_maps_api_key_here
NEON_DATABASE_URL=postgresql://user:password@ep-xxx.aws.neon.tech/neondb?sslmode=require
```

### 3. Run Database Initialization

The scraper will automatically create the database schema on first run, including:

- `medical_providers` table with comprehensive provider data
- `scraping_metadata` table for tracking scraping operations
- `medical_categories` reference table
- Optimized indexes for efficient querying

## Usage

### Run Full Global Scrape

```bash
pnpm scrape:google-maps
```

This will:
- Scrape 22 major global regions (North America, Europe, Asia, South America, Africa, Oceania)
- Search for 20+ medical categories per region
- Collect detailed provider information (name, address, coordinates, contact info, ratings, etc.)
- Store results in Neon database with automatic deduplication
- Respect Google Maps API rate limits (150,000 calls/day)

### Expected Output

```
Starting global medical provider scrape...
Regions: 22
Categories: 20
Scraping New York for Hospital...
Completed New York for Hospital: 45 found, 42 saved
Scraping New York for Clinic...
...
Scrape completed: 15420 found, 14850 saved, 89234 API calls
```

## Database Schema

### medical_providers Table

| Column | Type | Description |
|--------|------|-------------|
| id | SERIAL | Primary key |
| place_id | TEXT | Google Maps unique identifier |
| name | TEXT | Provider name |
| formatted_address | TEXT | Full address |
| lat, lng | DECIMAL | Coordinates |
| types | TEXT[] | Google Maps place types |
| category | TEXT | Medical category (Hospital, Clinic, etc.) |
| phone | TEXT | Phone number |
| website | TEXT | Website URL |
| rating | DECIMAL | Average rating (1-5) |
| user_ratings_total | INTEGER | Number of reviews |
| opening_hours | JSONB | Operating hours |
| business_status | TEXT | Operational status |
| country_code | TEXT | ISO country code |
| locality | TEXT | City name |
| scraped_at | TIMESTAMP | When data was collected |
| raw_data | JSONB | Complete Google Maps response |

## Medical Categories

The scraper searches for these medical categories:

- Hospital, Clinic, Doctor, Urgent Care
- Pharmacy, Dentist, Laboratory, Radiology
- Physical Therapy, Mental Health, Optometry
- Audiology, Nursing Home, Cardiology
- Dermatology, Orthopedics, Pediatrics
- Oncology, Neurology, Gynecology

Each category includes multiple search terms (e.g., "hospital", "medical center", "emergency room").

## Global Regions

The scraper covers these major regions:

**North America**: New York, Los Angeles, Chicago, Toronto, Mexico City
**Europe**: London, Paris, Berlin, Madrid, Rome, Moscow
**Asia**: Tokyo, Shanghai, Mumbai, Singapore, Hong Kong, Seoul
**South America**: São Paulo, Buenos Aires
**Africa**: Cairo, Johannesburg
**Oceania**: Sydney, Melbourne

## Rate Limiting & Quota Management

- **Daily Limit**: 150,000 API calls (Google Maps free tier)
- **Rate Limiting**: 1-2 second delays between API calls
- **Page Limit**: Maximum 3 pages per search term
- **Auto-stop**: Stops when daily quota is reached
- **Checkpoint**: Tracks progress in database metadata table

## Data Deduplication

- Uses Google Maps `place_id` as unique identifier
- `ON CONFLICT` clause updates existing records
- Preserves most recent data
- Tracks `scraped_at` and `updated_at` timestamps

## Integration with Network Map

The scraped data can be integrated into the existing Network Map application by:

1. Adding a Neon database connection to the React app
2. Creating API endpoints to query the medical_providers table
3. Using the data to populate the map with global medical providers
4. Implementing the same density field visualization for the new data

## Troubleshooting

### API Key Issues

- Ensure Places API is enabled in Google Cloud Console
- Check API key restrictions (should allow Places API)
- Verify billing is enabled (even for free tier)

### Database Connection Issues

- Verify Neon database URL format
- Check SSL mode is set to `require`
- Ensure database user has proper permissions

### Rate Limiting

- If you hit the daily quota, the scraper will stop automatically
- Wait until the quota resets (daily at midnight Pacific Time)
- Consider upgrading to paid Google Maps plan for higher quotas

### Empty Results

- Some regions may have fewer medical providers
- Check if search terms are appropriate for the region
- Verify API key has proper permissions

## Cost Considerations

- **Google Maps**: Free tier = 150,000 calls/day
- **Neon Database**: Free tier = 0.5GB storage, ~3 billion row reads/month
- **Estimated Data**: 10,000-50,000 providers per major region
- **Total Storage**: ~500MB-2GB for full global dataset

## Next Steps

1. Test with a single region first (modify `GLOBAL_REGIONS` in the script)
2. Monitor API usage in Google Cloud Console
3. Verify data quality in Neon database
4. Integrate with Network Map application
5. Schedule regular updates (weekly/monthly)

## Support

For issues with:
- **Google Maps API**: [Google Maps Platform Documentation](https://developers.google.com/maps/documentation)
- **Neon Database**: [Neon Documentation](https://neon.tech/docs)
- **Script Issues**: Check console logs and database metadata table
