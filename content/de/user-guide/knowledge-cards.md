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
| **Orte** | [TripAdvisor](https://www.tripadvisor.com/) | Ein Restaurant, Hotel oder eine Attraktion: Bewertung, Adresse (die zur [Karte]({{< relref "search-tabs" >}}) verlinkt) und ein Link. |
| **Q&A** | [Stack Exchange](https://stackexchange.com/) | Die beste Frage und Antwort für eine technische Anfrage. |

## Wie sie ausgewählt werden

Seurch zeigt eine Karte nur dann an, wenn Ihre Anfrage wirklich zu dieser Art von Thema passt:

- Wikipedia (und Wikidata im Hintergrund) ermittelt sprachunabhängig, **was** das Thema ist – ein Film, eine Person, ein Ort.
- Die reichhaltigeren Karten (Film, Orte, Q&A) werden nur abgerufen, wenn die Anfrage tatsächlich nach dieser Art von Sache aussieht, und der beste Treffer gewinnt; schwache Treffer werden verworfen.

Dies hält das Panel relevant und vermeidet unnötige Abfragen.

## Lazy Loading

Standardmäßig **laden die Karten kurz nach** den Hauptergebnissen via einen schnellen Hintergrundabruf, sodass eine langsame Karte Ihre Antwort nie verzögert. Sie können dies unter **Einstellungen → Suchmaschinen** ändern (Lazy Loading deaktivieren, um sie mit der Seite zu laden), und Sie können jede einzelne Kartenquelle unter **Einstellungen → Suchmaschinen → Datenquellen** ein- oder ausschalten.
