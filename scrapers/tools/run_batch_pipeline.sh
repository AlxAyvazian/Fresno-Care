#!/usr/bin/env bash
set -uo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <config> [config ...]" >&2
  echo "Example: $0 sources/example_clinic_directory.json sources/example_sitemap_directory.json" >&2
  echo "Optional: set API_BASE=http://localhost:8080/api to import each generated CSV" >&2
  exit 1
fi

SUMMARY_FILE=$(mktemp)
trap 'rm -f "$SUMMARY_FILE"' EXIT

line_count() {
  if [[ -f "$1" ]]; then
    wc -l < "$1" | tr -d ' '
  else
    echo "0"
  fi
}

for CONFIG in "$@"; do
  if [[ ! -f "$CONFIG" ]]; then
    echo "Missing config: $CONFIG" >&2
    printf "MISSING|unknown|0|0|0|failed\n" >> "$SUMMARY_FILE"
    continue
  fi

  SOURCE_TAG="$(python3 - <<'PY' "$CONFIG"
import json
import pathlib
import sys
path = pathlib.Path(sys.argv[1])
config = json.loads(path.read_text(encoding='utf-8'))
print(config.get('sourceTag') or path.stem)
PY
  )"

  SPIDER="clinic_directory"
  if python3 - <<'PY' "$CONFIG"
import json
import pathlib
import sys
config = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding='utf-8'))
sys.exit(0 if config.get('sitemapUrls') else 1)
PY
  then
    SPIDER="sitemap_directory"
  fi

  echo ""
  echo "Running $SPIDER for $CONFIG as $SOURCE_TAG"

  OUT_DIR="output/${SOURCE_TAG}"
  if bash tools/run_source_pipeline.sh "$SPIDER" "$CONFIG" "$SOURCE_TAG"; then
    STATUS="ok"
  else
    STATUS="failed"
    echo "Pipeline failed for $CONFIG" >&2
  fi

  RAW_COUNT=$(line_count "${OUT_DIR}/raw.jsonl")
  CLEAN_COUNT=$(line_count "${OUT_DIR}/clean.jsonl")
  IMPORT_COUNT=$(( $(line_count "${OUT_DIR}/import.csv") - 1 ))
  [[ "$IMPORT_COUNT" -lt 0 ]] && IMPORT_COUNT=0

  printf "%s|%s|%s|%s|%s|%s\n" "$SOURCE_TAG" "$SPIDER" "$RAW_COUNT" "$CLEAN_COUNT" "$IMPORT_COUNT" "$STATUS" >> "$SUMMARY_FILE"
done

echo ""
echo "=== Batch summary ==="
printf "%-32s %-20s %6s %6s %6s %8s\n" "Source" "Spider" "Raw" "Clean" "Import" "Status"
echo "-----------------------------------------------------------------------------------------------"

TOTAL_RAW=0
TOTAL_CLEAN=0
TOTAL_IMPORT=0
while IFS='|' read -r source_tag spider raw clean import status; do
  printf "%-32s %-20s %6s %6s %6s %8s\n" "$source_tag" "$spider" "$raw" "$clean" "$import" "$status"
  TOTAL_RAW=$((TOTAL_RAW + raw))
  TOTAL_CLEAN=$((TOTAL_CLEAN + clean))
  TOTAL_IMPORT=$((TOTAL_IMPORT + import))
done < "$SUMMARY_FILE"

echo "-----------------------------------------------------------------------------------------------"
printf "%-32s %-20s %6s %6s %6s %8s\n" "Total" "" "$TOTAL_RAW" "$TOTAL_CLEAN" "$TOTAL_IMPORT" ""

# Propagate failure if any source failed
if grep -q '|failed$' "$SUMMARY_FILE"; then
  exit 1
fi
