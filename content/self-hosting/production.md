---
title: Production notes
weight: 9
---

# Production notes

A few things worth knowing when you run Searpa for real users.

## The image

- Serves the app with **gunicorn** (2 workers) on port **8000**.
- Serves its own static files via
  [WhiteNoise](https://whitenoise.readthedocs.io/), compressed and hashed, so
  you don't need a separate static-file server or CDN.
- Compiles translation catalogs and collects static files **at build time**.
- Runs database **migrations on start**.

## Reverse proxy and TLS

Put a TLS-terminating reverse proxy in front (Caddy, nginx, Traefik, …) and
forward to port 8000. Set:

- **`ALLOWED_HOSTS`** to your public hostname(s).
- **`DEBUG=False`** (the default), never run a public instance with debug on.
- A long, random **`SECRET_KEY`**.

## Health check

The app answers a health check at **`/up`** (returns success when the app is
serving). Point your orchestrator's liveness/readiness probe or your load
balancer there.

```
GET /up   →  200 OK
```

## Database

Use a managed or self-run **PostgreSQL** and set `DATABASE_URL`. This is the only
stateful component, the application itself is stateless, so back up PostgreSQL
and you've backed up the instance. Per-user settings, custom bangs, blocked
sites, API keys and provider-status rows all live there.

## Email

Configure the `EMAIL_*` variables so password-reset email can be sent, see
[Users & access]({{< relref "users" >}}). If you don't run SMTP, create and reset
passwords with management commands instead.

## Legal / footer links

No privacy policy, terms or legal notice ship by default, their content depends
on **who operates the instance** and the local jurisdiction. Add your own with
`FOOTER_LINKS`:

```
FOOTER_LINKS=Privacy=https://example.com/privacy,Terms=https://example.com/terms
```

See [Configuration → Footer links]({{< relref "configuration#footer-links" >}}).

## Scaling

Searpa is a standard stateless Django app, so you can run several app containers
behind your proxy pointed at the same PostgreSQL. Run the
[scheduled maintenance commands]({{< relref "maintenance" >}}) from a single
place (one cron host or one scheduled task) rather than on every replica.

## Image proxying and outbound traffic

If users enable [image proxying]({{< relref "/user-guide/settings" >}}),
thumbnails are fetched through the server, so account for that outbound traffic.
All provider calls are outbound HTTPS from the server, if you run behind an
allowlist, see the [provider hosts]({{< relref "search-providers#network-allowlist" >}}).
