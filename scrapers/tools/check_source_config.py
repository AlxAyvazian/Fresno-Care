#!/usr/bin/env python3
"""Validate scraper source JSON configs before running a crawl."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Any
from urllib.parse import urlparse

COMMON_ALLOWED_FIELDS = {
    "name",
    "address",
    "address1",
    "address2",
    "city",
    "state",
    "postalCode",
    "zip",
    "phone",
    "fax",
    "website",
    "url",
    "hours",
    "hoursOfOperation",
    "services",
    "sourceTag",
    "sourceUrl",
    "evidenceNote",
    "notes",
    "internalStatus",
    "lat",
    "lng",
    "npi",
}


REQUIRED_IMPORT_FIELDS = {"name", "city", "state"}

SOURCE_TAG_PATTERN = re.compile(r"^[a-zA-Z0-9_-]+$")


def load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Invalid JSON in {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise SystemExit(f"Config must be a JSON object: {path}")
    return value


def validate_rule(path: str, rule: Any, errors: list[str], warnings: list[str]) -> None:
    if isinstance(rule, str):
        if not rule.strip():
            errors.append(f"{path} selector is empty")
        return
    if not isinstance(rule, dict):
        errors.append(f"{path} must be a selector string or object")
        return
    selector_type = rule.get("type", "css")
    if selector_type not in {"css", "xpath"}:
        errors.append(f"{path} selector type must be css or xpath, got {selector_type}")
    has_selector = any(rule.get(key) for key in ("css", "xpath", "selector"))
    if not has_selector:
        errors.append(f"{path} must define css, xpath, or selector")
    if "join" in rule and not isinstance(rule.get("join"), str):
        errors.append(f"{path}.join must be a string separator")


def validate_fields(path: str, fields: Any, errors: list[str], warnings: list[str]) -> None:
    if not isinstance(fields, dict) or not fields:
        errors.append(f"{path} must be a non-empty object")
        return
    for field_name, rule in fields.items():
        if field_name not in COMMON_ALLOWED_FIELDS:
            warnings.append(f"{path}.{field_name} is not a standard import field")
        validate_rule(f"{path}.{field_name}", rule, errors, warnings)


def validate_url(path: str, url: Any, errors: list[str]) -> None:
    if not isinstance(url, str):
        errors.append(f"{path} must be a string URL")
        return
    parsed = urlparse(url)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc:
        errors.append(f"{path} must be an http(s) URL with a host: {url}")


def validate_regex_list(path: str, items: Any, errors: list[str]) -> None:
    if not isinstance(items, list):
        errors.append(f"{path} must be a list of regex strings")
        return
    for idx, item in enumerate(items):
        if not isinstance(item, str):
            errors.append(f"{path}[{idx}] must be a regex string")
            continue
        try:
            re.compile(item)
        except re.error as exc:
            errors.append(f"{path}[{idx}] invalid regex: {exc}")


def validate_config(path: Path) -> tuple[list[str], list[str]]:
    config = load_json(path)
    errors: list[str] = []
    warnings: list[str] = []

    source_tag = config.get("sourceTag")
    if not isinstance(source_tag, str) or not source_tag.strip():
        errors.append("sourceTag is required")
    elif not SOURCE_TAG_PATTERN.match(source_tag):
        warnings.append(
            "sourceTag should contain only letters, numbers, hyphens, and underscores"
        )

    allowed_domains = config.get("allowedDomains")
    if not isinstance(allowed_domains, list) or not allowed_domains:
        warnings.append("allowedDomains is recommended")
    else:
        for idx, domain in enumerate(allowed_domains):
            if not isinstance(domain, str) or not domain.strip():
                errors.append(f"allowedDomains[{idx}] must be a non-empty domain string")

    fields = config.get("fields")
    validate_fields("fields", fields, errors, warnings)

    has_start_urls = isinstance(config.get("startUrls"), list) and bool(config.get("startUrls"))
    has_sitemap_urls = isinstance(config.get("sitemapUrls"), list) and bool(config.get("sitemapUrls"))
    if not has_start_urls and not has_sitemap_urls:
        errors.append("Either startUrls or sitemapUrls is required")
    if has_start_urls:
        for idx, url in enumerate(config["startUrls"]):
            validate_url(f"startUrls[{idx}]", url, errors)
    if has_sitemap_urls:
        for idx, url in enumerate(config["sitemapUrls"]):
            validate_url(f"sitemapUrls[{idx}]", url, errors)

    if has_start_urls and not config.get("listSelector"):
        warnings.append("listSelector is recommended for clinic_directory configs")

    if isinstance(config.get("detailFields"), dict):
        validate_fields("detailFields", config["detailFields"], errors, warnings)

    defaults = config.get("defaults")
    if isinstance(defaults, dict):
        for field_name, value in defaults.items():
            if field_name not in COMMON_ALLOWED_FIELDS:
                warnings.append(f"defaults.{field_name} is not a standard import field")
            if isinstance(value, list):
                warnings.append(f"defaults.{field_name} is a list; it will be joined with spaces")

    follow = config.get("follow")
    if isinstance(follow, dict):
        for key in ("detailLinks", "pagination"):
            rule = follow.get(key)
            if rule:
                validate_rule(f"follow.{key}", rule, errors, warnings)

    if has_sitemap_urls:
        max_pages = config.get("maxPages")
        if max_pages is not None and not isinstance(max_pages, int):
            errors.append("maxPages must be an integer")
        if isinstance(config.get("urlInclude"), list):
            validate_regex_list("urlInclude", config["urlInclude"], errors)
        if isinstance(config.get("urlExclude"), list):
            validate_regex_list("urlExclude", config["urlExclude"], errors)

    provided_required: set[str] = set()
    for section in (fields, config.get("detailFields"), defaults):
        if isinstance(section, dict):
            provided_required.update(section.keys())
    missing_required = REQUIRED_IMPORT_FIELDS - provided_required
    if missing_required:
        warnings.append(
            f"Required import fields not obviously provided by this config: {sorted(missing_required)}. "
            "They may be filled by extraction rules, or rows missing them will be dropped during validation."
        )

    return errors, warnings


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate scraper source config files")
    parser.add_argument("configs", nargs="+", type=Path)
    args = parser.parse_args()

    failed = False
    for config_path in args.configs:
        errors, warnings = validate_config(config_path)
        print(f"\n{config_path}")
        for warning in warnings:
            print(f"  warning: {warning}")
        for error in errors:
            print(f"  error: {error}")
        if errors:
            failed = True
        if not errors and not warnings:
            print("  ok")

    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
