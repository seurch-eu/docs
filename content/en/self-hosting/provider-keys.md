---
title: Getting API keys
weight: 5
---

# Getting API keys

Step-by-step guides for obtaining each provider's key. None are required to boot
Seurch, but at least one **web engine** (Brave is the easiest) is needed for
useful results. Each provider you skip simply hides its tab or card, see
[Search providers]({{< relref "search-providers" >}}) for what each one enables.

Once you have a key, set the matching environment variable (see
[Configuration]({{< relref "configuration" >}})) and restart the app.

> [!NOTE]
> All of these have a **free tier** that is generous enough for a personal or
> small-team instance, Seurch caches aggressively and only calls the paid card
> APIs when a query actually matches. The shared keys (`public` for Marginalia,
> anonymous Stack Exchange) need no signup at all.

## Brave Search — `BRAVE_API_KEY`

Powers the **Web, Images, News and Videos** tabs from one key. This is the one
provider worth setting up first.

1. Go to the [Brave Search API](https://brave.com/search/api/) site and **sign
   up** for the API dashboard.
2. Add the **Data for Search** plan and pick the **Free** tier (it asks for a
   card to verify, but the free tier is not billed).
3. Open **API Keys** in the dashboard and **generate a key**.
4. Copy it into `BRAVE_API_KEY`.

## Brave Suggest (autocomplete) — `BRAVE_SUGGEST_API_KEY`

Enables search-bar autocomplete. This is a **separate subscription** from the
search key above, with its own key.

1. In the same [Brave API dashboard](https://brave.com/search/api/), subscribe to
   the **Autosuggest** plan (Free tier available).
2. Generate a key for that subscription.
3. Copy it into `BRAVE_SUGGEST_API_KEY`.

Leave it unset to run without autocomplete; everything else still works.

## Mojeek — `MOJEEK_API_KEY`

Adds the independent **Mojeek** web index to the Web tab.

1. Visit the [Mojeek Search API](https://www.mojeek.com/services/search/api/)
   page and **request API access** (a free tier is available).
2. Once approved, copy the key they issue.
3. Set it as `MOJEEK_API_KEY`.

## Marginalia — `MARGINALIA_API_KEY`

Adds the non-commercial, small-web **Marginalia** index. **No signup required.**

- The literal value **`public`** is a free shared key and is the default in
  `.env.example`, rate-limited to roughly **1 request every 5 seconds**.
- For a higher, non-shared quota, request a personal key on the
  [Marginalia API page](https://about.marginalia-search.com/article/api/).

```bash
MARGINALIA_API_KEY=public   # works out of the box
```

## Pixabay (images) — `PIXABAY_API_KEY`

Blends royalty-free **Pixabay** images into the Images tab.

1. Create a free account at [Pixabay](https://pixabay.com/).
2. While logged in, open the [Pixabay API docs](https://pixabay.com/api/docs/),
   your personal API key is shown at the top of that page.
3. Copy it into `PIXABAY_API_KEY`.

## World News API (news) — `WORLDNEWS_API_KEY`

Blends articles from the [World News API](https://worldnewsapi.com/) into the
News tab.

1. Sign up at [worldnewsapi.com](https://worldnewsapi.com/) (the free plan grants
   a daily points allowance).
2. Open your **account dashboard** and copy the **API key**.
3. Set it as `WORLDNEWS_API_KEY`.

## TMDB (film / TV card) — `TMDB_API_KEY`

Enables the film / TV [knowledge card]({{< relref "/user-guide/knowledge-cards" >}}).

1. Create a free account at [The Movie Database](https://www.themoviedb.org/).
2. Go to **Settings → API** ([direct link](https://www.themoviedb.org/settings/api))
   and request a **Developer** key (instant, free; you fill in a short form).
3. Copy the **API Key (v3 auth)** value into `TMDB_API_KEY`.

## TripAdvisor (places card) — `TRIPADVISOR_API_KEY`

Enables the restaurant / hotel / attraction card.

1. Sign up for the
   [TripAdvisor Content API](https://www.tripadvisor.com/developers).
2. In the developer portal, **create an API key** (the free tier includes a
   monthly call allowance).
3. Copy it into `TRIPADVISOR_API_KEY`.

> [!NOTE]
> The TripAdvisor Content API requires showing TripAdvisor attribution where its
> data appears, which Seurch's card already does. You can also restrict the key to
> your server's IP in their portal.

## Stack Exchange (Q&A card) — `STACKEXCHANGE_API_KEY`

Enables the Stack Exchange question-and-answer card. **A key is optional.**

- **Without a key**, Seurch uses the shared anonymous quota (10,000 requests/day
  shared across all anonymous callers), which is fine for low traffic.
- **With a key**, you get a dedicated, much higher quota:

  1. Register an app at
     [Stack Apps → Register OAuth](https://stackapps.com/apps/oauth/register)
     (use your instance's URL; you don't need the OAuth flow).
  2. Copy the generated **Key**.
  3. Set it as `STACKEXCHANGE_API_KEY`.

## Providers that need no key

These work out of the box, no account, no key:

| Provider | Used for |
|----------|----------|
| **OpenStreetMap / Nominatim** | The Maps tab and map quick-answers |
| **Wikipedia / Wikidata** | The Wikipedia knowledge card and subject detection |
| **Sepia / PeerTube** | The Videos tab's supplementary provider |
| **Open-Meteo** | The weather instant answer |
| **Frankfurter** | The currency instant answer |

The Translate tab is the one keyless feature that still needs **infrastructure**:
a LibreTranslate instance you point Seurch at, see
[Translation]({{< relref "translation" >}}).

## After adding keys

1. Put each value in your environment (or `.env`), see
   [Configuration]({{< relref "configuration" >}}).
2. Restart the app so it picks up the new variables.
3. Check the **`/status`** page (or the [`status/` API endpoint]({{< relref "/api/meta#provider-status" >}}))
   to confirm each provider is reporting healthy.
