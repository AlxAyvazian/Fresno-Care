# Scrapy Provider Ingestion

This folder adds a separate Scrapy-based ingestion layer for the Network Map. It is intentionally separate from the live React and Express runtime so scraping does not slow down user searches or break map rendering.

## Purpose

Use Scrapy to collect clinic directory data from public location pages, normalize it into Network Map provider rows, and import those rows into the existing provider import endpoint.

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

## Run the generic clinic directory spider

```bash
scrapy crawl clinic_directory \
  -a config=sources/example_clinic_directory.json \
  -O output/example-clinics.jsonl
```

Use `-O` to overwrite an output file, or `-o` to append.

## Import JSONL into Network Map

```bash
python tools/import_jsonl_to_network_map.py \
  --input output/example-clinics.jsonl \
  --api-base http://localhost:8080 \
  --source-tag example-clinic-directory
```

The importer sends rows to `/provider-sources/import` as JSON rows. The API route supports CSV, JSONL, and JSON rows.

## Important implementation rule

Scrapy should run as a batch ingestion worker. Do not run crawlers inside live map searches. The map should read normalized imported provider rows from the database through the existing provider-source pipeline.
