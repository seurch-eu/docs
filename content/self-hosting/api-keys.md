---
title: API keys
weight: 8
---

# API keys

Users access the [public API]({{< relref "/api" >}}) with per-user API keys.
Users can manage their own keys in the web UI (**Settings → API keys**), and you
can manage them from the command line.

## How keys are stored

A key looks like `searpa_sk_<prefix>.<secret>`:

- The **prefix** (8 characters) is stored in the clear for fast lookup.
- Only a **SHA-256 hash** of the secret is stored, never the secret itself.

So a key's full value is shown **exactly once**, at creation, and cannot be
recovered afterwards, only revoked.

## Command-line management

Run these inside the container (`docker exec -it <container> …`) or via
`uv run python manage.py …` from source.

### Create a key

```bash
python manage.py create_api_key <username> --name "my script"
```

The full key is printed once. Copy it immediately, it cannot be shown again.

### List keys

```bash
python manage.py list_api_keys [--user <username>]
```

Shows each key's name, prefix, creation and last-used time, and whether it's
revoked, never the secret.

### Revoke a key

```bash
python manage.py revoke_api_key searpa_sk_<prefix>
```

A revoked key is rejected immediately on the next request.

## Rate limits

Every key is rate-limited by two limits that apply together, a short **burst**
cap and a daily **sustained** cap, configured with `API_THROTTLE_BURST` and
`API_THROTTLE_SUSTAINED`. Exceeding either returns HTTP `429`. See
[Configuration]({{< relref "configuration#public-api-rate-limits" >}}) and the
[API rate limits]({{< relref "/api/rate-limits" >}}) page.

## Usage accounting

Each search made through the API counts toward the key owner's **monthly search
total** (shown to the user in Settings), exactly like searches made on the
website. The API's meta endpoints (`/`, `status/`, `key/`) do **not** count.
