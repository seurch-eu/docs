---
title: Meta endpoints
weight: 8
---

# Meta endpoints

Helpers for autocomplete, provider health, key introspection and endpoint
discovery. The root, `status/` and `key/` **don't** count toward your monthly
search usage (they still count against the raw rate limit).

## Suggestions

Search-bar autocomplete suggestions for a query. *(Counts as a search.)*

```
GET /api/v1/suggest/?q=...
```

```bash
curl -H "Authorization: Api-Key seurch_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/suggest/?q=clim"
```

```json
{
  "query": "clim",
  "suggestions": ["climate", "climate change", "climbing"]
}
```

## Provider status

Current up/down status of each configured upstream provider, the data behind the
`/status` page. *(Does not count toward usage.)*

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

- `monitor` — how the status was determined: `query` (observed from real
  searches) or `probe` (active health check).
- `state` — `up`, `down`, or `unknown` (nothing observed yet).

A provider with no API key configured is omitted (hidden, not shown as down).

## Key info

Details of the key making the request, handy to verify a key works. *(Does not
count toward usage.)*

```
GET /api/v1/key/
```

```json
{
  "name": "my script",
  "prefix": "seurch_sk_1a2b3c4d",
  "created_at": "2026-06-01T10:00:00Z",
  "last_used_at": "2026-06-30T09:15:00Z",
  "revoked": false
}
```

The secret is never returned, only the prefix and metadata.

## API root

An index of every available endpoint (absolute URLs), useful for discovery.
*(Does not count toward usage.)*

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
