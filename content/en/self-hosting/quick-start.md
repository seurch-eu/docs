---
title: Quick start
weight: 2
---

# Quick start

The fastest way to a running instance is the Docker image. You need a
PostgreSQL database and, at minimum, a [Brave Search API
key]({{< relref "search-providers" >}}).

## With Docker

```bash
docker run -p 8000:8000 \
  -e SECRET_KEY=your-long-random-secret \
  -e DATABASE_URL=postgres://user:password@db-host:5432/seurch \
  -e ALLOWED_HOSTS=search.example.com \
  -e BRAVE_API_KEY=your-brave-key \
  -e BRAVE_SUGGEST_API_KEY=your-brave-suggest-key \
  -e MARGINALIA_API_KEY=public \
  seurch
```

On start the container:

1. Applies database **migrations** (a no-op once the schema is current).
2. Serves the app with **gunicorn** (2 workers) on port **8000**.
3. Serves its own static files via
   [WhiteNoise](https://whitenoise.readthedocs.io/) (compressed and hashed), no
   separate web server or CDN required.
4. Answers a health check at **`/up`**.

The translation catalogs and static files are compiled at build time, so there
is nothing else to run.

Point a reverse proxy with TLS (Caddy, nginx, Traefik, …) at port 8000 and set
`ALLOWED_HOSTS` to your domain. See [Production notes]({{< relref "production" >}}).

### Create your first user

The app has **no public registration**, so create an account before you can sign
in:

```bash
docker exec -it <container> python manage.py createsuperuser
```

See [Users & access]({{< relref "users" >}}) for more.

## With Docker Compose

A minimal `compose.yaml` with the database alongside the app:

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_DB: seurch
      POSTGRES_USER: seurch
      POSTGRES_PASSWORD: change-me
    volumes:
      - pgdata:/var/lib/postgresql/data

  app:
    image: seurch
    depends_on: [db]
    ports:
      - "8000:8000"
    environment:
      SECRET_KEY: your-long-random-secret
      DATABASE_URL: postgres://seurch:change-me@db:5432/seurch
      ALLOWED_HOSTS: search.example.com
      BRAVE_API_KEY: your-brave-key
      BRAVE_SUGGEST_API_KEY: your-brave-suggest-key
      MARGINALIA_API_KEY: public

volumes:
  pgdata:
```

```bash
docker compose up -d
docker compose exec app python manage.py createsuperuser
```

See [Configuration]({{< relref "configuration" >}}) for the full list of
environment variables, and [Search providers]({{< relref "search-providers" >}})
for the keys that enable each tab and card.

## From source

To build the image yourself or develop locally, clone the Seurch repository and
use the bundled workflow:

```bash
cp .env.example .env        # then add at least BRAVE_API_KEY
make setup                  # install deps, start dev services, migrate, compile i18n
make run                    # dev server at http://localhost:8000
make superuser              # create an account
```

`make setup` starts a dev stack (PostgreSQL + a mail catcher + LibreTranslate)
via Podman Compose, so you get a working Translate tab out of the box. Run `make`
with no arguments to list every target. Build a production image with:

```bash
docker build -t seurch .
```

> [!WARNING]
> Always set a long, random **`SECRET_KEY`** and a real **`DATABASE_URL`** in
> production, and set **`DEBUG=False`** (the default when unset). The value in
> `.env.example` is for local development only.
