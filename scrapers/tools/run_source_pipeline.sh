#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <spider> <config> [source-tag]" >&2
  echo "Example: $0 clinic_directory sources/example_clinic_directory.json example-clinic-directory" >&2
  echo "Optional: set API_BASE=http://localhost:8080/api to post the generated CSV after conversion" >&2
  exit 1
fi

SPIDER="$1"
CONFIG="$2"
SOURCE_TAG="${3:-$(basename "$CONFIG" .json)}"
OUT_DIR="output/${SOURCE_TAG}"
RAW_JSONL="${OUT_DIR}/raw.jsonl"
CLEAN_JSONL="${OUT_DIR}/clean.jsonl"
IMPORT_CSV="${OUT_DIR}/import.csv"

mkdir -p "$OUT_DIR"

line_count() {
  if [[ -f "$1" ]]; then
    wc -l < "$1" | tr -d ' '
  else
    echo "0"
  fi
}

python tools/check_source_config.py "$CONFIG"
scrapy crawl "$SPIDER" -a config="$CONFIG" -O "$RAW_JSONL"
python tools/validate_provider_jsonl.py --input "$RAW_JSONL" --output "$CLEAN_JSONL"
python tools/jsonl_to_import_csv.py --input "$CLEAN_JSONL" --output "$IMPORT_CSV"

RAW_COUNT=$(line_count "$RAW_JSONL")
CLEAN_COUNT=$(line_count "$CLEAN_JSONL")
IMPORT_COUNT=$(( $(line_count "$IMPORT_CSV") - 1 ))
[[ "$IMPORT_COUNT" -lt 0 ]] && IMPORT_COUNT=0

echo ""
echo "=== Pipeline summary ==="
echo "Source tag:   $SOURCE_TAG"
echo "Raw JSONL:    $RAW_JSONL ($RAW_COUNT rows)"
echo "Clean JSONL:  $CLEAN_JSONL ($CLEAN_COUNT rows)"
echo "Import CSV:   $IMPORT_CSV ($IMPORT_COUNT rows)"

if [[ -n "${API_BASE:-}" ]]; then
  if [[ "$IMPORT_COUNT" -gt 0 ]]; then
    python tools/post_import_csv.py --csv "$IMPORT_CSV" --api-base "$API_BASE" --source-tag "$SOURCE_TAG"
  else
    echo "Skipping API import because the CSV has no rows"
  fi
else
  echo "Next: set API_BASE and run tools/post_import_csv.py, or manually POST the CSV text to /api/provider-sources/import with sourceTag=$SOURCE_TAG"
fi
