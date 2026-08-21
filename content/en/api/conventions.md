---
title: Conventions
weight: 3
---

# Conventions

## Shared query parameters

The search endpoints accept a common set of parameters. Each maps to an option
the website keeps in its preferences cookie, here they're explicit in the URL.

| Parameter | Applies to | Values | Default |
|-----------|-----------|--------|---------|
| `q` | all search endpoints | The query string (**required**) | — |
| `engine` | web, images, news, videos, cards | `brave`, `mojeek`, `marginalia`, `staan`, or `all`; comma/space-separate several | `all` |
| `safe` | web, images, news, videos, cards | `on` / `off` (`off`, `false`, `0`, `no` all mean off) | `on` |
| `lang` | most endpoints | A language code, e.g. `en`, `fr` | empty (auto) |
| `page` | web, images, news, videos | Page number, `1`–`50` | `1` |
| `date` | web, news, videos | Time range: `d` (day), `w` (week), `m` (month), `y` (year) | none |

Notes:

- **`engine`** — an unknown engine name returns `400` with the list of valid
  names. Media tabs blend their supplementary provider (Pixabay / World News /
  Sepia) on top of Brave; for the web-only engines (`mojeek`, `marginalia` and
  `staan`) that supplementary provider is the sole media source.
- **`page`** — values above `50` are clamped to `50` (keeps a client from walking
  a provider into the ground), values below `1` clamp to `1`.

## Response shape

Every endpoint returns JSON. Search endpoints echo back the request context
alongside the `results`, so a response is self-describing:

```json
{
  "query": "climate",
  "tab": "web",
  "page": 1,
  "engine": ["brave", "mojeek", "marginalia", "staan"],
  "correction": "",
  "results": [ /* ... */ ]
}
```

- `query` — the query as Seurch interpreted it.
- `tab` — which kind of search ran.
- `engine` — the engines actually queried (after resolving `all` / defaults).
- `correction` — a spelling suggestion for the query, or `""` (web only).
- `results` — the array of results (shape depends on the endpoint).

Knowledge cards and instant answers are returned as **provider-shaped JSON**
(their structure varies by provider / answer type), so those endpoints don't use
a fixed per-field schema, see [Instant & cards]({{< relref "instant-cards" >}}).

## HTTP methods

All endpoints are **`GET`**, except `translate/`, which also accepts **`POST`**
so long text stays out of the URL and logs.
