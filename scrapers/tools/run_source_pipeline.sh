#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <spider> <config> [source-tag]" >&2
  echo "Example: $0 clinic_directory sources/example_clinic_directory.json example-clinic-directory" >&2
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

python tools/check_source_config.py "$CONFIG"
scrapy crawl "$SPIDER" -a config="$CONFIG" -O "$RAW_JSONL"
python tools/validate_provider_jsonl.py --input "$RAW_JSONL" --output "$CLEAN_JSONL"
python tools/jsonl_to_import_csv.py --input "$CLEAN_JSONL" --output "$IMPORT_CSV"

echo "Pipeline complete"
echo "Raw JSONL:    $RAW_JSONL"
echo "Clean JSONL:  $CLEAN_JSONL"
echo "Import CSV:   $IMPORT_CSV"
echo "Source tag:   $SOURCE_TAG"
echo "Next: POST the CSV text to /api/provider-sources/import with sourceTag=$SOURCE_TAG"
