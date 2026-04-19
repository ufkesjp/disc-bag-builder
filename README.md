# Disc Golf Bag Builder

A self-contained disc golf bag builder app. Search any disc from the DiscIt database, add it to your virtual bag, and see flight numbers, stability ratings, and RHBH flight path visualizations.

## How It Works

**Architecture:**
- `data/discs.json` — A snapshot of the entire DiscIt API database (~900+ discs). This is a static JSON file that gets loaded by the app on page load.
- `index.html` — The complete app in a single HTML file. Uses React via CDN, no build tools required.
- `scripts/fetch-discs.sh` — A script to refresh the disc database from the DiscIt API.

**Data flow:**
1. On page load, the app fetches `data/discs.json` (your local copy of the database)
2. All searching/filtering happens client-side in memory — instant results, no API calls
3. Your bag is saved to `localStorage` — persists between sessions in the same browser

## Setup

### Option 1: GitHub Pages (free)

1. Fork or clone this repo
2. Go to Settings → Pages → Source → Deploy from a branch → select `main` / `root`
3. Your app is live at `https://yourusername.github.io/disc-bag-builder/`

### Option 2: Any static hosting (Netlify, Vercel, S3, etc.)

Just deploy the entire folder. No build step needed.

### Option 3: Local

Open `index.html` in a browser. Search won't work due to CORS on local file:// URLs, so use a local server:

```bash
python3 -m http.server 8000
# then open http://localhost:8000
```

## Refreshing the Disc Database

The disc database is a static snapshot. To update it with the latest discs from DiscIt:

```bash
./scripts/fetch-discs.sh
```

This fetches from `https://discit-api.fly.dev/disc` and saves to `data/discs.json`. Commit and push the updated file.

## Credits

- Disc data from [DiscIt API](https://github.com/cdleveille/discit-api) (MIT License), sourced from [Marshall Street Disc Golf Flight Guide](https://www.marshallstreetdiscgolf.com/flightguide)
- Built with React 18 (via CDN)
