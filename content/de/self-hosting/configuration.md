---
title: Konfiguration
weight: 3
---

# Konfiguration

Searpa wird vollständig über **Umgebungsvariablen** (in der Produktion) oder eine `.env`-Datei (in der Entwicklung) konfiguriert. Das Repository enthält eine `.env.example`, die jede Variable dokumentiert; diese Seite ist die Referenz.

## Kern

| Variable | Zweck | Hinweise |
|----------|-------|---------|
| `SECRET_KEY` | Django-Geheimschlüssel | **In der Produktion erforderlich.** Lang und zufällig. |
| `DEBUG` | Debug-Modus | In der Produktion **`False`** (der Standard) belassen. |
| `ALLOWED_HOSTS` | Kommagetrennte Hostnamen, die die App bedient | z.B. `search.example.com`. |
| `DATABASE_URL` | PostgreSQL-Verbindungs-URL | z.B. `postgres://user:pass@host:5432/searpa`. |
| `LOG_LEVEL` | Protokollierungsausführlichkeit | `DEBUG` / `INFO` / `WARNING` / `ERROR` (Standard `INFO`). |

## Suchanbieter

Diese Schlüssel bestimmen, welche Suchmaschinen, Medien-Tabs und Wissenskarten verfügbar sind. Ein Anbieter ohne Schlüssel wird einfach ausgeblendet (nicht als defekt angezeigt). Vollständige Details unter [Suchanbieter]({{< relref "search-providers" >}}).

| Variable | Aktiviert |
|----------|-----------|
| `BRAVE_API_KEY` | Web, Bilder, Nachrichten und Videos über Brave (die Basis). |
| `BRAVE_SUGGEST_API_KEY` | Autocomplete-Vorschläge (ein separates Brave-Abonnement). |
| `MOJEEK_API_KEY` | Die Mojeek-Web-Suchmaschine. |
| `MARGINALIA_API_KEY` | Die Marginalia-Web-Suchmaschine (`public` funktioniert sofort). |
| `TMDB_API_KEY` | Die Film / TV-Wissenskarte. |
| `TRIPADVISOR_API_KEY` | Die Orte-Wissenskarte. |
| `STACKEXCHANGE_API_KEY` | Ein höheres Stack Exchange-Kontingent für die Q&A-Karte (optional). |
| `PIXABAY_API_KEY` | Pixabay-Bilder gemischt in den Bilder-Tab. |
| `WORLDNEWS_API_KEY` | World News API-Artikel gemischt in den Nachrichten-Tab. |

## Übersetzung

| Variable | Zweck |
|----------|-------|
| `LIBRETRANSLATE_URL` | URL Ihrer LibreTranslate-Instanz. **Nicht gesetzt deaktiviert den Übersetzen-Tab vollständig.** |
| `LIBRETRANSLATE_API_KEY` | Nur wenn Ihr LibreTranslate Schlüssel erfordert (`LT_API_KEYS=true`). |
| `LIBRETRANSLATE_ORIGIN_COUNTRY` | Zweistelliger Ländercode für die neben „Übersetzen" angezeigte Flagge in den Einstellungen (Standard `fr`). |

Siehe [Übersetzung]({{< relref "translation" >}}).

## Öffentliche API-Ratenlimits

Pro API-Schlüssel angewendet (Django REST Framework-Drosselraten, `<Anzahl>/<Zeitraum>`, wobei der Zeitraum `second` / `minute` / `hour` / `day` ist). Beide Limits gelten zusammen. Siehe die [API-Ratenlimits]({{< relref "/de/api/rate-limits" >}})-Seite.

| Variable | Zweck | Standard |
|----------|-------|---------|
| `API_THROTTLE_BURST` | Kurzfristiges Limit, schützt vorgelagerte Anbieter vor einem unkontrollierten Client | `60/min` |
| `API_THROTTLE_SUSTAINED` | Tägliches Volumenlimit | `5000/day` |

## E-Mail (Passwort-Reset)

Wird nur zum Senden von Passwort-Reset-Nachrichten verwendet; siehe [Benutzer & Zugang]({{< relref "users" >}}).

| Variable | Zweck |
|----------|-------|
| `EMAIL_BACKEND` | Django E-Mail-Backend (SMTP, Konsole, …). |
| `EMAIL_HOST` / `EMAIL_PORT` | SMTP-Server. |
| `EMAIL_USE_TLS` | `True` / `False`. |
| `EMAIL_HOST_USER` / `EMAIL_HOST_PASSWORD` | SMTP-Zugangsdaten. |
| `DEFAULT_FROM_EMAIL` | Die „Von"-Adresse auf ausgehenden E-Mails. |

Für einen schnellen Test ohne echten SMTP-Server setzen Sie `EMAIL_BACKEND=django.core.mail.backends.console.EmailBackend`, um E-Mails im Container-Log auszudrucken.

## Fußzeilen-Links

Die Fußzeile enthält standardmäßig **keine** Datenschutzrichtlinie, Nutzungsbedingungen oder rechtliche Hinweise; dieser Inhalt ist spezifisch für den Betreiber der Instanz und Ihre Rechtsordnung. Fügen Sie Ihre eigenen als kommagetrennte `Bezeichnung=URL`-Paare hinzu:

```
FOOTER_LINKS=Datenschutz=https://example.com/privacy,Impressum=https://example.com/impressum
```

Lassen Sie `FOOTER_LINKS` nicht gesetzt, um keine zusätzlichen Fußzeilen-Links anzuzeigen.
