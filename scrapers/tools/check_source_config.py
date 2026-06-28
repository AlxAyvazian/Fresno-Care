#!/usr/bin/env python3
"""Validate scraper source JSON configs before running a crawl."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any

COMMON_ALLOWED_FIELDS = {
    "name",
    "address",
    "address1",
    "address2",
    "city",
    "state",
    "postalCode",
    "phone",
    "fax",
    "website",
    "hours",
    "services",
    "sourceTag",
    "sourceUrl",
    "evidenceNote",
    "internalStatus",
    "lat",
    "lng",
}


def load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Invalid JSON in {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise SystemExit(f"Config must be a JSON object: {path}")
    return value


def validate_rule(path: str, rule: Any, errors: list[str]) -> None:
    if isinstance(rule, str):
        if not rule.strip():
            errors.append(f"{path} selector is empty")
        return
    if not isinstance(rule, dict):
        errors.append(f"{path} must be a selector string or object")
        return
    has_selector = any(rule.get(key) for key in ("css", "xpath", "selector"))
    if not has_selector:
        errors.append(f"{path} must define css, xpath, or selector")


def validate_fields(path: str, fields: Any, errors: list[str], warnings: list[str]) -> None:
    if not isinstance(fields, dict) or not fields:
        errors.append(f"{path} must be a non-empty object")
        return
    for field_name, rule in fields.items():
        if field_name not in COMMON_ALLOWED_FIELDS:
            warnings.append(f"{path}.{field_name} is not a standard import field")
        validate_rule(f"{path}.{field_name}", rule, errors)


def validate_config(path: Path) -> tuple[list[str], list[str]]:
    config = load_json(path)
    errors: list[str] = []
    warnings: list[str] = []

    source_tag = config.get("sourceTag")
    if not isinstance(source_tag, str) or not source_tag.strip():
        errors.append("sourceTag is required")

    allowed_domains = config.get("allowedDomains")
    if not isinstance(allowed_domains, list) or not allowed_domains:
        warnings.append("allowedDomains is recommended")

    fields = config.get("fields")
    validate_fields("fields", fields, errors, warnings)

    has_start_urls = isinstance(config.get("startUrls"), list) and bool(config.get("startUrls"))
    has_sitemap_urls = isinstance(config.get("sitemapUrls"), list) and bool(config.get("sitemapUrls"))
    if not has_start_urls and not has_sitemap_urls:
        errors.append("Either startUrls or sitemapUrls is required")

    if has_start_urls and not config.get("listSelector"):
        warnings.append("listSelector is recommended for clinic_directory configs")

    if isinstance(config.get("detailFields"), dict):
        validate_fields("detailFields", config["detailFields"], errors, warnings)

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
