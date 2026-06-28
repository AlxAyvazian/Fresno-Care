#!/usr/bin/env python3
"""Import Scrapy JSONL clinic rows into the Network Map API.

Example:
    python tools/import_jsonl_to_network_map.py \
      --input output/clinics.jsonl \
      --api-base http://localhost:8080 \
      --source-tag fast-pace
"""

from __future__ import annotations

import argparse
import json
import sys
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_number, line in enumerate(handle, start=1):
            stripped = line.strip()
            if not stripped:
                continue
            try:
                value = json.loads(stripped)
            except json.JSONDecodeError as exc:
                raise SystemExit(f"Invalid JSONL at {path}:{line_number}: {exc}") from exc
            if not isinstance(value, dict):
                raise SystemExit(f"Expected object at {path}:{line_number}; got {type(value).__name__}")
            rows.append(value)
    return rows


def post_rows(api_base: str, source_tag: str, rows: list[dict[str, Any]]) -> dict[str, Any]:
    url = api_base.rstrip("/") + "/provider-sources/import"
    payload = json.dumps({"sourceTag": source_tag, "rows": rows}).encode("utf-8")
    request = urllib.request.Request(
        url,
        data=payload,
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            return json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as exc:
        body = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"Import failed with HTTP {exc.code}: {body}") from exc
    except urllib.error.URLError as exc:
        raise SystemExit(f"Import failed: {exc}") from exc


def main() -> int:
    parser = argparse.ArgumentParser(description="Import Scrapy JSONL clinic rows into Network Map.")
    parser.add_argument("--input", required=True, type=Path, help="Path to Scrapy JSONL output")
    parser.add_argument("--api-base", default="http://localhost:8080", help="Network Map API base URL")
    parser.add_argument("--source-tag", required=True, help="Source tag to apply to imported rows")
    args = parser.parse_args()

    rows = read_jsonl(args.input)
    if not rows:
        print(f"No rows found in {args.input}", file=sys.stderr)
        return 1

    result = post_rows(args.api_base, args.source_tag, rows)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
