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

## Deployment

The site is static, so it can be served anywhere.

### Kamal (production)

The docs are deployed with [Kamal](https://kamal-deploy.org): a multi-stage `Dockerfile` builds the site
with Hugo and serves the result with nginx, and kamal-proxy terminates TLS
(Let's Encrypt) in front of it.

```bash
kamal setup     # first deploy (provisions the proxy + boots the container)
kamal deploy    # subsequent deploys
```

- `config/deploy.yml` — servers, registry, proxy host and health check.
- `deploy/nginx.conf` — the static-file server (health endpoint at `/up`).
- `.kamal/secrets` — fetches the registry password from Bitwarden Secrets
  Manager (no secret values are stored in the repo).

`.kamal/secrets` shells out to the [Bitwarden Secrets Manager
CLI](https://bitwarden.com/help/secrets-manager-cli/) (`bws`), so it must be
installed wherever `kamal deploy`/`kamal setup` runs — including a developer's
laptop, not just CI (see `.github/workflows/deploy.yml` for the CI install
