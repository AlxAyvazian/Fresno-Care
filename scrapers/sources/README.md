# Source Configs

Each scraper source is a JSON config file. The goal is to avoid writing a new spider for every clinic chain when the site can be handled with CSS or XPath selectors.

## Standard location-page config

Use `clinic_directory` when a site has a locations index page with repeated cards.

Required keys:

- `sourceTag`: short source identifier stored with imported rows
- `allowedDomains`: domains the spider may follow
- `startUrls`: first page or pages to crawl
- `listSelector`: CSS selector for each location card
- `fields`: field extraction rules from each card

Optional keys:

- `detailFields`: extraction rules from detail pages
- `follow.detailLinks`: links from a card to a detail page
- `follow.pagination`: links to additional list pages
- `defaults`: default values added to every row

## Sitemap config

Use `sitemap_directory` when location pages are listed in sitemap XML.

Required keys:

- `sourceTag`
- `allowedDomains`
- `sitemapUrls`
- `fields`

Optional keys:

- `urlInclude`: regex patterns that must match location-page URLs
- `urlExclude`: regex patterns to skip blog, news, career, or unrelated URLs
- `maxPages`: safety cap for page visits
- `defaults`: default values added to every row

## Field rule examples

```json
"name": { "css": "h1::text" }
```

```json
"phone": { "css": "a[href^='tel:']::text" }
```

```json
"services": { "css": ".services li::text", "join": ", " }
```

```json
"city": { "xpath": "//*[contains(@class, 'city')]/text()" }
```

## Minimum viable import fields

The downstream import requires at least:

- `name`
- `city`
- `state`

For the Network Map to be useful, also try to capture:

- address
- phone
- fax
- website
- hours
- services
- evidenceNote
- sourceUrl
