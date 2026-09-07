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
| **Film / TV** | [TheTVDB](https://thetvdb.com/) | Details for a movie or TV show: poster, rating, year, overview. |
| **Places** | [TripAdvisor](https://www.tripadvisor.com/) | A restaurant, hotel or attraction: its area, rating and review count, a short description, and the address (which links to the [map]({{< relref "search-tabs" >}})). |
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

The cards **load just after** the main results, with a quick background fetch,
so a slow card never holds up your answer. There is nothing to configure: when
your browser runs JavaScript the cards arrive a moment after the results, and
when it doesn't they are rendered with the page instead.

You can switch any individual card source on or off under **Settings → Engines**,
where they sit among the Web search type's **data sources**, see
[Settings]({{< relref "settings#engines" >}}).
