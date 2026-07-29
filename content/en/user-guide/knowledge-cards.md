---
title: Knowledge cards
weight: 5
---

# Knowledge cards

When your **web** search (first page) is about a well-known subject, Seurch shows
up to three **knowledge cards** beside the results, a quick summary so you often
don't need to click through at all.

## The cards

| Card | Source | Shows |
|------|--------|-------|
| **Wikipedia** | Wikipedia | A summary, image and link for the subject. This is the anchor card, it also helps detect what the other cards should show. |
| **Film / TV** | [TMDB](https://www.themoviedb.org/) | Details for a movie or TV show: poster, rating, year, overview. |
| **Places** | [TripAdvisor](https://www.tripadvisor.com/) | A restaurant, hotel or attraction: rating, address (which links to the [map]({{< relref "search-tabs" >}})) and a link. |
| **Q&A** | [Stack Exchange](https://stackexchange.com/) | The top question and answer for a technical query. |

## How they're chosen

Seurch only shows a card when your query genuinely matches that kind of subject:

- Wikipedia (and Wikidata behind the scenes) work out **what** the subject is, a
  film, a person, a place, in a language-independent way.
- The richer cards (film, places, Q&A) are only fetched when the query actually
  looks like that kind of thing, and the best match wins, weak matches are
  dropped.

This keeps the panel relevant and avoids unnecessary lookups.

## Lazy loading

By default the cards **load just after** the main results, with a quick
background fetch, so a slow card never holds up your answer. You can change this
under **Settings → Engines** (turn lazy-loading off to load them with the page),
and you can switch any individual card source on or off under **Settings →
Engines → Data sources**.
