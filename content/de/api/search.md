---
title: Such-Endpunkte
weight: 4
---

# Such-Endpunkte

Die Kernendpunkte: Web-, Bild-, Nachrichten- und Videosuche sowie der „ähnliche Bilder"-Helfer. Alle akzeptieren die [gemeinsamen Parameter]({{< relref "conventions" >}}) (`q`, `engine`, `safe`, `lang`, `page`, `date`).

## Web-Suche

```
GET /api/v1/web/?q=...
```

```bash
curl -H "Authorization: Api-Key seurch_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/web/?q=klima&engine=all&lang=de&date=w"
```

```json
{
  "query": "klima",
  "tab": "web",
  "page": 1,
  "engine": ["brave", "mojeek", "marginalia", "staan"],
  "correction": "",
  "results": [
    {
      "title": "Klimawandel",
      "url": "https://example.org/klima",
      "description": "...",
      "display_url": "example.org",
      "favicon_url": "https://...",
      "age": "vor 2 Tagen",
      "source": "all",
      "source_label": "Mojeek · Marginalia · Staan",
      "sitelinks": []
    }
  ]
}
```

- `source` / `source_label` — welche Suchmaschinen das Ergebnis zurückgegeben haben. `brave` / `mojeek` / `marginalia` / `staan` für eine einzelne Suchmaschine, `both` bei zwei übereinstimmenden, oder `all` bei drei oder mehr. `source_label` ist die lesbare Form, die Namen mit ` · ` verbunden. Brave wird darin bewusst weggelassen: Braves Attributionsbedingungen erlauben eine Nennung nur mit der exakten Logo-Darstellung, daher nennt das Label nur die übrigen Suchmaschinen.
- `correction` — ein vorgeschlagener Rechtschreibvorschlag, oder `""`.

## Bildsuche

```
GET /api/v1/images/?q=...
```

```json
{
  "query": "golden retriever",
  "tab": "images",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://example.com/seite",
      "source": "example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

### Ähnliche Bilder

Spiegelt das „ähnliche Bilder"-Raster der Lightbox der Website wider, eine Bildsuche, die aus der Bildunterschrift eines geöffneten Bildes gespeist wird.

```
GET /api/v1/images/similar/?q=<bildunterschrift>&query=<seiten-anfrage>&exclude_url=<url>
```

- `q` — die Bildunterschrift des geöffneten Bildes (der primäre Seed).
- `query` — die Anfrage der Seite, als Fallback-Seed verwendet.
- `exclude_url` — schließt das geöffnete Bild aus den Ergebnissen aus.

Geben Sie `q` und/oder `query` an (mindestens eines). Die Antwort gibt die tatsächlich verwendete `seed`-Anfrage zurück:

```json
{
  "query": "golden retriever welpe",
  "engine": ["brave"],
  "results": [ { "title": "...", "url": "...", "source": "...", "thumbnail": "..." } ]
}
```

Eine echte Bildsuche (und eine Nutzungszählung) erfolgt nur, wenn ein nutzbarer Seed gefunden wird.

## Nachrichtensuche

```
GET /api/v1/news/?q=...
```

```json
{
  "query": "wahlen",
  "tab": "news",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://news.example.com/artikel",
      "description": "...",
      "age": "vor 3 Stunden",
      "source": "Example News",
      "hostname": "news.example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

## Videosuche

```
GET /api/v1/videos/?q=...
```

```json
{
  "query": "hugo tutorial",
  "tab": "videos",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://video.example.com/watch",
      "age": "vor 1 Monat",
      "source": "...",
      "duration": "12:34",
      "hostname": "video.example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

> [!NOTE]
> Jedes Ergebnisfeld hat einen sinnvollen leeren Standardwert, sodass ein Anbieter, der ein Feld weglässt, einen leeren Wert (z.B. `""` oder `[]`) statt eines fehlenden Schlüssels liefert.
