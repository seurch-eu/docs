---
title: Sofortantworten
weight: 4
---

# Sofortantworten

Bei häufigen Dienstprogramm-Anfragen zeigt Searpa eine **Sofortantwort** ganz oben in den Web-Ergebnissen an, sodass Sie die Antwort erhalten, ohne durchklicken zu müssen. Dies ist im Geiste der Sofortantworten von DuckDuckGo.

Fast jede Sofortantwort wird **lokal auf dem Server** berechnet, ohne Beteiligung Dritter und ohne Weitersenden Ihrer Anfrage.

## Was Sie fragen können

| Kategorie | Beispiel-Anfragen |
|-----------|------------------|
| Rechner | `2+2`, `sqrt(16)*3`, `15% von 200` |
| Einheitenumrechnung | `5 km in Meilen`, `100 f in c`, `2 Tassen in ml` |
| Basisumrechnung | `0xff in dezimal`, `255 in binär` |
| Farbe | `#4f46e5`, `rgb(255,128,0)`, `color picker` |
| Weltzeit | `Zeit in Tokio`, `wie spät ist es in New York` |
| QR-Code | `qr code https://example.com` |
| Hash / UUID | `md5 hallo`, `sha256 von test`, `uuid` |
| Passwort | `Passwortgenerator`, `sicheres Passwort` |
| Unix-Zeit | `unix timestamp`, `1700000000 in Datum` |
| Kodieren / Dekodieren | `base64 kodieren hallo`, `url dekodieren foo%20bar` |
| JSON / Regex | `json formatieren`, `regex tester` |
| HTTP / Ports | `http 404`, `port 443` |
| Zufallsgeneratoren | `2d6 würfeln`, `Münze werfen`, `Zufallszahl 1-100` |
| Timer | `Timer 5 Minuten`, `Stoppuhr` |
| Meine IP | `wie lautet meine IP` |

## Mehrsprachige Auslöser

Sofortantworten funktionieren in **sieben Sprachen**: Englisch, Französisch, Deutsch, Spanisch, Italienisch, Portugiesisch und Niederländisch. Zum Beispiel funktionieren alle diese:

- `météo à Paris` (Wetter)
- `wie spät ist es in Berlin` (Weltzeit)
- `100 dólares a euros` (Währung)
- `255 en binaire` (Basisumrechnung)

## Die zwei, die das Netzwerk nutzen

Zwei Sofortantworten rufen Live-Daten, kostenlos und offen, ab (und speichern sie im Cache); sie benötigen daher eine Netzwerkverbindung auf dem Server:

- **Währung** – `100 usd in eur`. Wechselkurse stammen von [Frankfurter](https://frankfurter.dev/) (Daten der Europäischen Zentralbank), einmal abgerufen und 24 Stunden gecacht; jedes Währungspaar wird dann lokal abgeleitet. Ein einen Tag alter Kurs wird verwendet, wenn der Feed kurzzeitig nicht erreichbar ist.
- **Wetter** – `Wetter in Berlin`. Aktuelle Bedingungen und eine 7-Tages-Vorhersage von [Open-Meteo](https://open-meteo.com/), eine Stunde gecacht.

Alles andere in der obigen Tabelle wird vollständig offline beantwortet.
