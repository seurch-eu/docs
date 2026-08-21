---
title: Configuration
weight: 3
---

# Configuration

Seurch is configured entirely through **environment variables** (in production)
or a `.env` file (in development). The repository ships an `.env.example`
documenting every variable; this page is the reference.

## Core

| Variable | Purpose | Notes |
|----------|---------|-------|
| `SECRET_KEY` | Django secret key | **Required in production.** Long and random. |
| `DEBUG` | Debug mode | Keep **`False`** (the default) in production. |
| `ALLOWED_HOSTS` | Comma-separated hostnames the app will serve | e.g. `search.example.com`. |
| `DATABASE_URL` | PostgreSQL connection URL | e.g. `postgres://user:pass@host:5432/seurch`. |
| `LOG_LEVEL` | Logging verbosity | `DEBUG` / `INFO` / `WARNING` / `ERROR` (default `INFO`). |

## Search providers

These keys decide which engines, media tabs and knowledge cards are available.
A provider with no key is simply hidden (not shown as broken). Full details on
[Search providers]({{< relref "search-providers" >}}).

| Variable | Enables |
|----------|---------|
| `BRAVE_API_KEY` | Web, Images, News and Videos via Brave (the baseline). |
| `BRAVE_SUGGEST_API_KEY` | Autocomplete suggestions (a separate Brave subscription). |
| `MOJEEK_API_KEY` | The Mojeek web engine. |
| `MARGINALIA_API_KEY` | The Marginalia web engine (`public` works out of the box). |
| `STAAN_API_KEY` | The Staan web engine (European index, web results only). |
| `THETVDB_API_KEY` | The film / TV knowledge card (TheTVDB v4). |
| `THETVDB_PIN` | Subscriber PIN, only for a user-supported TheTVDB key. |
| `TRIPADVISOR_API_KEY` | The places knowledge card. |
| `STACKEXCHANGE_API_KEY` | A higher Stack Exchange quota for the Q&A card (optional). |
| `PIXABAY_API_KEY` | Pixabay images blended into the Images tab. |
| `WORLDNEWS_API_KEY` | World News API articles blended into the News tab. |

### The "Paid" badge

`PAID_PROVIDERS` decides which providers **Settings → Engines** marks with a
**Paid** badge, so a user can see which ones are metered commercial APIs before
switching them on. Leave it unset to use the app's own list (Brave, Mojeek,
Staan, World News); set it as a comma-separated list of provider keys when your
deployment is on different plans:

```
PAID_PROVIDERS=brave,mojeek,staan,worldnews
```

Names that aren't provider keys are ignored, so `PAID_PROVIDERS=none` badges
nothing. The badge is a label only, it never changes what a user may enable.

## Translation

| Variable | Purpose |
|----------|---------|
| `LIBRETRANSLATE_URL` | URL of your LibreTranslate instance. **Unset disables the Translate tab entirely.** |
| `LIBRETRANSLATE_API_KEY` | Only if your LibreTranslate requires a key (`LT_API_KEYS=true`). |
| `LIBRETRANSLATE_ORIGIN_COUNTRY` | Two-letter country code for the flag shown next to "Translate" in Settings (default `fr`). |

See [Translation]({{< relref "translation" >}}).

## Public API rate limits

Applied per API key (Django REST Framework throttle rates, `<number>/<period>`,
where period is `second` / `minute` / `hour` / `day`). Both limits apply
together. See the [API rate limits]({{< relref "/api/rate-limits" >}}) page.

| Variable | Purpose | Default |
|----------|---------|---------|
| `API_THROTTLE_BURST` | Short-term cap, shields upstream providers from a runaway client | `60/min` |
| `API_THROTTLE_SUSTAINED` | Daily volume cap | `5000/day` |

## Email (password reset)

Used only to send password-reset messages, see [Users & access]({{< relref "users" >}}).

| Variable | Purpose |
|----------|---------|
| `EMAIL_BACKEND` | Django email backend (SMTP, console, …). |
| `EMAIL_HOST` / `EMAIL_PORT` | SMTP server. |
| `EMAIL_USE_TLS` | `True` / `False`. |
| `EMAIL_HOST_USER` / `EMAIL_HOST_PASSWORD` | SMTP credentials. |
| `DEFAULT_FROM_EMAIL` | The "From" address on outgoing mail. |

For a quick test without a real SMTP server, set
`EMAIL_BACKEND=django.core.mail.backends.console.EmailBackend` to print emails to
the container log.

## Footer links

The footer ships **no** privacy policy, terms or legal notice by default, that
content is specific to whoever operates the instance and your jurisdiction. Add
your own as `Label=URL` pairs separated by commas:

```
FOOTER_LINKS=Privacy=https://example.com/privacy,Legal notice=https://example.com/legal
```

Leave `FOOTER_LINKS` unset to show no extra footer links.

## Source link and build info

| Variable | Purpose |
|----------|---------|
| `SOURCE_URL` | Repository linked from the footer's **Source** link. Point it at your own fork if you run a modified version. |
| `GIT_REF` | Git branch or tag shown next to the copyright in the footer. |
| `GIT_SHA` | Commit hash shown next to the copyright, so a deployment can be traced back to the exact build. |

The Docker image sets `GIT_REF` and `GIT_SHA` automatically at build time, only
set them by hand for other deployment methods.
