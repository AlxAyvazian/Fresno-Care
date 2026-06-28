#!/usr/bin/env python3
"""Convert Scrapy JSONL output into CSV for the existing Network Map import route."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

HEADERS = ["name", "address", "city", "state", "zip", "phone", "fax", "website", "npi", "services", "notes"]
ALIASES = {
    "name": ["name", "clinicName", "providerName", "facilityName"],
    "address": ["address", "address1", "streetAddress"],
    "city": ["city", "locality"],
    "state": ["state", "region"],
    "zip": ["zip", "zipCode", "postalCode"],
    "phone": ["phone", "phoneNumber"],
    "fax": ["fax", "faxNumber"],
    "website": ["website", "sourceUrl", "url"],
    "npi": ["npi"],
    "services": ["services", "service"],
}


def first(row: dict[str, Any], keys: list[str]) -> str:
    for key in keys:
        value = row.get(key)
        if value is None:
            continue
        if isinstance(value, list):
            value = " | ".join(str(part).strip() for part in value if str(part).strip())
        text = str(value).strip()
        if text:
            return text
    return ""


def clean(value: str) -> str:
    return " ".join(value.replace("\r", " ").replace("\n", " ").replace(",", ";").split())


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows = []
    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        if not line.strip():
            continue
        value = json.loads(line)
        if not isinstance(value, dict):
            raise ValueError(f"Line {line_number} is not a JSON object")
        rows.append(value)
    return rows


def convert(input_path: Path, output_path: Path) -> None:
    lines = [",".join(HEADERS)]
    for row in read_jsonl(input_path):
        record = {header: clean(first(row, ALIASES.get(header, [header]))) for header in HEADERS}
        note_parts = [
            first(row, ["evidenceNote", "notes"]),
            f"Hours: {first(row, ['hours', 'hoursOfOperation'])}" if first(row, ["hours", "hoursOfOperation"]) else "",
            f"Source URL: {first(row, ['sourceUrl', 'url'])}" if first(row, ["sourceUrl", "url"]) else "",
        ]
        record["notes"] = clean(" | ".join(part for part in note_parts if part))
        lines.append(",".join(record[header] for header in HEADERS))
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description="Convert Scrapy JSONL to import-safe CSV")
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    convert(args.input, args.output)
    print(f"Wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
