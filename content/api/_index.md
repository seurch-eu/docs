---
title: API
weight: 30
bookCollapseSection: true
---

# API guide

Every Searpa search feature, web, images, news, videos, maps, translate, instant
answers, knowledge cards, suggestions and provider status, is available
programmatically over a JSON API. The same service functions back the API and
the website, so both always return the same results.

The API is built with [Django REST Framework](https://www.django-rest-framework.org/)
and mounted under **`/api/v1/`**.

## Base URL

```
https://searpa.io/api/v1/
```

Replace the host with your own instance if you self-host. All examples below use
the hosted host; swap it for yours.

## At a glance

- **Authentication:** every request needs a per-user [API key]({{< relref "authentication" >}}).
- **Stateless:** the options the website keeps in a cookie (engine, safe search,
  language, time range, page) are plain query parameters, so a request is fully
  described by its URL.
- **Rate limited:** per key, with a [burst and a daily cap]({{< relref "rate-limits" >}}).
- **JSON only:** every endpoint returns JSON.

## A first request

```bash
curl -H "Authorization: Api-Key searpa_sk_<prefix>.<secret>" \
  "https://searpa.io/api/v1/web/?q=climate&lang=en"
```

## In this guide

| Page | What it covers |
|------|----------------|
| [Authentication]({{< relref "authentication" >}}) | Getting and sending an API key |
| [Rate limits]({{< relref "rate-limits" >}}) | Burst / sustained limits, `429`, usage counting |
| [Conventions]({{< relref "conventions" >}}) | Shared query parameters and response shape |
| [Search endpoints]({{< relref "search" >}}) | `web/`, `images/`, `news/`, `videos/`, `images/similar/` |
| [Maps]({{< relref "maps" >}}) | Geocoding and reverse geocoding |
| [Translate]({{< relref "translate" >}}) | Translating text and listing languages |
| [Instant & cards]({{< relref "instant-cards" >}}) | Instant answers and knowledge cards |
| [Meta endpoints]({{< relref "meta" >}}) | `suggest/`, `status/`, `key/`, and the API root |
| [Errors]({{< relref "errors" >}}) | Status codes and error bodies |

> [!NOTE]
> The in-app developer page at **`/api/`** links to this documentation and to the
> key manager. An [Insomnia](https://insomnia.rest/) collection of the endpoints
> ships in the repository (`scripts/searpa-api.insomnia.json`).
