---
title: Meta-Endpunkte
weight: 8
---

# Meta-Endpunkte

Hilfsprogramme für Autocomplete, Anbieter-Gesundheit, Schlüssel-Inspektion und Endpunkt-Entdeckung. Die Wurzel, `status/` und `key/` zählen **nicht** zu Ihrer monatlichen Such-Nutzung (sie zählen noch gegen das rohe Ratenlimit).

## Vorschläge

Autocomplete-Vorschläge der Suchleiste für eine Anfrage. *(Zählt als eine Suche.)*

```
GET /api/v1/suggest/?q=...
```

```bash
curl -H "Authorization: Api-Key searpa_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/suggest/?q=klim"
```

```json
{
  "query": "klim",
  "suggestions": ["klima", "klimawandel", "klimaschutz"]
}
```

## Anbieterstatus

Aktueller Aufwärts-/Abwärtsstatus jedes konfigurierten vorgelagerten Anbieters, die Daten hinter der `/status`-Seite. *(Zählt nicht zur Nutzung.)*

```
GET /api/v1/status/
```

```json
{
  "providers": [
    {
      "slug": "brave",
      "name": "Brave",
      "group": "web",
      "monitor": "query",
      "state": "up",
      "checked_at": "2026-06-30T09:00:00Z",
      "last_ok_at": "2026-06-30T09:00:00Z",
      "last_error": "",
      "source": ""
    }
  ]
}
```

- `monitor` — wie der Status ermittelt wurde: `query` (aus echten Suchen beobachtet) oder `probe` (aktive Gesundheitsprüfung).
- `state` — `up`, `down` oder `unknown` (noch nichts beobachtet).

Ein Anbieter ohne konfigurierten API-Schlüssel wird ausgelassen (ausgeblendet, nicht als ausgefallen angezeigt).

## Schlüssel-Info

Details des Schlüssels, der die Anfrage stellt, nützlich um zu überprüfen, ob ein Schlüssel funktioniert. *(Zählt nicht zur Nutzung.)*

```
GET /api/v1/key/
```

```json
{
  "name": "mein Skript",
  "prefix": "searpa_sk_1a2b3c4d",
  "created_at": "2026-06-01T10:00:00Z",
  "last_used_at": "2026-06-30T09:15:00Z",
  "revoked": false
}
```

Das Geheimnis wird nie zurückgegeben, nur das Präfix und die Metadaten.

## API-Wurzel

Ein Index jedes verfügbaren Endpunkts (absolute URLs), nützlich zur Entdeckung. *(Zählt nicht zur Nutzung.)*

```
GET /api/v1/
```

```json
{
  "web_search": "https://search.example.com/api/v1/web/",
  "image_search": "https://search.example.com/api/v1/images/",
  "similar_image_search": "https://search.example.com/api/v1/images/similar/",
  "news_search": "https://search.example.com/api/v1/news/",
  "video_search": "https://search.example.com/api/v1/videos/",
  "maps": "https://search.example.com/api/v1/maps/",
  "translate": "https://search.example.com/api/v1/translate/",
  "translate_languages": "https://search.example.com/api/v1/translate/languages/",
  "instant": "https://search.example.com/api/v1/instant/",
  "cards": "https://search.example.com/api/v1/cards/",
  "suggest": "https://search.example.com/api/v1/suggest/",
  "status": "https://search.example.com/api/v1/status/",
  "key": "https://search.example.com/api/v1/key/"
}
```
