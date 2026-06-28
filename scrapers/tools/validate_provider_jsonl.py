#!/usr/bin/env python3
"""Validate and dedupe Scrapy provider JSONL before importing into Network Map."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Any

REQUIRED_FIELDS = ("name", "city", "state")


def normalize_text(value: Any) -> str:
    if value is None:
        return ""
    if isinstance(value, list):
        value = " ".join(str(part) for part in value)
    return " ".join(str(value).replace("\xa0", " ").split()).strip()


def normalized_key(row: dict[str, Any]) -> str:
    name = normalize_text(row.get("name")).lower()
    address = normalize_text(row.get("address") or row.get("address1")).lower()
    city = normalize_text(row.get("city")).lower()
    state = normalize_text(row.get("state")).upper()[:2]
    phone = re.sub(r"\D+", "", normalize_text(row.get("phone")))
    return "|".join([name, address, city, state, phone])


def read_rows(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        if not line.strip():
            continue
        try:
            row = json.loads(line)
        except json.JSONDecodeError as exc:
            raise SystemExit(f"Invalid JSONL at {path}:{line_number}: {exc}") from exc
        if not isinstance(row, dict):
            raise SystemExit(f"Expected JSON object at {path}:{line_number}")
        row["_lineNumber"] = line_number
        rows.append(row)
    return rows


def validate_rows(rows: list[dict[str, Any]]) -> tuple[list[dict[str, Any]], list[dict[str, Any]], int]:
    valid: list[dict[str, Any]] = []
    invalid: list[dict[str, Any]] = []
    seen: set[str] = set()
    duplicate_count = 0

    for row in rows:
        missing = [field for field in REQUIRED_FIELDS if not normalize_text(row.get(field))]
        if missing:
            invalid.append({"line": row.get("_lineNumber"), "reason": f"missing {', '.join(missing)}"})
            continue

        row["state"] = normalize_text(row.get("state")).upper()[:2]
        key = normalized_key(row)
        if key in seen:
            duplicate_count += 1
            continue
        seen.add(key)

        row.pop("_lineNumber", None)
        valid.append(row)

    return valid, invalid, duplicate_count


def write_jsonl(path: Path, rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as handle:
        for row in rows:
            handle.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate and dedupe provider JSONL")
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", type=Path, help="Optional cleaned JSONL output path")
    args = parser.parse_args()

    rows = read_rows(args.input)
    valid, invalid, duplicate_count = validate_rows(rows)

    report = {
        "inputRows": len(rows),
        "validRows": len(valid),
        "invalidRows": len(invalid),
        "duplicateRows": duplicate_count,
        "invalidSamples": invalid[:20],
    }
    print(json.dumps(report, indent=2, sort_keys=True))

    if args.output:
        write_jsonl(args.output, valid)

    return 0 if valid else 1


if __name__ == "__main__":
    raise SystemExit(main())
