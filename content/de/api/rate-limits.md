---
title: Ratenlimits
weight: 2
---

# Ratenlimits

Jeder API-Schlüssel hat sein eigenes Budget, das durch **zwei zusammen geltende Limits** durchgesetzt wird. Eine Anfrage muss beide erfüllen:

| Limit | Standard | Zweck |
|-------|---------|-------|
| **Burst** | `60/min` | Kurzfristiges Limit, schützt vorgelagerte Anbieter vor einem unkontrollierten Client. |
| **Sustained** | `5000/day` | Begrenzt das tägliche Gesamtvolumen. |

Auf einer selbst-gehosteten Instanz sind diese mit `API_THROTTLE_BURST` und `API_THROTTLE_SUSTAINED` konfigurierbar; siehe [Konfiguration]({{< relref "/self-hosting/configuration#public-api-rate-limits" >}}).

## Wenn Sie ein Limit überschreiten

Das Überschreiten eines der beiden Limits gibt zurück:

```
HTTP 429 Too Many Requests
```

```json
{ "detail": "Request was throttled. Expected available in 12 seconds." }
```

DRF enthält einen `Retry-After`-Hinweis in der Nachricht; warten Sie und versuchen Sie es nach der angegebenen Zeit erneut. Ein robuster Client sollte `429` mit exponentiellem Backoff behandeln.

## Nutzungserfassung

Jede **Such**-Anfrage zählt zum monatlichen Suchen-Gesamtbetrag des Schlüsselinhabers (der gleiche Gesamtbetrag, der für Website-Suchen in den Einstellungen angezeigt wird). Dies umfasst:

`web/`, `images/`, `images/similar/` (nur wenn eine echte Suche ausgeführt wird), `news/`, `videos/`, `maps/`, `translate/`, `translate/languages/`, `instant/`, `cards/` und `suggest/`.

Die **Meta**-Endpunkte zählen **nicht** zur Nutzung:

- Die API-Wurzel (`/api/v1/`)
- `status/`
- `key/`

Sie können also `key/` oder `status/` frei abfragen, um den Gesundheitsstatus zu prüfen, ohne Ihr Suchbudget zu verbrauchen (sie zählen noch gegen das rohe Ratenlimit).
