---
title: Wissenskarten
weight: 5
---

# Wissenskarten

Wenn Ihre **Web**-Suche (erste Seite) ein bekanntes Thema betrifft, zeigt Seurch bis zu drei **Wissenskarten** neben den Ergebnissen an – eine Schnellzusammenfassung, sodass Sie oft nicht durchklicken müssen.

## Die Karten

| Karte | Quelle | Zeigt |
|-------|--------|-------|
| **Wikipedia** | Wikipedia | Eine Zusammenfassung, ein Bild und einen Link zum Thema. Dies ist die Ankerkarte; sie hilft auch zu erkennen, was die anderen Karten zeigen sollen. |
| **Film / TV** | [TheTVDB](https://thetvdb.com/) | Details zu einem Film oder einer TV-Sendung: Poster, Bewertung, Jahr, Übersicht. |
| **Orte** | [TripAdvisor](https://www.tripadvisor.com/) | Ein Restaurant, Hotel oder eine Attraktion: sein Gebiet, die Bewertung und die Anzahl der Rezensionen, eine kurze Beschreibung und die Adresse (die zur [Karte]({{< relref "search-tabs" >}}) verlinkt). |
| **Q&A** | [Stack Exchange](https://stackexchange.com/) | Die beste Frage und Antwort für eine technische Anfrage. |

## Wie sie ausgewählt werden

Seurch zeigt eine Karte nur dann an, wenn Ihre Anfrage wirklich zu dieser Art von Thema passt:

- Wikipedia (und Wikidata im Hintergrund) ermittelt sprachunabhängig, **was** das Thema ist – ein Film, eine Person, ein Ort.
- Die reichhaltigeren Karten (Film, Orte, Q&A) werden nur abgerufen, wenn die Anfrage tatsächlich nach dieser Art von Sache aussieht, und der beste Treffer gewinnt; schwache Treffer werden verworfen.

Dies hält das Panel relevant und vermeidet unnötige Abfragen.

## Lazy Loading

Die Karten **laden kurz nach** den Hauptergebnissen via einen schnellen Hintergrundabruf, sodass eine langsame Karte Ihre Antwort nie verzögert. Es gibt nichts zu konfigurieren: Führt Ihr Browser JavaScript aus, treffen die Karten einen Moment nach den Ergebnissen ein, andernfalls werden sie mit der Seite gerendert.

Sie können jede einzelne Kartenquelle unter **Einstellungen → Suchmaschinen** ein- oder ausschalten, wo sie bei den **Datenquellen** des Suchtyps Web stehen, siehe [Einstellungen]({{< relref "settings" >}}).
