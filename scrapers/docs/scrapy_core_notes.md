# Scrapy Core API Notes for Network Map

These notes explain how the Scrapy features used by this ingestion layer map to the Network Map provider-source workflow.

## Why Scrapy fits this use case

Scrapy is useful here because it can crawl public clinic and provider directories, extract structured rows, follow pagination, and export JSON Lines. The Network Map can then validate and import those rows without running live crawlers inside user-facing searches.

## Feed exports

The scraper layer exports JSON Lines first because that keeps every scraped clinic row inspectable before import.

Recommended flow:

```text
crawl -> raw JSONL -> validate/dedupe -> clean JSONL -> import CSV -> API/database
```

## Selectors

Source configs use CSS and XPath selector rules so a new clinic chain can be added without creating a one-off spider when the site structure is straightforward.

## Politeness settings

The project settings enable crawler controls that are important for public clinic sites:

- `ROBOTSTXT_OBEY`
- `CONCURRENT_REQUESTS_PER_DOMAIN`
- `DOWNLOAD_DELAY`
- `AUTOTHROTTLE_ENABLED`
- `DEPTH_LIMIT`
- HTTP caching

## Programmatic/batch crawling

Scrapy exposes Crawler and CrawlerProcess APIs for running crawlers from scripts. This PR intentionally uses the Scrapy CLI and shell runners (`tools/run_source_pipeline.sh` and `tools/run_batch_pipeline.sh`) rather than embedding `CrawlerProcess` inside the live app. This keeps the batch layer separate, easy to review, and safe to run without touching the Node/Express runtime.

## Source config validation

Before a crawl, run:

```bash
python tools/check_source_config.py sources/example.json
```

The validator checks:

- required keys (`sourceTag`, `startUrls` or `sitemapUrls`, `fields`)
- valid HTTP/HTTPS URLs for start and sitemap URLs
- valid regex patterns for `urlInclude` and `urlExclude`
- selector rules and `join` separators
- presence of required import fields (`name`, `city`, `state`) across `fields`, `detailFields`, and `defaults`

## Stats and validation

Scrapy collects crawl stats internally while a spider runs. For this PR, the external validation step reports practical import readiness:

- input row count
- valid row count
- invalid row count
- duplicate row count
- invalid samples

The source and batch pipeline runners also print row counts for the raw JSONL, clean JSONL, and import CSV. This is intentionally separate from the app runtime so failed or low-quality crawls do not pollute Network Map search results.

## Non-goals

- Do not run Scrapy inside live provider search routes or map rendering.
- Do not replace NPI, FMCSA, imported-clinic, or existing provider-source adapters.
- Do not alter map rendering or current provider scoring.
- Do not remove existing provider data flows.
- Do not require Python/Scrapy to serve normal user requests.
- Treat Scrapy as an additional offline ingestion source only.

