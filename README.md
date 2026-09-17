# Seurch documentation

Public documentation for [Seurch](https://seurch.eu/), the privacy-first
metasearch engine. Built with [Hugo](https://gohugo.io/) and the
[hugo-book](https://github.com/alex-shpak/hugo-book) theme.

The site covers three audiences:

- **User guide** (`content/user-guide/`) — using the hosted service.
- **Self-hosting guide** (`content/self-hosting/`) — running your own instance.
- **API guide** (`content/api/`) — the public JSON API.

## Prerequisites

- [Hugo **extended**](https://gohugo.io/installation/) **v0.158.0 or newer**
  (the theme uses SCSS, so the *extended* build is required).

The theme is vendored under `themes/hugo-book/`, so there are no submodules to
initialise and nothing to fetch at build time.

## Local development

```bash
hugo server        # live-reloading preview at http://localhost:1313
```

## Building

```bash
hugo --gc --minify   # output written to ./public
```

## Structure

```
.
├── hugo.toml              # site configuration
├── content/
│   ├── _index.md          # landing page
│   ├── user-guide/        # User guide
│   ├── self-hosting/      # Self-hosting guide
│   └── api/               # API guide
├── assets/_custom.scss    # Seurch theme overlay (slate + indigo, light/dark)
├── layouts/               # theme overrides (sidebar "Links" section)
├── themes/hugo-book/      # vendored theme (MIT, see its LICENSE)
├── Dockerfile             # Hugo build → nginx (used by Kamal)
├── deploy/nginx.conf      # static-file server config
├── config/deploy.yml      # Kamal deployment config
├── .kamal/secrets         # registry secret (fetched from Bitwarden)
└── .github/workflows/     # pages.yml (GitHub Pages alternative)
```

## Editing

- Each page is a Markdown file with TOML/YAML front matter. Order within a
  section is controlled by the `weight` field.
- Cross-page links use Hugo's `relref`, e.g.
  `[Settings]({{< relref "/user-guide/settings" >}})`, so a broken link fails the
  build.
- Callouts use GitHub-style Markdown alerts (`> [!NOTE]`, `> [!WARNING]`), which
  the theme styles automatically.
