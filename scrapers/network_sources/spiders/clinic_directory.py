import json
from pathlib import Path
from typing import Any

import scrapy

from network_sources.items import ClinicLocationItem


class ClinicDirectorySpider(scrapy.Spider):
    """Config-driven spider for public clinic and provider location directories.

    Run with:
        scrapy crawl clinic_directory -a config=sources/example_clinic_directory.json -O output/clinics.jsonl
    """

    name = "clinic_directory"

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
        self.allowed_domains = self.source_config.get("allowedDomains", [])
        self.start_urls = self.source_config.get("startUrls", [])

        if not self.start_urls:
            raise ValueError(f"No startUrls configured in {config_path}")

    def parse(self, response):
        list_selector = self.source_config.get("listSelector")
        if list_selector:
            for node in response.css(list_selector):
                yield self._item_from_node(node, response, self.source_config.get("fields", {}))

                detail_links = self.source_config.get("follow", {}).get("detailLinks", {})
                for href in self._extract_all(node, detail_links):
                    yield response.follow(
                        href,
                        callback=self.parse_detail,
                        cb_kwargs={"seed": dict(self._item_from_node(node, response, self.source_config.get("fields", {})))},
                    )
        else:
            yield self._item_from_node(response, response, self.source_config.get("fields", {}))

        pagination = self.source_config.get("follow", {}).get("pagination", {})
        for href in self._extract_all(response, pagination):
            yield response.follow(href, callback=self.parse)

    def parse_detail(self, response, seed: dict[str, Any] | None = None):
        item = ClinicLocationItem(seed or {})
        detail_fields = self.source_config.get("detailFields", {})
        for field_name, rule in detail_fields.items():
            value = self._extract_one(response, rule)
            if value:
                item[field_name] = value
        item["sourceUrl"] = response.url
        yield item

    def _item_from_node(self, node, response, fields: dict[str, Any]):
        item = ClinicLocationItem()
        defaults = self.source_config.get("defaults", {})

        for field_name, value in defaults.items():
            item[field_name] = value

        for field_name, rule in fields.items():
            value = self._extract_one(node, rule)
            if value:
                item[field_name] = value

        item.setdefault("sourceTag", self.source_tag)
        item.setdefault("sourceUrl", response.url)
        item.setdefault("internalStatus", "candidate")
        return item

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
