---
title: Bangs
weight: 6
---

# Bangs

**Bangs** are `!shortcuts` you type in the search box to send a query straight to
another site or to a different Seurch tab. Seurch understands the widely-used
DuckDuckGo-style bang vocabulary, thousands of sites, plus a few of its own.

The bang definitions come from [Kagi's open-source bangs
repository](https://github.com/kagisearch/bangs), the same community-maintained
`!bang` list Kagi publishes. Self-hosters refresh it with `make bangs`, see
[Maintenance]({{< relref "/self-hosting/maintenance#bang-definitions" >}}).

A bang can sit anywhere in the query, the rest of the text is the search terms.

## Site bangs

Prefix a query with a site's bang to search that site directly:

| You type | Goes to |
|----------|---------|
| `!w einstein` | Wikipedia article search for "einstein" |
| `!gh hugo` | GitHub search for "hugo" |
| `!yt lofi` | YouTube search for "lofi" |
| `!a headphones` | Amazon search |

There are thousands of these. If a bang isn't recognised, Seurch just treats it
as part of your normal query.

## Tab bangs

A handful of bangs jump to one of Seurch's own [tabs]({{< relref "search-tabs" >}})
instead of leaving the site:

| Bang(s) | Tab |
|---------|-----|
| `!web` | Web |
| `!images`, `!i` | Images |
| `!news`, `!n` | News |
| `!videos`, `!v` | Videos |
| `!maps`, `!m` | Maps |
| `!translate` | Translate |

For example, `!i golden retriever` runs an image search without touching the
tabs by hand.

## The "lucky" bang

A bare `!` on its own (for example `! best espresso machine`) is the **lucky**
bang, it takes you to the top result for your query.

## Custom bangs

You can define your **own** bangs under **Settings → Bangs**. Give each one a
trigger and a URL template, and it works just like the built-in ones. Custom
bangs are stored against your account, so they follow you across devices.
