---
title: Seurch Documentation
type: docs
bookToc: false
---

# Seurch Documentation

**Seurch** is a privacy-first [metasearch engine](https://en.wikipedia.org/wiki/Metasearch_engine):
one query blends the best results from several independent sources into a single
clean, fast page, with no tracking, no ads and no profiling. Its search engine
is open source, so anyone can audit how it works or run their own copy.

These docs cover three audiences:

### [User guide]({{< relref "/user-guide" >}})

Everything you need to get the most out of Seurch: searching the web, the
Images / News / Videos / Maps / Translate tabs, instant answers, knowledge
cards, bangs and per-account settings.
→ Start with [Getting started]({{< relref "/user-guide/getting-started" >}}).

### [Self-hosting guide]({{< relref "/self-hosting" >}})

Run your own Seurch instance. Requirements, a Docker quick start, every
configuration option, wiring up search providers, creating users and issuing
API keys, plus production and maintenance notes.
→ Start with [Quick start]({{< relref "/self-hosting/quick-start" >}}).

### [API guide]({{< relref "/api" >}})

Use every Seurch search feature programmatically over a JSON API:
authentication, rate limits and a reference for each endpoint, with copy-paste
`curl` and Python examples.
→ Start with [the API overview]({{< relref "/api" >}}).

## What Seurch does

- **Web search across four engines**, Brave, Mojeek, Marginalia and Staan. Enable any
  subset; when more than one is active their result lists are merged with
  Reciprocal Rank Fusion and deduplicated, so a result several engines agree on
  rises to the top.
- **Images, News, Videos, Maps and Translate** tabs, each backed by independent
  providers.
- **Instant answers** above the results, a calculator, unit and currency
  conversion, weather, world clock, QR codes, hashes and more, most computed
  locally on the server.
- **Knowledge cards** beside the results, from Wikipedia, TheTVDB, TripAdvisor and
  Stack Exchange.
- **Per-account settings** that sync across devices, with export and import.
- A **public JSON API** covering every one of those features.

## Privacy in one line

Seurch does not track you, show ads or build a profile. API keys for upstream
providers stay on the server and are never exposed to your browser, and queries
are sent to providers without identifying you.
