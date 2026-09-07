---
title: Search tabs
weight: 3
---

# Search tabs

Besides the Web tab, Seurch has dedicated tabs for images, news, videos, maps
and translation. Each runs your query against sources suited to that kind of
content. A tab only appears when the instance has the provider it needs
configured **and** you have at least one of that tab's providers switched on in
[Settings → Engines]({{< relref "settings" >}}), where every search type keeps
its own selection.

## Images

Image results come from the Brave image index, blended with **Pixabay** where it
is enabled. Results are shown as a thumbnail grid.

Click any image to open a **lightbox** (much like Google Images):

- The picture larger, with links to the **source page** and the **full image**.
- A grid of **similar images**, a fresh image search seeded from the opened
  image's caption. Click one to focus it and keep exploring, or **See all
  results** to open the full search.

Similar images load only for the image you actually open, so they never slow the
grid down. With JavaScript turned off, clicking a result opens a server-rendered
detail page with the same image, links and similar grid, so the feature still
works.

## News

The **News** tab returns recent articles from the Brave news index, blended with
the **World News API** where it is enabled. Each result shows the source, the
publication age and a thumbnail. Use the time-range filter to focus on the most
recent coverage.

## Videos

The **Videos** tab blends Brave video results with **Sepia**, the search index
for [PeerTube](https://joinpeertube.org/) (a decentralised, open video network).
The two lists are interleaved, so PeerTube videos aren't pushed below everything
Brave found. Results show a thumbnail, the duration and the host site.

## Maps

The **Maps** tab needs no setup and no account with any provider. Type a place
name or address and Seurch:

- **Geocodes** it with [Nominatim](https://nominatim.openstreetmap.org/)
  (OpenStreetMap's search), and
- shows the location on an **embedded OpenStreetMap map**, with an **Open in
  Maps** link and directions.

The tab always shows a map. Switch to it without a query, or search for
something that can't be placed, and you get a world view with the message in the
sidebar rather than an empty panel, so you can pan and zoom your way there
instead. **Directions** need a destination, so that button appears once a place
is found.

When a normal **web** search looks like an address or a place, a small map
quick-answer appears alongside the results, and a place's
[knowledge card]({{< relref "knowledge-cards" >}}) links straight to the map.

## Translate

The **Translate** tab translates text between languages, powered by
[LibreTranslate](https://libretranslate.com/) (open-source machine translation).
Pick a target language (and optionally a source language, or let it auto-detect),
paste your text, and read the translation. The available languages depend on the
LibreTranslate instance the operator has connected.

## When a tab comes up empty

Every tab distinguishes three cases, so an empty panel tells you which one you
are in:

- **Nothing searched yet.** Switching tabs carries no query, so the tab invites
  you to type one.
- **No provider for it.** The instance has no key for that kind of search, or
  you have switched every provider for it off, and the panel says so.
- **Nothing matched.** The search ran and came back empty, so it suggests
  checking the spelling or trying different keywords.

> [!NOTE]
> If a tab is missing altogether, either the instance operator hasn't configured
> that provider, or you have switched every provider for that search type off in
> [Settings → Engines]({{< relref "settings" >}}). On a
> [self-hosted]({{< relref "/self-hosting" >}}) instance you control both.
