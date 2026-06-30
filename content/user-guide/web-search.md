---
title: Web search
weight: 2
---

# Web search

The **Web** tab is Searpa's core. It can draw on three independent web indexes
and blend whatever you enable into one ranked list.

## The three engines

| Engine | What it is |
|--------|------------|
| **Brave** | A large independent web index (also powers Images, News and Videos). |
| **Mojeek** | An independent UK search index with its own crawler. |
| **Marginalia** | A non-commercial index focused on the small, non-commercial web. |

You choose which engines to use in **Settings → Engines**. Enable just one for a
single source, or several to blend them. All three are on by default.

## How results are blended

When more than one engine returns results, Searpa merges them with **Reciprocal
Rank Fusion (RRF)** rather than just concatenating the lists:

- Each result URL scores points based on how high it ranks in each engine that
  returned it.
- The same URL from several engines collapses into **one** entry, and its scores
  add up, so a page multiple engines agree on rises toward the top.
- Each merged result shows **which engines** contributed it, so you can see when
  there is cross-engine agreement.

The effect: broad, mainstream results that everyone surfaces rank highly, while
the distinctive finds from a single index (especially Marginalia's small-web
results) still appear.

## Refining a search

- **Time range** — filter to the last day, week, month or year.
- **Safe search** — on by default; turn it off in
  [Settings]({{< relref "settings" >}}) to include adult results.
- **Spelling corrections** — when a query looks misspelled, Searpa surfaces a
  suggested correction above the results.
- **Pagination** — page through more results at the bottom of the list.
- **Languages** — set a preferred search language in Settings, or leave it on
  *Auto* to follow your browser.

## Blocking sites

You can hide results from domains you never want to see. Add them under
**Settings → Engines** (blocked sites); matching results are filtered out of
every web search. This list is stored against your account.

## Bangs

Type a `!bang` anywhere in your query to redirect it, for example `!w einstein`
goes straight to Wikipedia, and `!images sunset` jumps to the Images tab. See
[Bangs]({{< relref "bangs" >}}) for the full story.
