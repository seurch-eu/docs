---
title: Maintenance
weight: 8
---

# Maintenance

Searpa needs little ongoing care, but a few **management commands** keep it tidy
and current. Run them on a schedule (a cron job, a systemd timer, or your
orchestrator's scheduled-task feature). Run each inside the container
(`docker exec <container> python manage.py …`) or via `make` / `uv run` from
source.

## Scheduled tasks

| Command | What it does | Suggested schedule |
|---------|--------------|--------------------|
| `clear_expired_cache` | Deletes expired search-result cache rows | Daily |
| `check_provider_health` | Probes providers with a free health endpoint so `/status` stays current, without spending paid quota | Every ~10 minutes |
| `refresh_currency` | Refreshes cached exchange rates and prunes the instant-answer cache | Daily (optional, also self-refreshes on demand) |

A cron example:

```cron
# Daily 03:00: drop expired cache entries
0 3 * * *  cd /app && python manage.py clear_expired_cache

# Every 10 minutes: keep the /status page current
*/10 * * * *  cd /app && python manage.py check_provider_health
```

The `make` equivalents from source are `make refresh-currency` and the
underlying `manage.py` commands above.

## One-off / occasional tasks

### Bang definitions

The [bangs]({{< relref "/user-guide/bangs" >}}) database (the thousands of
`!shortcuts`) is downloaded with:

```bash
python manage.py fetch_bangs        # or: make bangs
```

Run it once at setup, and again occasionally to pick up new bang definitions. If
the bang data is missing, bangs simply fall back to being treated as ordinary
query text.

### Database migrations

The container applies migrations automatically on every start, so a normal
upgrade is just pulling a newer image and restarting. To run them by hand:

```bash
python manage.py migrate
```

## Upgrading

1. Pull the new image (or rebuild from the latest source).
2. Restart the container, migrations run automatically on boot.
3. If the release notes mention new bang data or providers, run `fetch_bangs`
   and review any new [configuration]({{< relref "configuration" >}}) variables.

Because the app is stateless apart from PostgreSQL, a rolling restart is safe;
keep your database backed up as usual.

## Caching

Search results are cached briefly on the server (about an hour) to stay fast and
ease load on providers; the cache is keyed to the query, not to any user.
`clear_expired_cache` removes stale entries so the table doesn't grow unbounded.
