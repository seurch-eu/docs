---
title: Authentication
weight: 1
---

# Authentication

Every API request must carry a valid **API key**. Keys are issued per user; a
request without one gets `401`, and a request with a bad or revoked one is
rejected.

> [!IMPORTANT]
> The API is a [self-hosted]({{< relref "/self-hosting" >}}) feature, so keys are
> issued on **your own instance**, not on the hosted searpa.eu service.

## Getting a key

On your instance:

- **In the web UI:** **Settings → API keys**, create a key (optionally name it).
  The full key is shown **once**, copy it immediately.
- **From the command line** (admins):
  `python manage.py create_api_key <username> --name "my script"`, see
  [Issuing API keys]({{< relref "/self-hosting/api-keys" >}}).

A key looks like:

```
searpa_sk_<prefix>.<secret>
```

Only a prefix and a hash of the secret are stored server-side, so a lost key
can't be recovered, only revoked and replaced.

## Sending a key

Send the key in the `Authorization` header. `Api-Key` is the documented scheme;
`Bearer` is accepted as a synonym.

```bash
curl -H "Authorization: Api-Key searpa_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climate"
```

An `X-Api-Key` header is also accepted, handy where you can't set
`Authorization`:

```bash
curl -H "X-Api-Key: searpa_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climate"
```

### Python

```python
import requests

BASE = "https://search.example.com/api/v1"
HEADERS = {"Authorization": "Api-Key searpa_sk_<prefix>.<secret>"}

r = requests.get(f"{BASE}/web/", params={"q": "climate", "lang": "en"}, headers=HEADERS)
r.raise_for_status()
print(r.json()["results"])
```

## Verifying a key

Hit the [`key/`]({{< relref "meta#key" >}}) endpoint to confirm a key works and
see its metadata (this endpoint does **not** count toward your usage):

```bash
curl -H "Authorization: Api-Key searpa_sk_<prefix>.<secret>" \
  "https://search.example.com/api/v1/key/"
```

```json
{
  "name": "my script",
  "prefix": "searpa_sk_1a2b3c4d",
  "created_at": "2026-06-01T10:00:00Z",
  "last_used_at": "2026-06-30T09:15:00Z",
  "revoked": false
}
```

> [!WARNING]
> Keep keys secret, anyone holding one can search as you and spend your rate
> limit. The brand prefix `searpa_sk_` lets secret scanners flag a leaked key.
> Revoke a compromised key and issue a new one.
