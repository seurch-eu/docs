---
title: Übersetzung
weight: 6
---

# Übersetzung (LibreTranslate)

Der **Übersetzen**-Tab wird von [LibreTranslate](https://libretranslate.com/) betrieben, einem Open-Source, selbst-hostbaren Maschinenübersetzungsserver. Searpa ruft ihn serverseitig auf; kein Drittanbieter-Übersetzungsdienst ist beteiligt.

## Den Tab aktivieren

Zeigen Sie Searpa mit `LIBRETRANSLATE_URL` auf eine LibreTranslate-Instanz:

```
LIBRETRANSLATE_URL=http://libretranslate:5000
```

- **Gesetzt**: Der Übersetzen-Tab (und seine Einstellung) erscheinen mit den Sprachen, die diese Instanz anbietet.
- **Nicht gesetzt**: Der Übersetzen-Tab und seine Einstellung werden vollständig deaktiviert.

## LibreTranslate betreiben

Der Entwicklungs-Stack startet automatisch ein lokales LibreTranslate (`make up` startet eines unter `http://localhost:5000`). Für die Produktion betreiben Sie Ihr eigenes, zum Beispiel:

```yaml
services:
  libretranslate:
    image: libretranslate/libretranslate
    ports:
      - "5000:5000"
```

Setzen Sie dann `LIBRETRANSLATE_URL` auf seine Adresse (verwenden Sie den internen Dienstnamen, wenn beide im gleichen Docker-Netzwerk laufen).

## Optionale Einstellungen

| Variable | Wann Sie sie brauchen |
|----------|----------------------|
| `LIBRETRANSLATE_API_KEY` | Nur wenn Ihr LibreTranslate Schlüssel verlangt (`LT_API_KEYS=true`). |
| `LIBRETRANSLATE_ORIGIN_COUNTRY` | Zweistelliger Ländercode für die neben „Übersetzen" angezeigte Flagge in **Einstellungen → Suchmaschinen → Datenquellen** (Standard `fr`). Die Instanz kann überall gehostet werden; dies ist rein kosmetisch. |

## Status

LibreTranslate stellt einen kostenlosen `/languages`-Endpunkt bereit, sodass Searpas [`/status`]({{< relref "search-providers#provider-status-page" >}})-Seite ihn direkt abfragt und berichtet, ob Übersetzung derzeit verfügbar ist.
