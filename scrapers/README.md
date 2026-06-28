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

Then post that CSV text to the existing `/api/provider-sources/import` endpoint with a `sourceTag`.

The CSV converter intentionally replaces commas inside cell values with semicolons because the current API parser is simple and splits rows on commas.

## Recommended workflow

```text
source config -> config check -> Scrapy crawl -> raw JSONL -> validate/dedupe -> clean JSONL -> import CSV -> Network Map database
```

## Important implementation rule

Scrapy should run as a batch ingestion worker. Do not run crawlers inside live map searches. The map should read normalized imported provider rows from the database through the existing provider-source pipeline.
