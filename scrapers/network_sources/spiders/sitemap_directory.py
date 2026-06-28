import json
import re
from pathlib import Path
from typing import Any
from urllib.parse import urlparse

import scrapy

from network_sources.items import ClinicLocationItem


class SitemapDirectorySpider(scrapy.Spider):
    """Config-driven spider for clinic chains that expose sitemap XML files.

    Run with:
        scrapy crawl sitemap_directory -a config=sources/example_sitemap_directory.json -O output/clinics.jsonl
    """

    name = "sitemap_directory"

    def __init__(self, config: str | None = None, *args: Any, **kwargs: Any):
        super().__init__(*args, **kwargs)
        if not config:
            raise ValueError("Missing required spider arg: -a config=path/to/source.json")

        config_path = Path(config)
        if not config_path.exists():
            raise ValueError(f"Spider config not found: {config_path}")

        self.config_path = config_path
        self.source_config = json.loads(config_path.read_text(encoding="utf-8"))
        self.source_tag = self.source_config.get("sourceTag", config_path.stem)
        self.start_urls = self.source_config.get("sitemapUrls", [])
        self.allowed_domains = self.source_config.get("allowedDomains", [])
        self.include_patterns = [re.compile(pattern) for pattern in self.source_config.get("urlInclude", [])]
        self.exclude_patterns = [re.compile(pattern) for pattern in self.source_config.get("urlExclude", [])]
        self.max_pages = int(self.source_config.get("maxPages", 5000))
        self._queued_pages = 0

        if not self.start_urls:
            raise ValueError(f"No sitemapUrls configured in {config_path}")

    def parse(self, response):
        for url in response.xpath("//*[local-name()='loc']/text()").getall():
            url = url.strip()
            if not url:
                continue
            if self._looks_like_sitemap(url):
                yield response.follow(url, callback=self.parse)
                continue
            if not self._should_visit_page(url):
                continue
            self._queued_pages += 1
            if self._queued_pages > self.max_pages:
                self.logger.warning("maxPages reached for %s", self.source_tag)
                return
            yield response.follow(url, callback=self.parse_location_page)

    def parse_location_page(self, response):
        fields = self.source_config.get("fields", {})
        item = ClinicLocationItem()

        for field_name, value in self.source_config.get("defaults", {}).items():
            item[field_name] = value

        for field_name, rule in fields.items():
            value = self._extract_one(response, rule)
            if value:
                item[field_name] = value

        item.setdefault("sourceTag", self.source_tag)
        item.setdefault("sourceUrl", response.url)
        item.setdefault("internalStatus", "candidate")
        yield item

    def _should_visit_page(self, url: str) -> bool:
        if self.allowed_domains:
            host = urlparse(url).hostname or ""
            if not any(host == domain or host.endswith(f".{domain}") for domain in self.allowed_domains):
                return False
        if self.include_patterns and not any(pattern.search(url) for pattern in self.include_patterns):
            return False
        if self.exclude_patterns and any(pattern.search(url) for pattern in self.exclude_patterns):
            return False
        return True

    @staticmethod
    def _looks_like_sitemap(url: str) -> bool:
        lowered = url.lower()
        return lowered.endswith(".xml") or "sitemap" in lowered

    def _extract_one(self, node, rule: Any):
        values = self._extract_all(node, rule)
        if not values:
            return None
        if isinstance(rule, dict) and rule.get("join"):
            return str(rule.get("join", " ")).join(values)
        return values[0]

    def _extract_all(self, node, rule: Any):
        if not rule:
            return []
        if isinstance(rule, str):
            selector_type = "css"
            selector = rule
        else:
            selector_type = rule.get("type", "css")
            selector = rule.get("selector") or rule.get("css") or rule.get("xpath")

        if not selector:
            return []

        if selector_type == "xpath" or (isinstance(rule, dict) and rule.get("xpath")):
            selected = node.xpath(selector)
        else:
            selected = node.css(selector)

        values = selected.getall()
        return [" ".join(str(value).split()).strip() for value in values if str(value).strip()]
