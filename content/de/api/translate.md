---
title: Übersetzen
weight: 6
---

# Übersetzen

Übersetzen Sie Text zwischen Sprachen, betrieben vom LibreTranslate der Instanz. Dieser Endpunkt akzeptiert **GET oder POST**; verwenden Sie POST, um langen Text aus der URL und den Logs herauszuhalten.

```
GET  /api/v1/translate/
POST /api/v1/translate/
```

## Text übersetzen

| Parameter | Erforderlich | Bedeutung |
|-----------|-------------|---------|
| `q` (oder `text`) | ja | Der zu übersetzende Text |
| `target` | ja | Zielsprachcode (z.B. `de`) |
| `source` | nein | Quellsprachcode; standardmäßig `auto` (erkennen) |

```bash
# GET
curl -H "Authorization: Api-Key searpa_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/translate/?q=hello&target=de"

# POST (besser für langen Text)
curl -X POST -H "Authorization: Api-Key searpa_sk_<präfix>.<geheimnis>" \
  -d "q=hello world" -d "target=de" \
  "https://search.example.com/api/v1/translate/"
```

```json
{
  "source": "auto",
  "target": "de",
  "translated_text": "hallo welt",
  "detected_lang": "en"
}
```

- `detected_lang` wird nur ausgefüllt, wenn `source` `auto` war (sonst leer).
- Wenn Übersetzung auf der Instanz nicht konfiguriert ist, gibt der Endpunkt **`503`** zurück mit `{"detail": "Translation is unavailable or not configured on this deployment."}`.

## Verfügbare Sprachen auflisten

```
GET /api/v1/translate/languages/
```

```json
{
  "languages": [
    { "code": "en", "name": "English" },
    { "code": "de", "name": "German" }
  ]
}
```

Die Liste spiegelt wider, was die verbundene LibreTranslate-Instanz anbietet; siehe [Übersetzung]({{< relref "/de/self-hosting/translation" >}}) für die Selbst-Hosting-Seite.
