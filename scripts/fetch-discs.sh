#!/bin/bash
# Fetches the full disc database from DiscIt API and saves it as a JSON file.
# Run this manually whenever you want to refresh the database:
#   ./scripts/fetch-discs.sh
#
# The output file (data/discs.json) should be committed to your repo.

set -e

echo "Fetching disc database from DiscIt API..."
mkdir -p data

curl -s "https://discit-api.fly.dev/disc" \
  -H "Accept: application/json" \
  -o data/discs.json

COUNT=$(python3 -c "import json; print(len(json.load(open('data/discs.json'))))" 2>/dev/null || echo "unknown")
echo "Saved $COUNT discs to data/discs.json"
echo "Done! Commit and push data/discs.json to update your app."
