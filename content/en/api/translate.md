---
title: Translate
weight: 6
---

# Translate

Translate text between languages, powered by the instance's LibreTranslate. This
endpoint accepts **GET or POST**, use POST to keep long text out of the URL and
logs.

```
GET  /api/v1/translate/
POST /api/v1/translate/
```

## Translate text

| Parameter | Required | Meaning |
|-----------|----------|---------|
| `q` (or `text`) | yes | The text to translate |
| `target` | yes | Target language code (e.g. `fr`) |
| `source` | no | Source language code; defaults to `auto` (detect) |

```bash
# GET
curl -H "Authorization: Api-Key seurch_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/translate/?q=hello&target=fr"

# POST (better for long text)
curl -X POST -H "Authorization: Api-Key seurch_sk_<prefix>.<secret>" \
  -d "q=hello world" -d "target=fr" \
  "https://search.example.com/api/v1/translate/"
```

```json
{
  "source": "auto",
  "target": "fr",
  "translated_text": "bonjour le monde",
  "detected_lang": "en"
}
```

- `detected_lang` is filled only when `source` was `auto` (otherwise empty).
- If translation isn't configured on the instance, the endpoint returns
  **`503`** with `{"detail": "Translation is unavailable or not configured on this deployment."}`.

## List available languages

```
GET /api/v1/translate/languages/
```

```json
{
  "languages": [
    { "code": "en", "name": "English" },
    { "code": "fr", "name": "French" }
  ]
}
```

The list reflects whatever the connected LibreTranslate instance offers, see
[Translation]({{< relref "/self-hosting/translation" >}}) for the self-hosting
side.
