#!/usr/bin/env bash
# Refresh the data files from the main repo after running
#   node --experimental-strip-types scripts/export-research-datasets.mjs
# there. The README figures are regenerated separately.
set -euo pipefail
SRC="${1:-$HOME/namesniper/public/datasets}"
cp "$SRC"/telegram-*.csv telegram/
cp "$SRC"/kick-*.csv kick/
cp "$SRC"/username-rules.json "$SRC"/drop-policies.json username-rules/
if ls "$SRC"/roblox-*.csv >/dev/null 2>&1; then cp "$SRC"/roblox-*.csv roblox/; fi
echo "synced from $SRC"
