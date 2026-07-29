---
title: Sofortantworten & Karten
weight: 7
---

# Sofortantworten & Wissenskarten

Diese zwei Endpunkte spiegeln die Inline-Antworten und Seitenpanel der Website wider. Da ihr Inhalt je nach Antworttyp und Anbieter variiert, geben sie **anbietergeformtes JSON** zurück statt eines festen Schemas pro Feld; behandeln Sie die Strukturen als Daten und lesen Sie die Felder, die Sie benötigen.

## Sofortantworten

```
GET /api/v1/instant/?q=...
```

Gibt die Sofortantwort für eine Dienstprogramm-Anfrage zurück (Mathematik, Einheits-/Basis-/Farbumrechnung, Wetter, Währung, Weltzeit, Hashes, QR, „meine IP", …), oder `null`, wenn die Anfrage keine ist, die Seurch inline beantwortet.

```bash
curl -H "Authorization: Api-Key seurch_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/instant/?q=100+usd+in+eur"
```

```json
{
  "query": "100 usd in eur",
  "answer": {
    "type": "currency",
    "...": "..."
  }
}
```

Wenn es keine Sofortantwort gibt:

```json
{ "query": "irgendein zufälliger Satz", "answer": null }
```

Die Struktur des `answer`-Objekts hängt vom Antwort-`type` ab (Währung, Wetter, Rechner, Einheit, …). Unter der [benutzerseitigen Liste]({{< relref "/user-guide/instant-answers" >}}) finden Sie, was übereinstimmen kann; beachten Sie, dass Auslöser mehrsprachig sind.

## Wissenskarten

```
GET /api/v1/cards/?q=...
```

Gibt das Wissenspanel für eine Anfrage zurück, abgeleitet aus demselben Web + Wikipedia-Kontext, den die Website verwendet. Akzeptiert `lang`, `safe` und `engine`.

```json
{
  "query": "inception",
  "wikipedia": { "...": "..." },
  "tmdb": { "...": "..." },
  "tripadvisor": null,
  "stackexchange": null,
  "map": null
}
```

Jede Karte ist `null`, wenn sie nicht auf die Anfrage zutrifft (nur die relevanten Karten werden befüllt, dieselbe Logik wie die Website: Eine Filmabfrage füllt `tmdb`, eine Ortsabfrage füllt `tripadvisor` und `map`, und so weiter). Die Kartenverfügbarkeit hängt auch davon ab, welche [Anbieter]({{< relref "/self-hosting/search-providers#knowledge-card-providers" >}}) die Instanz konfiguriert hat.

> [!NOTE]
> Eine einzelne `cards/`-Anfrage führt im Hintergrund eine Web-Suche plus eine Wikipedia-Suche aus (um das Thema zu erkennen), daher zählt sie als eine Suche zu Ihrer Nutzung.
