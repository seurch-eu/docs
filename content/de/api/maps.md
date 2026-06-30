---
title: Karten
weight: 5
---

# Karten

Geokodieren Sie einen Ortsnamen oder führen Sie eine umgekehrte Geokodierung eines Koordinatenpaars durch, unter Verwendung von OpenStreetMaps Nominatim. Kein Anbieter-Schlüssel erforderlich.

```
GET /api/v1/maps/
```

## Einen Ortsnamen geokodieren

```
GET /api/v1/maps/?q=<ort>&limit=<n>&lang=<code>
```

- `q` — der Ort oder die Adresse zum Nachschlagen (**erforderlich** in diesem Modus).
- `limit` — maximale Anzahl Ergebnisse, `1`–`50` (Standard `10`).
- `lang` — bevorzugte Sprache für Namen.

```bash
curl -H "Authorization: Api-Key searpa_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/maps/?q=Brandenburger+Tor&limit=1"
```

```json
{
  "query": "Brandenburger Tor",
  "places": [
    {
      "name": "Brandenburger Tor",
      "display_name": "Brandenburger Tor, Berlin, Deutschland",
      "lat": 52.5163,
      "lon": 13.3777,
      "category": "tourism",
      "type": "attraction",
      "addresstype": "tourism",
      "importance": 0.85,
      "embed_url": "https://www.openstreetmap.org/export/embed.html?...",
      "mini_embed_url": "https://...",
      "osm_url": "https://www.openstreetmap.org/...",
      "directions_url": "https://www.openstreetmap.org/directions?...",
      "geo_uri": "geo:52.5163,13.3777"
    }
  ]
}
```

## Koordinaten umgekehrt geokodieren

Übergeben Sie `lat` und `lon` anstelle von `q`:

```
GET /api/v1/maps/?lat=52.5163&lon=13.3777
```

- `lat`, `lon` — die umzukehrenden Koordinaten (beide für diesen Modus erforderlich).
- `label` (oder `q`) — ein optionaler Name, der dem zurückgegebenen Ort angehängt wird.

```json
{
  "query": "",
  "places": [
    { "name": "...", "display_name": "...", "lat": 52.5163, "lon": 13.3777, "...": "..." }
  ]
}
```

Jeder Ort enthält fertige `embed_url` / `mini_embed_url` (für eine eingebettete Karte), `osm_url`, `directions_url` und eine `geo_uri`, sodass Sie direkt zu einer Karte oder Wegbeschreibungen verlinken können.
