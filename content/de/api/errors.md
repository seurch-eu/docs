---
title: Fehler
weight: 9
---

# Fehler

Die API verwendet Standard-HTTP-Statuscodes und gibt einen JSON-Body zurück, der das Problem beschreibt.

## Statuscodes

| Code | Bedeutung | Typische Ursache |
|------|-----------|-----------------|
| `200` | OK | Erfolgreiche Anfrage. |
| `400` | Ungültige Anfrage | Ein schlechter Parameter, z.B. ein fehlendes `q`, ein nicht-ganzzahliges `page` oder ein unbekanntes `engine`. |
| `401` | Nicht autorisiert | Kein API-Schlüssel gesendet (oder kein erkannter Auth-Header). |
| `403` | Verboten | Schlüssel gehört zu einem deaktivierten Konto. |
| `429` | Zu viele Anfragen | Ein [Ratenlimit]({{< relref "rate-limits" >}}) wurde überschritten. |
| `503` | Dienst nicht verfügbar | Ein abhängiger Dienst ist nicht konfiguriert, z.B. Übersetzung, wenn LibreTranslate nicht gesetzt ist. |

## Fehlerbodies

### Validierungsfehler (`400`)

Feldgebundene Nachrichten:

```json
{ "q": ["This query parameter is required."] }
```

```json
{
  "engine": ["Unknown engine(s): foo. Valid: brave, mojeek, marginalia (or \"all\")."]
}
```

### Authentifizierungsfehler (`401` / `403`)

```json
{ "detail": "Invalid or revoked API key." }
```

Eine Anfrage **ohne** Schlüssel erhält ein sauberes `401` mit einem `WWW-Authenticate: Api-Key`-Header; eine Anfrage mit einem **schlechten** Schlüssel erhält `401` mit der obigen Nachricht; ein Schlüssel auf einem deaktivierten Konto erhält `403` (`"User account is disabled."`).

### Drosselung (`429`)

```json
{ "detail": "Request was throttled. Expected available in 12 seconds." }
```

### Dienst nicht konfiguriert (`503`)

```json
{ "detail": "Translation is unavailable or not configured on this deployment." }
```

## Fehler gut behandeln

- Behandeln Sie `401`/`403` als terminal; beheben Sie den Schlüssel, nicht wiederholen.
- Zurückziehen bei `429` unter Verwendung der Zeit in der Nachricht (exponentielles Backoff ist ideal).
- Für `400` lesen Sie die feldgebundene Nachricht; sie benennt den fehlerhaften Parameter.
- Ein fehlendes optionales Feld in einer **erfolgreichen** Antwort wird als leerer Wert (`""`, `[]` oder `null`) zurückgegeben, kein Fehler; Sie können also Felder lesen, ohne jeden einzelnen zu prüfen.
