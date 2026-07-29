---
title: API
weight: 30
bookCollapseSection: true
---

# API guide

Every Seurch search feature, web, images, news, videos, maps, translate, instant
answers, knowledge cards, suggestions and provider status, is available
programmatically over a JSON API. The same service functions back the API and
the website, so both always return the same results.

The API is built with [Django REST Framework](https://www.django-rest-framework.org/)
and mounted under **`/api/v1/`**.

> [!IMPORTANT]
> The public API is a **self-hosted** feature. It ships with the open-source
> engine and is available on any instance you [run yourself]({{< relref "/self-hosting" >}}).
> The hosted service at [seurch.eu](https://seurch.eu/) does **not** expose it,
> so to use the API, run your own instance and create a key there.

## Base URL

```
https://search.example.com/api/v1/
```

The examples below use `search.example.com` as a stand-in, replace it with your
own instance's host.

## At a glance

- **Authentication:** every request needs a per-user [API key]({{< relref "authentication" >}}).
- **Stateless:** the options the website keeps in a cookie (engine, safe search,
  language, time range, page) are plain query parameters, so a request is fully
  described by its URL.
- **Rate limited:** per key, with a [burst and a daily cap]({{< relref "rate-limits" >}}).
- **JSON only:** every endpoint returns JSON.

## A first request

```bash
curl -H "Authorization: Api-Key seurch_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climate&lang=en"
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
> ships in the repository (`scripts/seurch-api.insomnia.json`).
