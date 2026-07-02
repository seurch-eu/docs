---
title: Errors
weight: 9
---

# Errors

The API uses standard HTTP status codes and returns a JSON body describing the
problem.

## Status codes

| Code | Meaning | Typical cause |
|------|---------|---------------|
| `200` | OK | Successful request. |
| `400` | Bad request | A bad parameter, e.g. a missing `q`, a non-integer `page`, or an unknown `engine`. |
| `401` | Unauthorized | No API key sent (or no recognised auth header). |
| `403` | Forbidden | Key belongs to a disabled account. |
| `429` | Too many requests | A [rate limit]({{< relref "rate-limits" >}}) was exceeded. |
| `503` | Service unavailable | A dependent service isn't configured, e.g. translation when LibreTranslate is unset. |

## Error bodies

### Validation errors (`400`)

Field-keyed messages:

```json
{ "q": ["This query parameter is required."] }
```

```json
{
  "engine": ["Unknown engine(s): foo. Valid: brave, mojeek, marginalia (or \"all\")."]
}
```

### Authentication errors (`401` / `403`)

```json
{ "detail": "Invalid or revoked API key." }
```

A request with **no** key gets a clean `401` with a `WWW-Authenticate: Api-Key`
header; a request with a **bad** key gets `401` with the message above; a key on
a disabled account gets `403` (`"User account is disabled."`).

### Throttling (`429`)

```json
{ "detail": "Request was throttled. Expected available in 12 seconds." }
```

### Service not configured (`503`)

```json
{ "detail": "Translation is unavailable or not configured on this deployment." }
```

## Handling errors well

- Treat `401`/`403` as terminal, fix the key, don't retry.
- Back off on `429` using the time in the message (exponential backoff is
  ideal).
- For `400`, read the field-keyed message; it names the offending parameter.
- A missing optional field in a **successful** response is returned as an empty
  value (`""`, `[]`, or `null`), not an error, so you can read fields without
  guarding every one.
