---
title: API
weight: 30
bookCollapseSection: true
---

# API-Anleitung

Jede Searpa-Suchfunktion – Web, Bilder, Nachrichten, Videos, Karten, Übersetzen, Sofortantworten, Wissenskarten, Vorschläge und Anbieterstatus – ist programmatisch über eine JSON-API verfügbar. Derselbe Dienst bedient sowohl die API als auch die Website, sodass beide immer die gleichen Ergebnisse zurückgeben.

Die API ist mit [Django REST Framework](https://www.django-rest-framework.org/) gebaut und unter **`/api/v1/`** eingehängt.

> [!IMPORTANT]
> Die öffentliche API ist eine **selbst-gehostete** Funktion. Sie wird mit der Open-Source-Engine geliefert und ist auf jeder Instanz verfügbar, die Sie [selbst betreiben]({{< relref "/self-hosting" >}}). Der gehostete Dienst unter [searpa.eu](https://searpa.eu/) stellt sie **nicht** bereit; um die API zu nutzen, betreiben Sie Ihre eigene Instanz und erstellen Sie dort einen Schlüssel.

## Basis-URL

```
https://search.example.com/api/v1/
```

Die nachfolgenden Beispiele verwenden `search.example.com` als Platzhalter; ersetzen Sie ihn durch den Host Ihrer eigenen Instanz.

## Auf einen Blick

- **Authentifizierung:** Jede Anfrage benötigt einen benutzerspezifischen [API-Schlüssel]({{< relref "authentication" >}}).
- **Zustandslos:** Die Optionen, die die Website in einem Cookie hält (Suchmaschine, SafeSearch, Sprache, Zeitbereich, Seite), sind einfache Abfrageparameter, sodass eine Anfrage vollständig durch ihre URL beschrieben wird.
- **Ratenbegrenzt:** Pro Schlüssel, mit einem [Burst- und täglichen Limit]({{< relref "rate-limits" >}}).
- **Nur JSON:** Jeder Endpunkt gibt JSON zurück.

## Eine erste Anfrage

```bash
curl -H "Authorization: Api-Key searpa_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/web/?q=klima&lang=de"
```

## In dieser Anleitung

| Seite | Inhalt |
|-------|--------|
| [Authentifizierung]({{< relref "authentication" >}}) | API-Schlüssel erhalten und senden |
| [Ratenlimits]({{< relref "rate-limits" >}}) | Burst / Sustained-Limits, `429`, Nutzungserfassung |
| [Konventionen]({{< relref "conventions" >}}) | Gemeinsame Abfrageparameter und Antwortstruktur |
| [Such-Endpunkte]({{< relref "search" >}}) | `web/`, `images/`, `news/`, `videos/`, `images/similar/` |
| [Karten]({{< relref "maps" >}}) | Geokodierung und umgekehrte Geokodierung |
| [Übersetzen]({{< relref "translate" >}}) | Text übersetzen und Sprachen auflisten |
| [Sofortantworten & Karten]({{< relref "instant-cards" >}}) | Sofortantworten und Wissenskarten |
| [Meta-Endpunkte]({{< relref "meta" >}}) | `suggest/`, `status/`, `key/`, und die API-Wurzel |
| [Fehler]({{< relref "errors" >}}) | Statuscodes und Fehlerbodies |

> [!NOTE]
> Die In-App-Entwicklerseite unter **`/api/`** verlinkt auf diese Dokumentation und zum Schlüsselmanager. Eine [Insomnia](https://insomnia.rest/)-Sammlung der Endpunkte wird im Repository geliefert (`scripts/searpa-api.insomnia.json`).
