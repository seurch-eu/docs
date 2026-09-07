---
title: Instant & cards
weight: 7
---

# Instant answers & knowledge cards

These two endpoints mirror the website's inline answers and side panels. Because
their content varies by answer type and provider, they return **provider-shaped
JSON** rather than a fixed per-field schema, treat the structures as data and
read the fields you need.

## Instant answers

```
GET /api/v1/instant/?q=...
```

Returns the instant answer for a utility query (maths, unit/base/colour
conversion, weather, currency, world clock, hashes, QR, "what's my IP", …), or
`null` when the query isn't one Seurch answers inline.

```bash
curl -H "Authorization: Api-Key seurch_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/instant/?q=100+usd+to+eur"
```

```json
{
  "query": "100 usd to eur",
  "answer": {
    "type": "currency",
    "...": "..."
  }
}
```

When there's no instant answer:

```json
{ "query": "some random phrase", "answer": null }
```

The `answer` object's shape depends on the answer `type` (currency, weather,
calculator, unit, …). See the [user-facing list]({{< relref "/user-guide/instant-answers" >}})
for what can match, and note that triggers are multilingual.

## Knowledge cards

```
GET /api/v1/cards/?q=...
```

Returns the knowledge panel for a query, derived from the same web + Wikipedia
context the website uses. Accepts `lang`, `safe` and `engine`.

```json
{
  "query": "inception",
  "wikipedia": { "...": "..." },
  "thetvdb": { "...": "..." },
  "tripadvisor": null,
  "stackexchange": null,
  "map": null
}
```

Each card is `null` when it doesn't apply to the query (only the relevant cards
are populated, the same logic as the website, so a film query fills `thetvdb`, a
place query fills `tripadvisor` and `map`, and so on). Card availability also
depends on which [providers]({{< relref "/self-hosting/search-providers#knowledge-card-providers" >}})
the instance has configured.

The `tripadvisor` card carries `name`, `geo`, `address`, `latitude`,
`longitude`, `rating`, `rating_bubbles`, `num_reviews`, `description` and `url`.
It no longer carries `photo`, `location_type`, `cuisine`, `subcategory`,
`price_level` or `ranking`: those came from TripAdvisor's retired Content API,
and its replacement only serves them to individually licensed partners.

> [!NOTE]
> A single `cards/` request runs a web search plus a Wikipedia lookup behind the
> scenes (to detect the subject), so it counts as one search toward your usage.
