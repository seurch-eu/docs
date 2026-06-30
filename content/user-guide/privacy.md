---
title: Privacy
weight: 9
---

# Privacy

Searpa is built to be a private alternative to surveillance-funded search. Here
is what that means in practice.

## What Searpa does not do

- **No tracking.** Searpa does not follow you around the web or across sessions
  to build a profile.
- **No ads.** There is no advertising, so there is no incentive to profile you.
- **No selling data.** Your searches are not a product sold to anyone.

## How your queries are handled

- Searches run **server-side**. Searpa talks to upstream providers (Brave,
  Mojeek, Marginalia and the rest) on your behalf, so those providers don't see
  your browser or IP, they see Searpa's server.
- **Provider API keys never reach your browser.** All upstream calls happen on
  the server.
- **Image proxying** (optional, in [Settings]({{< relref "settings" >}})) routes
  thumbnails through the Searpa server so source sites don't see your browser
  either.
- Results are briefly **cached** on the server to keep things fast and reduce
  load on providers; the cache is keyed to the query, not to you.

## Your data

- Your **settings** sync to your account so they follow you across devices. You
  can [export or delete]({{< relref "settings" >}}) them.
- Your **email**, if you add one, is used only for password reset, see
  [Your account]({{< relref "account" >}}).

## Where it's run

The hosted service is operated in the European Union under European privacy law.
Because the search engine is open source, anyone can audit how it works, or
[run their own copy]({{< relref "/self-hosting" >}}) and be the only operator
who ever touches their data.

> [!NOTE]
> The specific privacy policy, terms and legal notice depend on **who operates the
> instance** you use. On the hosted service, see the links in the site footer.
