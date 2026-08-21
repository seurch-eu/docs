---
title: Rate limits
weight: 2
---

# Rate limits

Each API key has its own budget, enforced by **two limits that apply together**.
A request must satisfy both:

| Limit | Default | Purpose |
|-------|---------|---------|
| **Burst** | `60/min` | Short-term cap, protects upstream providers from a runaway client. |
| **Sustained** | `5000/day` | Caps total daily volume. |

On a self-hosted instance these are configurable with `API_THROTTLE_BURST` and
`API_THROTTLE_SUSTAINED`, see
[Configuration]({{< relref "/self-hosting/configuration#public-api-rate-limits" >}}).

## When you exceed a limit

Exceeding either limit returns:

```
HTTP 429 Too Many Requests
```

```json
{ "detail": "Request was throttled. Expected available in 12 seconds." }
```

DRF includes a `Retry-After` hint in the message; back off and retry after the
indicated time. A robust client should handle `429` with exponential backoff.

## Usage counting

Each **search** request counts toward the key owner's monthly search total (the
same total shown for website searches in Settings). A **web** search counts once
per engine it queries, so a four-engine query adds four; every other endpoint
counts as one. This includes:

`web/`, `images/`, `images/similar/` (only when a real search runs), `news/`,
`videos/`, `maps/`, `translate/`, `translate/languages/`, `instant/`, `cards/`
and `suggest/`.

The **meta** endpoints do **not** count toward usage:

- The API root (`/api/v1/`)
- `status/`
- `key/`

So you can poll `key/` or `status/` freely to check health without spending your
search budget (they still count against the raw rate limit).
