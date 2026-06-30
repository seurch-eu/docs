---
title: Web-Suche
weight: 2
---

# Web-Suche

Der **Web**-Tab ist das Herzstück von Searpa. Er kann auf drei unabhängige Web-Indizes zurückgreifen und alles, was Sie aktivieren, in einer einzigen Rangliste zusammenführen.

## Die drei Suchmaschinen

| Suchmaschine | Beschreibung |
|--------------|--------------|
| **Brave** | Ein großer unabhängiger Web-Index (unterstützt auch Bilder, Nachrichten und Videos). |
| **Mojeek** | Ein unabhängiger britischer Suchindex mit eigenem Crawler. |
| **Marginalia** | Ein nicht-kommerzieller Index, der sich auf das kleine, nicht-kommerzielle Web konzentriert. |

Sie wählen die zu verwendenden Suchmaschinen unter **Einstellungen → Suchmaschinen** aus. Aktivieren Sie nur eine für eine einzige Quelle oder mehrere, um sie zu kombinieren. Alle drei sind standardmäßig aktiviert.

## Wie Ergebnisse zusammengeführt werden

Wenn mehr als eine Suchmaschine Ergebnisse liefert, führt Searpa diese mit **Reciprocal Rank Fusion (RRF)** zusammen, anstatt die Listen einfach zu verketten:

- Jede Ergebnis-URL erhält Punkte basierend auf ihrer Platzierung in jeder Suchmaschine, die sie zurückgegeben hat.
- Dieselbe URL aus mehreren Suchmaschinen wird zu **einem** Eintrag zusammengefasst, und ihre Punkte addieren sich, sodass eine Seite, über die sich mehrere Suchmaschinen einig sind, nach oben steigt.
- Jedes zusammengeführte Ergebnis zeigt, **welche Suchmaschinen** dazu beigetragen haben, sodass Sie sehen können, wann es suchmaschinenübergreifende Übereinstimmung gibt.

Der Effekt: Breite, bekannte Ergebnisse, die alle anzeigen, werden gut platziert, während die einzigartigen Funde aus einem einzelnen Index (besonders Marginalias Small-Web-Ergebnisse) dennoch erscheinen.

## Eine Suche verfeinern

- **Zeitbereich** – Filtern Sie nach dem letzten Tag, der letzten Woche, dem letzten Monat oder Jahr.
- **SafeSearch** – Standardmäßig aktiviert; deaktivieren Sie es in den [Einstellungen]({{< relref "settings" >}}), um auch Ergebnisse für Erwachsene einzubeziehen.
- **Rechtschreibkorrekturen** – Wenn eine Anfrage falsch geschrieben zu sein scheint, schlägt Searpa eine Korrektur über den Ergebnissen vor.
- **Paginierung** – Blättern Sie am unteren Ende der Liste durch weitere Ergebnisse.
- **Sprachen** – Legen Sie eine bevorzugte Suchsprache in den Einstellungen fest oder lassen Sie sie auf *Auto*, um Ihren Browser zu verwenden.

## Websites blockieren

Sie können Ergebnisse von Domains ausblenden, die Sie nie sehen möchten. Fügen Sie diese unter **Einstellungen → Suchmaschinen** (blockierte Websites) hinzu; übereinstimmende Ergebnisse werden aus jeder Web-Suche herausgefiltert. Diese Liste wird in Ihrem Konto gespeichert.

## Bangs

Geben Sie einen `!Bang` irgendwo in Ihre Anfrage ein, um sie umzuleiten; zum Beispiel bringt `!w einstein` Sie direkt zu Wikipedia, und `!images Sonnenuntergang` springt zum Bilder-Tab. Weitere Details unter [Bangs]({{< relref "bangs" >}}).
