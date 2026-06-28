# Scrapy Provider Ingestion

This folder adds a separate Scrapy-based ingestion layer for the Network Map. It is intentionally separate from the live React and Express runtime so scraping does not slow down user searches or break map rendering.

## Purpose

Use Scrapy to collect clinic directory data from public location pages, normalize it into Network Map provider rows, validate and dedupe those rows, and import them through the existing provider import endpoint.

Expected fields:

- `name`
- `address`
- `city`
- `state`
- `postalCode`
- `phone`
- `fax`
- `website`
- `hours`
- `services`
- `sourceTag`
- `sourceUrl`
- `evidenceNote`
- `lat`
- `lng`

## What this does and does not change

- **What it does:** adds a standalone, offline batch scraper that can produce raw JSONL, clean it, dedupe it, convert it to import CSV, and optionally post it to the existing `/api/provider-sources/import` endpoint.
- **What it does not change:** existing provider search, map rendering, NPI/FMCSA sources, imported-clinic DB flow, provider scoring, or any existing UI or API routes.

Scrapy is never invoked during a normal user request. It is an optional batch ingestion tool.

## Non-goals

- Do not run Scrapy during live provider searches.
- Do not replace the NPI source.
- Do not replace the FMCSA source.
- Do not replace or disable the imported-clinic database flow.
- Do not alter map rendering or provider scoring.
- Do not remove or disable existing provider sources.
- Do not require Python/Scrapy for the live app to serve normal requests.

## Setup

```bash
cd scrapers
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## One-command pipeline

Use this after creating a source config:

```bash
bash tools/run_source_pipeline.sh \
  clinic_directory \
  sources/example_clinic_directory.json \
  example-clinic-directory
```

For sitemap-based location pages:

```bash
bash tools/run_source_pipeline.sh \
  sitemap_directory \
  sources/example_sitemap_directory.json \
  example-sitemap-directory
```

The runner validates the config, crawls the site, validates and dedupes JSONL, and creates an import-ready CSV.

To post into a running local API after CSV generation:

```bash
API_BASE=http://localhost:8080/api bash tools/run_source_pipeline.sh \
  clinic_directory \
  sources/example_clinic_directory.json \
  example-clinic-directory
```

## Batch pipeline

Use this when you have multiple source configs to process:

```bash
bash tools/run_batch_pipeline.sh \
  sources/example_clinic_directory.json \
  sources/example_sitemap_directory.json
```

The batch runner calls the source pipeline for each config, prints a per-source summary table (raw, clean, import row counts and status), and exits non-zero if any source failed. It does not replace any existing Network Map source.

## Validate a source config only

```bash
python tools/check_source_config.py sources/example_clinic_directory.json
```

## Run a clinic directory spider manually

Use this when the public site has a normal locations page with cards, pagination, and optional detail links:

```bash
scrapy crawl clinic_directory \
  -a config=sources/example_clinic_directory.json \
  -O output/example-clinics.raw.jsonl
```

## Run a sitemap-driven spider manually

Use this when a clinic chain exposes a sitemap and location pages are spread across many URLs:

```bash
scrapy crawl sitemap_directory \
  -a config=sources/example_sitemap_directory.json \
  -O output/example-clinics.raw.jsonl
```

## Validate and dedupe output

```bash
python tools/validate_provider_jsonl.py \
  --input output/example-clinics.raw.jsonl \
  --output output/example-clinics.clean.jsonl
```

The validator reports total rows, valid rows, invalid rows, duplicate rows, and invalid samples.

## Convert JSONL for the existing import endpoint

```bash
python tools/jsonl_to_import_csv.py \
  --input output/example-clinics.clean.jsonl \
  --output output/example-clinics-import.csv
```

Then post that CSV text to the existing `/api/provider-sources/import` endpoint with a `sourceTag`:

```bash
python tools/post_import_csv.py \
  --csv output/example-clinics-import.csv \
  --api-base http://localhost:8080/api \
  --source-tag example-clinic-directory
```

The CSV converter intentionally replaces commas inside cell values with semicolons because the current API parser is simple and splits rows on commas.

## Recommended workflow

```text
source config -> config check -> Scrapy crawl -> raw JSONL -> validate/dedupe -> clean JSONL -> import CSV -> Network Map database
```

## Important implementation rule

Scrapy should run as a batch ingestion worker. Do not run crawlers inside live map searches. The map should read normalized imported provider rows from the database through the existing provider-source pipeline.

See `docs/scrapy_core_notes.md` for how the Scrapy core API concepts map to this additive ingestion layer.
