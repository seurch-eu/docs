---
title: Settings
weight: 7
---

# Settings

Open **Settings** from the home page or the menu to tailor Seurch to you. Your
preferences **sync to your account** automatically and are restored on any
device you sign in on. They are also stored in your browser, so they apply even
before you sign in.

## What you can change

| Setting | Options | Default |
|---------|---------|---------|
| **Engines** | Per search type, any mix of the providers that type can use | Everything the instance has configured |
| **Safe search** | On / Off | On |
| **Search language** | Auto, or one of the seven UI languages | Auto (your browser) |
| **Interface language** | Auto, or one of the seven UI languages | Auto |
| **Theme** | System / Light / Dark | System |
| **Open links** | Same tab / New tab | Same tab |
| **Similar images** | On / Off | On |
| **Proxy images** | On / Off | Off |

### Engines

**Settings → Engines** is where you pick the providers behind each kind of
search. It is grouped by **search type**, Web, Images, News, Videos, Maps and
Translate, and **each search type keeps its own selection**, so an engine can
power your web results without touching Images or News. Results from every
provider enabled for a search type are interleaved and deduplicated.

Within a search type the providers are split into:

- **Search engines**, the ones that produce that type's results: the four
  [web engines]({{< relref "web-search" >}}) on Web, and Brave plus one
  supplementary provider on each media tab (Pixabay for Images, the World News
  API for News, Sepia for Videos).
- **Data sources**, the ones that enrich them: the
  [knowledge cards]({{< relref "knowledge-cards" >}}) (Wikipedia, TheTVDB,
  TripAdvisor, Stack Exchange) and the weather instant answer.

Each toggle shows where the provider is operated from, an **Open source** badge
where the underlying project is open source, and a **Paid** badge where it is a
metered commercial API, so the cost of switching one on is visible where the
switch is.

By default every provider the instance has configured is enabled. On the hosted
service a new account instead starts on **Brave and Staan**, and the other
metered providers wait to be switched on.

> [!NOTE]
> Turning **everything** off for a search type hides that tab from the results
> page. Switch a provider back on and the tab comes back.

**Blocked sites** and **custom [bangs]({{< relref "bangs" >}})** have their own
sections in the settings sidebar.

### Languages

**Interface language** changes the Seurch UI; **search language** biases results
toward a language. Both default to *Auto*, which follows your browser. Seurch's
interface is available in English, French, German, Spanish, Italian, Portuguese
and Dutch.

### Theme and links

Choose a light, dark or system-following theme, and whether result links open in
the same tab or a new one.

### Proxy images

With **Proxy images** on, image thumbnails are fetched through the Seurch server
instead of directly from the source, so the source site never sees your browser.
It is off by default because it adds a little latency.

### Similar images

When you open an image result, Seurch shows a grid of visually similar pictures
beside it. Each of those lookups runs an image search of its own, so it counts
towards your monthly search total. Turn **Similar images** off to skip it
entirely.

## Backup & sync

Under **Settings → Backup & sync** you can:

- **Export** all your settings to a JSON file.
- **Import** them back on another instance or after a reset.

Because settings sync to your account, you normally don't need to do this by
hand, signing in on a new device restores them. Unbounded lists (your custom
bangs and blocked sites) are stored in the database against your account.
