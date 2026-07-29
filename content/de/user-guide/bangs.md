---
title: Bangs
weight: 6
---

# Bangs

**Bangs** sind `!Verknüpfungen`, die Sie in das Suchfeld eingeben, um eine Anfrage direkt zu einer anderen Website oder einem anderen Seurch-Tab zu senden. Seurch versteht das weit verbreitete DuckDuckGo-Bang-Vokabular mit Tausenden von Websites sowie einige eigene.

Die Bang-Definitionen stammen aus dem [Open-Source-Bang-Repository von Kagi](https://github.com/kagisearch/bangs), derselben community-gepflegten `!bang`-Liste, die Kagi veröffentlicht. Selbst-Hoster können diese mit `make bangs` aktualisieren; siehe [Wartung]({{< relref "/self-hosting/maintenance#bang-definitions" >}}).

Ein Bang kann überall in der Anfrage stehen; der Rest des Textes sind die Suchbegriffe.

## Website-Bangs

Stellen Sie einer Anfrage den Bang einer Website voran, um direkt auf dieser Website zu suchen:

| Sie tippen | Geht zu |
|------------|---------|
| `!w einstein` | Wikipedia-Artikelsuche nach „Einstein" |
| `!gh hugo` | GitHub-Suche nach „Hugo" |
| `!yt lofi` | YouTube-Suche nach „Lofi" |
| `!a kopfhörer` | Amazon-Suche |

Es gibt Tausende davon. Wenn ein Bang nicht erkannt wird, behandelt Seurch ihn einfach als Teil Ihrer normalen Anfrage.

## Tab-Bangs

Eine Handvoll Bangs springt zu einem der eigenen [Tabs]({{< relref "search-tabs" >}}) von Seurch, anstatt die Website zu verlassen:

| Bang(s) | Tab |
|---------|-----|
| `!web` | Web |
| `!images`, `!i` | Bilder |
| `!news`, `!n` | Nachrichten |
| `!videos`, `!v` | Videos |
| `!maps`, `!m` | Karten |
| `!translate` | Übersetzen |

Zum Beispiel führt `!i golden retriever` eine Bildsuche durch, ohne die Tabs manuell wechseln zu müssen.

## Der „Lucky"-Bang

Ein einzelnes `!` (zum Beispiel `! beste Espressomaschine`) ist der **Lucky**-Bang; er bringt Sie direkt zum besten Ergebnis für Ihre Anfrage.

## Benutzerdefinierte Bangs

Sie können Ihre **eigenen** Bangs unter **Einstellungen → Bangs** definieren. Geben Sie jedem einen Auslöser und eine URL-Vorlage, und er funktioniert genau wie die eingebauten. Benutzerdefinierte Bangs werden in Ihrem Konto gespeichert und folgen Ihnen geräteübergreifend.
