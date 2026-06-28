#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <config> [config ...]" >&2
  echo "Example: $0 sources/example_clinic_directory.json sources/example_sitemap_directory.json" >&2
  echo "Optional: set API_BASE=http://localhost:8080/api to import each generated CSV" >&2
  exit 1
fi

for CONFIG in "$@"; do
  if [[ ! -f "$CONFIG" ]]; then
    echo "Missing config: $CONFIG" >&2
    exit 1
  fi

  SOURCE_TAG="$(python - <<'PY' "$CONFIG"
import json
import pathlib
import sys
path = pathlib.Path(sys.argv[1])
config = json.loads(path.read_text(encoding='utf-8'))
print(config.get('sourceTag') or path.stem)
PY
)"

  SPIDER="clinic_directory"
  if python - <<'PY' "$CONFIG"
import json
import pathlib
import sys
config = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding='utf-8'))
sys.exit(0 if config.get('sitemapUrls') else 1)
PY
  then
    SPIDER="sitemap_directory"
  fi

  echo "Running $SPIDER for $CONFIG as $SOURCE_TAG"
  bash tools/run_source_pipeline.sh "$SPIDER" "$CONFIG" "$SOURCE_TAG"
done
