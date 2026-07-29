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
| **Engines** | Any mix of Brave / Mojeek / Marginalia | All enabled |
| **Safe search** | On / Off | On |
| **Search language** | Auto, or one of the seven UI languages | Auto (your browser) |
| **Interface language** | Auto, or one of the seven UI languages | Auto |
| **Theme** | System / Light / Dark | System |
| **Open links** | Same tab / New tab | Same tab |
| **Proxy images** | On / Off | Off |
| **Lazy-load knowledge cards** | On / Off | On |
| **Data sources** | Per-provider on/off toggles | All enabled |

### Engines

Pick which web indexes Seurch queries and blends, see
[Web search]({{< relref "web-search" >}}). This is also where you manage your
**blocked sites** and **custom [bangs]({{< relref "bangs" >}})**.

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

### Data sources

Fine-grained toggles for the supplementary providers, knowledge cards (Wikipedia,
TMDB, TripAdvisor, Stack Exchange), weather, Pixabay (images), Sepia (videos),
the World News API, Translate and OpenStreetMap. Turn off anything you don't want
Seurch to use.

## Backup & sync

Under **Settings → Backup & sync** you can:

- **Export** all your settings to a JSON file.
- **Import** them back on another instance or after a reset.

Because settings sync to your account, you normally don't need to do this by
hand, signing in on a new device restores them. Unbounded lists (your custom
bangs and blocked sites) are stored in the database against your account.
