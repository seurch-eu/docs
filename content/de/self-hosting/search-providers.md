---
title: Suchanbieter
weight: 4
---

# Suchanbieter

Seurch kombiniert Ergebnisse von mehreren unabhängigen Anbietern. **Welche Tabs und Karten erscheinen, hängt davon ab, welche Schlüssel Sie setzen.** Ein Anbieter ohne Schlüssel wird ausgeblendet; der betroffene Tab oder die Karte erscheint einfach nicht, anstatt einen Fehler anzuzeigen.

Alle vorgelagerten Aufrufe erfolgen **serverseitig**; Schlüssel werden nie an den Browser weitergegeben.

Diese Seite bietet den **Überblick** darüber, welcher Schlüssel was aktiviert. Schritt-für-Schritt-Anweisungen zur Anmeldung bei jedem Anbieter finden Sie unter [API-Schlüssel erhalten]({{< relref "provider-keys" >}}).

## Die Basis: Brave

| Variable | Schlüssel erhalten |
|----------|-------------------|
| `BRAVE_API_KEY` | [brave.com/search/api](https://brave.com/search/api/) (kostenloses Kontingent verfügbar) |
| `BRAVE_SUGGEST_API_KEY` | Gleiche Stelle, ein **separates** Abonnement für Autocomplete |

Brave ist der empfohlene Ausgangspunkt: Ein einzelner Schlüssel betreibt die **Web-, Bilder-, Nachrichten- und Videos**-Tabs. Ohne konfigurierte Web-Suchmaschine zeigen diese Tabs einen Konfigurationshinweis anstelle von Ergebnissen.

## Zusätzliche Web-Suchmaschinen

Fügen Sie eine oder beide hinzu, um weitere unabhängige Indizes in den Web-Tab einzumischen (zusammengeführt mit Reciprocal Rank Fusion; siehe [Web-Suche]({{< relref "/user-guide/web-search" >}})):

| Variable | Anbieter | Schlüssel erhalten |
|----------|----------|-------------------|
| `MOJEEK_API_KEY` | Mojeek (unabhängiger britischer Index) | [mojeek.com/services/search/api](https://www.mojeek.com/services/search/api/) |
| `MARGINALIA_API_KEY` | Marginalia (Small-Web-Index) | Keine Anmeldung; der Literalwert `public` ist ein kostenloser geteilter Schlüssel (begrenzt auf ~1 Anfrage / 5 s). Für ein höheres Kontingent auf [marginalia-search.com](https://about.marginalia-search.com/article/api/) anfragen |

## Medienanbieter

Jeder Medien-Tab mischt Brave mit einem zweiten Anbieter. Der ergänzende Anbieter ist auch die **einzige** Quelle für die Mojeek/Marginalia-Suchmaschinen, die keine eigene Mediensuche haben.

| Tab | Variable | Anbieter | Schlüssel |
|-----|----------|----------|----------|
| Bilder | `PIXABAY_API_KEY` | [Pixabay](https://pixabay.com/api/docs/) | Kostenlos |
| Nachrichten | `WORLDNEWS_API_KEY` | [World News API](https://worldnewsapi.com/) | Kostenloses Kontingent |
| Videos | *(keiner)* | [Sepia](https://sepiasearch.org/) / PeerTube | Kein Schlüssel erforderlich |

**Karten** benötigt überhaupt keinen Schlüssel; es verwendet OpenStreetMaps Nominatim.

## Wissenskarten-Anbieter

Der Web-Tab kann bis zu drei [Wissenskarten]({{< relref "/user-guide/knowledge-cards" >}}) seitlich anzeigen:

| Karte | Variable | Anbieter | Schlüssel |
|-------|----------|----------|----------|
| Wikipedia | *(keiner)* | Wikipedia / Wikidata | Kein Schlüssel erforderlich |
| Film / TV | `TMDB_API_KEY` | [TMDB](https://www.themoviedb.org/settings/api) | Kostenlos |
| Orte | `TRIPADVISOR_API_KEY` | [TripAdvisor Content API](https://www.tripadvisor.com/developers) | Kostenlos |
| Q&A | `STACKEXCHANGE_API_KEY` | [Stack Exchange](https://stackapps.com/apps/oauth/register) | Optional, erhöht das gemeinsame anonyme Kontingent |

Die kostenpflichtigen Karten-APIs werden nur aufgerufen, wenn eine Anfrage tatsächlich wie ein Film oder ein Ort aussieht, und jeder Abruf wird eine Stunde gecacht, sodass sie innerhalb kostenloser Kontingente bleiben.

## Anbieter-Statusseite

Eine eingebaute **`/status`**-Seite zeigt, ob jeder konfigurierte vorgelagerte Anbieter erreichbar ist. Sie verbraucht dabei nie kostenpflichtiges Kontingent:

- Anbieter mit einem **kostenlosen Gesundheits-Endpunkt** (Nominatim, LibreTranslate, Open-Meteo, Frankfurter) werden planmäßig abgefragt.
- Der Status jedes anderen Anbieters wird davon abgeleitet, ob **echte Suchen** kürzlich erfolgreich waren.

Halten Sie den Status aktuell, indem Sie `check_provider_health` regelmäßig ausführen; siehe [Wartung]({{< relref "maintenance" >}}).

## Netzwerk-Zulassungsliste

Wenn der ausgehende Datenverkehr Ihres Servers eingeschränkt ist, benötigen die zwei **Sofortantwort**-Netzwerkaufrufe diese Hosts auf der Zulassungsliste:

- `api.frankfurter.dev` (Wechselkurse)
- `geocoding-api.open-meteo.com` und `api.open-meteo.com` (Wetter)

Alles andere wird über Standard-HTTPS zum API-Host jedes Anbieters erreicht. Die lokalen Sofortantworten (Mathematik, Einheiten, Hashes, …) benötigen überhaupt kein Netzwerk.
