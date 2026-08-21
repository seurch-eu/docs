---
title: Search providers
weight: 4
---

# Search providers

Seurch blends results from several independent providers. **Which tabs and cards
appear depends on which keys you set.** A provider with no key is hidden, the
affected tab or card simply doesn't show, rather than displaying an error.

All upstream calls happen **server-side**; keys are never exposed to the browser.

This page is the **overview** of which key enables what. For step-by-step signup
instructions for each provider, see
[Getting API keys]({{< relref "provider-keys" >}}).

## The baseline: Brave

| Variable | Get a key |
|----------|-----------|
| `BRAVE_API_KEY` | [brave.com/search/api](https://brave.com/search/api/) (free tier available) |
| `BRAVE_SUGGEST_API_KEY` | Same place, a **separate** subscription for autocomplete |

Brave is the recommended starting point: a single key powers the **Web, Images,
News and Videos** tabs. Without any web engine configured, those tabs show a
configuration notice instead of results.

## Extra web engines

Add any of these to blend more independent indexes into the Web tab (merged
with Reciprocal Rank Fusion, see [Web search]({{< relref "/user-guide/web-search" >}})):

| Variable | Provider | Get a key |
|----------|----------|-----------|
| `MOJEEK_API_KEY` | Mojeek (independent UK index) | [mojeek.com/services/search/api](https://www.mojeek.com/services/search/api/) |
| `MARGINALIA_API_KEY` | Marginalia (small-web index) | No signup, the literal value `public` is a free shared key (rate-limited to ~1 request / 5 s). For a higher quota, request one at [marginalia-search.com](https://about.marginalia-search.com/article/api/) |
| `STAAN_API_KEY` | Staan (European index, by Qwant and Ecosia) | [staan.ai](https://staan.ai/) — 1,000 free requests a month, then from EUR 1 per 1,000. Caps out after the first four pages of a search |

## Media providers

Each media tab blends Brave with a second provider. The supplementary provider is
also the **sole** source for the web-only engines (Mojeek, Marginalia and Staan),
which have no media search of their own.

| Tab | Variable | Provider | Key |
|-----|----------|----------|-----|
| Images | `PIXABAY_API_KEY` | [Pixabay](https://pixabay.com/api/docs/) | Free |
| News | `WORLDNEWS_API_KEY` | [World News API](https://worldnewsapi.com/) | Free tier |
| Videos | *(none)* | [Sepia](https://sepiasearch.org/) / PeerTube | No key required |

**Maps** needs no key at all, it uses OpenStreetMap's Nominatim.

## Knowledge-card providers

The web tab can show up to three side [knowledge cards]({{< relref "/user-guide/knowledge-cards" >}}):

| Card | Variable | Provider | Key |
|------|----------|----------|-----|
| Wikipedia | *(none)* | Wikipedia / Wikidata | No key required |
| Film / TV | `THETVDB_API_KEY` (+ `THETVDB_PIN`) | [TheTVDB](https://www.thetvdb.com/dashboard/account/apikey) | Commercial licence, or a user-supported key plus the subscriber PIN |
| Places | `TRIPADVISOR_API_KEY` | [TripAdvisor Content API](https://www.tripadvisor.com/developers) | Free |
| Q&A | `STACKEXCHANGE_API_KEY` | [Stack Exchange](https://stackapps.com/apps/oauth/register) | Optional, raises the shared anonymous quota |

The paid card APIs are only called when a query actually looks like a film or a
place, and each lookup is cached for an hour, so call volume stays low, well
inside TripAdvisor's free tier and modest against a TheTVDB licence.

## Provider status page

A built-in **`/status`** page shows whether each configured provider is up. It
never spends paid quota to find out:

- Providers with a **free health endpoint** (Nominatim, LibreTranslate,
  Open-Meteo, Frankfurter) are probed on a schedule.
- Every other provider's status is inferred from whether **real searches**
  recently succeeded.

Keep the status fresh by running `check_provider_health` periodically, see
[Maintenance]({{< relref "maintenance" >}}).

## Network allowlist

If your server's outbound traffic is restricted, the two **instant-answer**
network calls need these hosts allowed:

- `api.frankfurter.dev` (currency rates)
- `geocoding-api.open-meteo.com` and `api.open-meteo.com` (weather)

Everything else is reached over standard HTTPS to each provider's API host. The
local instant answers (maths, units, hashes, …) need no network at all.
