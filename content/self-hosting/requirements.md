---
title: Requirements
weight: 1
---

# Requirements

## Runtime

| Component | Notes |
|-----------|-------|
| **A container runtime** | Docker or Podman, to run the published image. |
| **PostgreSQL** | The application database. Any reasonably recent PostgreSQL (16+) works. |
| **A Brave Search API key** | The minimum for useful results, see [Search providers]({{< relref "search-providers" >}}). The free tier is enough to start. |
| **Outbound HTTPS** | The server calls upstream providers; if you run behind an allowlist, see the [provider hosts]({{< relref "search-providers#network-allowlist" >}}). |

Everything else, the web server, static-file serving and translation-catalog
compilation, is built into the image.

## Optional

| Component | Enables |
|-----------|---------|
| **A LibreTranslate instance** | The [Translate]({{< relref "translation" >}}) tab. |
| **Provider API keys** (Mojeek, Marginalia, TMDB, TripAdvisor, Stack Exchange, Pixabay, World News) | Extra engines, media providers and knowledge cards. |
| **An SMTP server** | Password-reset email. Without it, users without a password are locked out, see [Users & access]({{< relref "users" >}}). |

## For local development from source

If you want to build from source or develop, rather than run the published
image, you'll also want:

- **Python 3.13+**
- [**uv**](https://github.com/astral-sh/uv) for dependency management
- **Podman** with **podman-compose** (the dev stack ships a compose file with
  PostgreSQL, a mail catcher and LibreTranslate)
- **Node.js 22+** *only* if you intend to edit the styles; the compiled CSS and
  icons are committed, so the app and image need no Node at runtime

The repository's `make setup` bootstraps all of this in one step. See
[Quick start]({{< relref "quick-start#from-source" >}}).
