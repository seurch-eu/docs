---
title: Konventionen
weight: 3
---

# Konventionen

## Gemeinsame Abfrageparameter

Die Such-Endpunkte akzeptieren einen gemeinsamen Satz von Parametern. Jeder entspricht einer Option, die die Website in ihrem Einstellungs-Cookie hält; hier sind sie in der URL explizit.

| Parameter | Gilt für | Werte | Standard |
|-----------|---------|-------|---------|
| `q` | alle Such-Endpunkte | Die Abfragezeichenkette (**erforderlich**) | — |
| `engine` | web, images, news, videos, cards | `brave`, `mojeek`, `marginalia` oder `all`; mehrere durch Komma oder Leerzeichen trennen | `all` |
| `safe` | web, images, news, videos, cards | `on` / `off` (`off`, `false`, `0`, `no` bedeuten alle off) | `on` |
| `lang` | die meisten Endpunkte | Ein Sprachcode, z.B. `de`, `en` | leer (auto) |
| `page` | web, images, news, videos | Seitennummer, `1`–`50` | `1` |
| `date` | web, news, videos | Zeitbereich: `d` (Tag), `w` (Woche), `m` (Monat), `y` (Jahr) | keiner |

Hinweise:

- **`engine`** — ein unbekannter Suchmaschinenname gibt `400` mit der Liste gültiger Namen zurück. Medien-Tabs mischen ihren ergänzenden Anbieter (Pixabay / World News / Sepia) über Brave; für die Mojeek/Marginalia-Suchmaschinen ist dieser ergänzende Anbieter die einzige Medienquelle.
- **`page`** — Werte über `50` werden auf `50` begrenzt (verhindert, dass ein Client einen Anbieter überlastet), Werte unter `1` werden auf `1` begrenzt.

## Antwortstruktur

Jeder Endpunkt gibt JSON zurück. Such-Endpunkte geben den Anforderungskontext neben den `results` zurück, sodass eine Antwort selbstbeschreibend ist:

```json
{
  "query": "klima",
  "tab": "web",
  "page": 1,
  "engine": ["brave", "mojeek", "marginalia"],
  "correction": "",
  "results": [ /* ... */ ]
}
```

- `query` — die Anfrage, wie Searpa sie interpretiert hat.
- `tab` — welche Art von Suche ausgeführt wurde.
- `engine` — die tatsächlich abgefragten Suchmaschinen (nach Auflösung von `all` / Standardwerten).
- `correction` — ein Rechtschreibvorschlag für die Anfrage, oder `""` (nur Web).
- `results` — das Ergebnis-Array (die Struktur hängt vom Endpunkt ab).

Wissenskarten und Sofortantworten werden als **anbietergeformtes JSON** zurückgegeben (ihre Struktur variiert je nach Anbieter / Antworttyp), daher verwenden diese Endpunkte kein festes Schema pro Feld; siehe [Sofortantworten & Karten]({{< relref "instant-cards" >}}).

## HTTP-Methoden

Alle Endpunkte sind **`GET`**, außer `translate/`, das auch **`POST`** akzeptiert, damit langer Text nicht in der URL und den Logs erscheint.
