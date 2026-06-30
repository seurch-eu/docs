---
title: Search endpoints
weight: 4
---

# Search endpoints

The bread-and-butter endpoints: web, image, news and video search, plus the
"similar images" helper. All take the [shared parameters]({{< relref "conventions" >}})
(`q`, `engine`, `safe`, `lang`, `page`, `date`).

## Web search

```
GET /api/v1/web/?q=...
```

```bash
curl -H "Authorization: Api-Key searpa_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climate&engine=all&lang=en&date=w"
```

```json
{
  "query": "climate",
  "tab": "web",
  "page": 1,
  "engine": ["brave", "mojeek", "marginalia"],
  "correction": "",
  "results": [
    {
      "title": "Climate change",
      "url": "https://example.org/climate",
      "description": "...",
      "display_url": "example.org",
      "favicon_url": "https://...",
      "age": "2 days ago",
      "source": "all",
      "source_label": "Brave, Mojeek, Marginalia",
      "sitelinks": []
    }
  ]
}
```

- `source` / `source_label` — which engine(s) returned the result. `brave` /
  `mojeek` / `marginalia` for a single engine, or `both` / `all` for cross-engine
  agreement (`source_label` is the readable form).
- `correction` — a suggested spelling correction, or `""`.

## Image search

```
GET /api/v1/images/?q=...
```

```json
{
  "query": "golden retriever",
  "tab": "images",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://example.com/page",
      "source": "example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

### Similar images

Mirrors the website's lightbox "similar images" grid, an image search seeded
from an opened image's caption.

```
GET /api/v1/images/similar/?q=<caption>&query=<page-query>&exclude_url=<url>
```

- `q` — the opened image's caption (the primary seed).
- `query` — the page's query, used as a fallback seed.
- `exclude_url` — drops the opened image from the results.

Provide `q` and/or `query` (at least one). The response echoes the `seed` query
actually used:

```json
{
  "query": "golden retriever puppy",
  "engine": ["brave"],
  "results": [ { "title": "...", "url": "...", "source": "...", "thumbnail": "..." } ]
}
```

A real image search (and a usage count) only happens when a usable seed is found.

## News search

```
GET /api/v1/news/?q=...
```

```json
{
  "query": "elections",
  "tab": "news",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://news.example.com/article",
      "description": "...",
      "age": "3 hours ago",
      "source": "Example News",
      "hostname": "news.example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

## Video search

```
GET /api/v1/videos/?q=...
```

```json
{
  "query": "hugo tutorial",
  "tab": "videos",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://video.example.com/watch",
      "age": "1 month ago",
      "source": "...",
      "duration": "12:34",
      "hostname": "video.example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

> [!NOTE]
> Every result field carries a sensible empty default, so a provider that omits a
> field yields an empty value (e.g. `""` or `[]`) rather than a missing key.
