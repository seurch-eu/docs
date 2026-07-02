---
title: Getting started
weight: 1
---

# Getting started

## Sign in

Searpa requires an account, there is no anonymous **search**. The account
itself, though, can be **anonymous**: only a username and password are needed,
**no email or personal details are required** (an email is optional, and only
for password reset, see [Your account]({{< relref "account" >}})). On the hosted
service, accounts are invite-only during the alpha; on a self-hosted instance
the administrator creates them.

1. Go to your Searpa instance (the hosted service is at
   [searpa.eu](https://searpa.eu/)).
2. Click **Sign in** and enter your username and password.
3. You land on the search home page.

If you forget your password and added an email to your account, use the
**Forgot password?** link to reset it. Without an email on file a lost password
cannot be recovered, see [Your account]({{< relref "account" >}}).

## Your first search

Type a query into the search box and press <kbd>Enter</kbd>. Searpa queries
every enabled engine at once, merges the results and shows them on a single
page. As you type, autocomplete suggestions appear; pick one with the arrow
keys or keep typing.

A results page can show several things at once:

- An **[instant answer]({{< relref "instant-answers" >}})** at the very top for
  utility queries (`2+2`, `weather in Paris`, `100 usd to eur`).
- The **web results**, blended from your enabled engines.
- One or more **[knowledge cards]({{< relref "knowledge-cards" >}})** to the
  side for well-known subjects (a person, a film, a place).

## The search tabs

Across the top of the results you'll find tabs. Each runs the same query against
a different kind of source:

| Tab | What it searches |
|-----|------------------|
| **Web** | Web pages across Brave, Mojeek and Marginalia |
| **Images** | Pictures, with a lightbox and "similar images" |
| **News** | Recent news articles |
| **Videos** | Video results with thumbnails and durations |
| **Maps** | Places and addresses on an OpenStreetMap map |
| **Translate** | Translate text between languages |

Tabs only appear when the instance has the relevant provider configured. See
[Search tabs]({{< relref "search-tabs" >}}) for what each one does.

## Make it yours

Open **Settings** (from the home page or the menu) to choose which engines to
use, set your interface and search languages, pick a light or dark theme, and
turn individual data sources on or off. Your settings sync to your account and
follow you to any device you sign in on, see [Settings]({{< relref "settings" >}}).

> [!NOTE]
> **Keyboard tip:** start any query with a [bang]({{< relref "bangs" >}}) like
> `!w` (Wikipedia) or `!images` to jump straight to another site or tab.
