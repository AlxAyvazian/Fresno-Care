#!/usr/bin/env python3
"""Post an import CSV file to the existing Network Map provider import endpoint."""

from __future__ import annotations

import argparse
import json
import urllib.error
import urllib.request
from pathlib import Path


def post_csv(api_base: str, source_tag: str, csv_text: str) -> dict:
    url = api_base.rstrip("/") + "/provider-sources/import"
    body = json.dumps({"sourceTag": source_tag, "csv": csv_text}).encode("utf-8")
    request = urllib.request.Request(
        url,
        data=body,
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            return json.loads(response.read().decode("utf-8"))
    except urllib.error.HTTPError as exc:
        detail = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"HTTP {exc.code}: {detail}") from exc


def main() -> int:
    parser = argparse.ArgumentParser(description="Post provider import CSV to Network Map API")
    parser.add_argument("--csv", required=True, type=Path, help="Import CSV file path")
    parser.add_argument("--api-base", default="http://localhost:8080/api", help="API base URL ending before /provider-sources/import")
    parser.add_argument("--source-tag", required=True, help="Source tag to apply to imported rows")
    args = parser.parse_args()

    result = post_csv(args.api_base, args.source_tag, args.csv.read_text(encoding="utf-8"))
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
