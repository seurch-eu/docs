---
title: Monitoring
weight: 10
---

# Monitoring

Seurch exposes its health at three levels, and they answer different questions.
Monitor at least the first two: together they tell "the app is down" apart from
"the app is up, an upstream provider is down".

| Endpoint | Question it answers | Audience |
|----------|---------------------|----------|
| `/up` | Is the application process serving? | Your orchestrator's liveness probe |
| `/status/health` | Are the upstream providers working? | An external uptime monitor |
| `/status` | Which provider is down, and since when? | Signed-in users |

## Application liveness — `/up`

Answered before host validation, so it works from inside the container network,
see [Production notes]({{< relref "production#health-check" >}}). It knows
nothing about providers: an instance whose every provider is failing still
answers `200` here, because the app itself is fine.

## Provider health — `/status/health`

The machine-readable sibling of the [status page](#the-status-page), for an
external uptime service such as [phare.io](https://phare.io), Better Stack or
Uptime Kuma. It answers **200** while everything it watches is up and **500**
as soon as something is down, which is what those services alert on.

```
GET /status/health   →  200 OK
```

```json
{ "status": "ok", "watched": 8, "operational": 6, "down": [], "unknown": 2 }
```

| Situation | Response |
|-----------|----------|
| Every watched provider up (or not yet observed) | **200** `{"status": "ok", …}` |
| One or more watched providers down | **500** `{"status": "down", "down": ["brave"], …}` |
| Database unreachable | **500** `{"status": "error", "detail": "database unavailable"}` |
| `STATUS_MONITOR_PROVIDERS` matches nothing | **500** `{"status": "error", "detail": "no providers watched"}` |
| Disabled with `STATUS_MONITOR_ENABLED=false` | **404** |
| Wrong or missing `STATUS_MONITOR_TOKEN` | **403** |

Both `/status/health` and `/status/health/` answer, so a monitor configured
without the trailing slash is never bounced through a redirect.

### One check per provider

`/status/health/<provider>` answers for a single upstream, so your monitoring
service can hold a separate check per service and an alert names *what* broke
rather than "something did".

```
GET /status/health/brave   →  200 OK
```

```json
{
  "status": "ok",
  "provider": "brave",
  "state": "up",
  "checked_at": "2026-09-01T09:00:00Z",
  "last_ok_at": "2026-09-01T09:00:00Z"
}
```

| Situation | Response |
|-----------|----------|
| Provider up | **200** `"state": "up"` |
| Provider down | **500** `"state": "down"` |
| Never observed yet | **200** `"state": "unknown"` |
| Not configured here, or an unknown name | **404** |

One URL per provider:

| Provider | Endpoint |
|----------|----------|
| Brave | `/status/health/brave` |
| Mojeek | `/status/health/mojeek` |
| Marginalia | `/status/health/marginalia` |
| Staan | `/status/health/staan` |
| Pixabay | `/status/health/pixabay` |
| Sepia | `/status/health/sepia` |
| World News API | `/status/health/worldnews` |
| Wikipedia | `/status/health/wikipedia` |
| Wikidata | `/status/health/wikidata` |
| TheTVDB | `/status/health/thetvdb` |
| TripAdvisor | `/status/health/tripadvisor` |
| Stack Exchange | `/status/health/stackexchange` |
| Open-Meteo (weather) | `/status/health/weather` |
| Frankfurter (currency) | `/status/health/currency` |
| OpenStreetMap / Nominatim | `/status/health/openstreetmap` |
| LibreTranslate | `/status/health/translate` |

A provider you haven't configured returns **404**, not 200: there is nothing to
report, and a green check for a provider that isn't even wired up would be worse
than an obviously broken one. So set up checks only for the providers you
actually run.

### Choosing what the roll-up watches

`STATUS_MONITOR_PROVIDERS` narrows `/status/health` to the providers worth
paging someone about. It takes provider slugs (the table above) and/or the group
keys `engine`, `media`, `cards`, `instant`, `maps` and `translate`:

```
# Page only for the search engines themselves
STATUS_MONITOR_PROVIDERS=engine

# The engines plus geocoding
STATUS_MONITOR_PROVIDERS=engine,openstreetmap
```

Leave it empty (the default) to watch every configured provider. Names that
match nothing are ignored, so one typo doesn't drop the rest of your list — but
if *none* of them match, the endpoint reports that as an error rather than an
all-clear, because a monitor stuck green on a typo is worse than no monitor.

This scopes the roll-up only. Each `/status/health/<provider>` endpoint names
its provider and always answers for it.

### Requiring a token

The endpoints are **unauthenticated by design** — a monitoring service can't
sign in. Set `STATUS_MONITOR_TOKEN` to require a shared secret, sent any of
three ways:

```bash
curl "https://search.example.com/status/health?token=<secret>"
curl -H "X-Monitor-Token: <secret>" https://search.example.com/status/health
curl -H "Authorization: Bearer <secret>" https://search.example.com/status/health
```

Anything wrong gets a `403`. `STATUS_MONITOR_ENABLED=false` removes the
endpoints altogether (`404`).

### What the answers do and don't say

- **Unknown is not down.** Most providers only report in when someone searches,
  so one that has never been observed counts as neither up nor down. Only a
  recorded failure turns a check red, otherwise a quiet instance could never go
  green.
- **A database error is an outage.** If the status rows can't be read, the
  endpoint answers 500 — an instance that can't reach PostgreSQL can't serve a
  search either.
- **They say what, not why.** The body names the providers that are down; the
  upstream error text stays on the status page, behind a login.
- Every reply is JSON (including the 404s) and carries `Cache-Control:
  no-store`, so no proxy serves a stale verdict.

## The status page

`/status` is the human-facing view of the same data: one row per configured
provider, how its state was determined, and when it was last seen working. It
is linked from the site footer and from **Settings → Provider status**, and
requires a login.

It never spends paid quota to find out, see
[Search providers]({{< relref "search-providers#provider-status-page" >}}) for how
each provider's state is established, and [Maintenance]({{< relref "maintenance" >}})
for the probe schedule that keeps it current.

### Turning it off

Set `STATUS_PAGE_ENABLED=false` if you would rather not publish which providers
your instance uses and when they fail. Then:

- `/status` returns **404**, and the footer and Settings links to it disappear.
- The API's [`status/`]({{< relref "/api/meta#provider-status" >}}) endpoint,
  which serves the same data, returns 404 too, and drops out of the API root
  index.
- Health is still **recorded** and still readable, in the database and through
  the monitoring endpoints above.

> [!NOTE]
> `STATUS_MONITOR_ENABLED` is independent of `STATUS_PAGE_ENABLED` — that's the
> point. An instance that doesn't publish the page can still be monitored.

## Settings summary

| Variable | Purpose | Default |
|----------|---------|---------|
| `STATUS_PAGE_ENABLED` | Publish the `/status` page and the API's `status/` endpoint | `true` |
| `STATUS_MONITOR_ENABLED` | Serve `/status/health` and `/status/health/<provider>` | `true` |
| `STATUS_MONITOR_TOKEN` | Shared secret for those endpoints | *(empty, open)* |
| `STATUS_MONITOR_PROVIDERS` | Which providers the roll-up watches | *(empty, all configured)* |
