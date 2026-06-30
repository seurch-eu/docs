---
title: Maps
weight: 5
---

# Maps

Geocode a place name or reverse-geocode a coordinate pair, using OpenStreetMap's
Nominatim. No provider key is required.

```
GET /api/v1/maps/
```

## Geocode a place name

```
GET /api/v1/maps/?q=<place>&limit=<n>&lang=<code>
```

- `q` — the place or address to look up (**required** in this mode).
- `limit` — max results, `1`–`50` (default `10`).
- `lang` — preferred language for names.

```bash
curl -H "Authorization: Api-Key searpa_sk_<prefix>.<secret>" \
  "https://searpa.io/api/v1/maps/?q=Eiffel+Tower&limit=1"
```

```json
{
  "query": "Eiffel Tower",
  "places": [
    {
      "name": "Eiffel Tower",
      "display_name": "Eiffel Tower, Paris, France",
      "lat": 48.8584,
      "lon": 2.2945,
      "category": "tourism",
      "type": "attraction",
      "addresstype": "tourism",
      "importance": 0.82,
      "embed_url": "https://www.openstreetmap.org/export/embed.html?...",
      "mini_embed_url": "https://...",
      "osm_url": "https://www.openstreetmap.org/...",
      "directions_url": "https://www.openstreetmap.org/directions?...",
      "geo_uri": "geo:48.8584,2.2945"
    }
  ]
}
```

## Reverse geocode coordinates

Pass `lat` and `lon` instead of `q`:

```
GET /api/v1/maps/?lat=48.8584&lon=2.2945
```

- `lat`, `lon` — the coordinates to reverse (both required for this mode).
- `label` (or `q`) — an optional name to attach to the returned place.

```json
{
  "query": "",
  "places": [
    { "name": "...", "display_name": "...", "lat": 48.8584, "lon": 2.2945, "...": "..." }
  ]
}
```

Each place includes ready-made `embed_url` / `mini_embed_url` (for an embedded
map), `osm_url`, `directions_url` and a `geo_uri`, so you can link straight out
to a map or directions.
