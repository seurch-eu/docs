---
title: Translation
weight: 5
---

# Translation (LibreTranslate)

The **Translate** tab is powered by [LibreTranslate](https://libretranslate.com/),
an open-source, self-hostable machine-translation server. Searpa calls it
server-side, no third-party translation service is involved.

## Enabling the tab

Point Searpa at a LibreTranslate instance with `LIBRETRANSLATE_URL`:

```
LIBRETRANSLATE_URL=http://libretranslate:5000
```

- **Set** it and the Translate tab (and its setting) appear, with whatever
  languages that instance offers.
- **Leave it unset** and the Translate tab and its setting are disabled
  entirely.

## Running LibreTranslate

The development stack starts a local LibreTranslate automatically (`make up`
brings one up at `http://localhost:5000`). For production, run your own, for
example:

```yaml
services:
  libretranslate:
    image: libretranslate/libretranslate
    ports:
      - "5000:5000"
```

Then set `LIBRETRANSLATE_URL` to its address (use the internal service name if
both run in the same Docker network).

## Optional settings

| Variable | When you need it |
|----------|------------------|
| `LIBRETRANSLATE_API_KEY` | Only if your LibreTranslate enforces keys (`LT_API_KEYS=true`). |
| `LIBRETRANSLATE_ORIGIN_COUNTRY` | Two-letter country code for the flag shown beside "Translate" in **Settings → Engines → Data sources** (default `fr`). The instance can be hosted anywhere; this is cosmetic. |

## Status

LibreTranslate exposes a free `/languages` endpoint, so Searpa's
[`/status`]({{< relref "search-providers#provider-status-page" >}}) page probes
it directly and reports whether translation is currently available.
