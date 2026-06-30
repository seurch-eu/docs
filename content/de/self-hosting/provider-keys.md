---
title: API-Schlüssel erhalten
weight: 5
---

# API-Schlüssel erhalten

Schritt-für-Schritt-Anleitungen zum Erhalten des Schlüssels jedes Anbieters. Keiner ist erforderlich, um Searpa zu starten, aber mindestens eine **Web-Suchmaschine** (Brave ist am einfachsten) wird für nützliche Ergebnisse benötigt. Jeder Anbieter, den Sie überspringen, blendet seinen Tab oder seine Karte einfach aus; unter [Suchanbieter]({{< relref "search-providers" >}}) finden Sie, was jeder aktiviert.

Sobald Sie einen Schlüssel haben, setzen Sie die entsprechende Umgebungsvariable (siehe [Konfiguration]({{< relref "configuration" >}})) und starten Sie die App neu.

> [!NOTE]
> Alle haben ein **kostenloses Kontingent**, das für eine persönliche oder kleine Team-Instanz großzügig genug ist; Searpa cached aggressiv und ruft die kostenpflichtigen Karten-APIs nur auf, wenn eine Anfrage tatsächlich übereinstimmt. Die geteilten Schlüssel (`public` für Marginalia, anonymes Stack Exchange) benötigen überhaupt keine Anmeldung.

## Brave Search — `BRAVE_API_KEY`

Betreibt die **Web-, Bilder-, Nachrichten- und Videos**-Tabs von einem Schlüssel. Dies ist der Anbieter, den Sie zuerst einrichten sollten.

1. Gehen Sie zur [Brave Search API](https://brave.com/search/api/)-Website und **registrieren Sie sich** beim API-Dashboard.
2. Fügen Sie den **Data for Search**-Plan hinzu und wählen Sie das **kostenlose** Kontingent (fragt nach einer Karte zur Verifizierung, das kostenlose Kontingent wird aber nicht berechnet).
3. Öffnen Sie **API-Schlüssel** im Dashboard und **generieren Sie einen Schlüssel**.
4. Kopieren Sie ihn in `BRAVE_API_KEY`.

## Brave Suggest (Autocomplete) — `BRAVE_SUGGEST_API_KEY`

Aktiviert Autocomplete-Vorschläge in der Suchleiste. Dies ist ein **separates Abonnement** vom obigen Suchschlüssel mit eigenem Schlüssel.

1. Im gleichen [Brave API-Dashboard](https://brave.com/search/api/) abonnieren Sie den **Autosuggest**-Plan (kostenloses Kontingent verfügbar).
2. Generieren Sie einen Schlüssel für dieses Abonnement.
3. Kopieren Sie ihn in `BRAVE_SUGGEST_API_KEY`.

Nicht gesetzt bedeutet ohne Autocomplete betreiben; alles andere funktioniert noch.

## Mojeek — `MOJEEK_API_KEY`

Fügt den unabhängigen **Mojeek**-Web-Index zum Web-Tab hinzu.

1. Besuchen Sie die [Mojeek Search API](https://www.mojeek.com/services/search/api/)-Seite und **beantragen Sie API-Zugang** (ein kostenloses Kontingent ist verfügbar).
2. Nach der Genehmigung kopieren Sie den ausgestellten Schlüssel.
3. Setzen Sie ihn als `MOJEEK_API_KEY`.

## Marginalia — `MARGINALIA_API_KEY`

Fügt den nicht-kommerziellen **Marginalia**-Small-Web-Index hinzu. **Keine Anmeldung erforderlich.**

- Der Literalwert **`public`** ist ein kostenloser geteilter Schlüssel und der Standard in `.env.example`, begrenzt auf etwa **1 Anfrage alle 5 Sekunden**.
- Für ein höheres, nicht geteiltes Kontingent fordern Sie einen persönlichen Schlüssel auf der [Marginalia API-Seite](https://about.marginalia-search.com/article/api/) an.

```bash
MARGINALIA_API_KEY=public   # funktioniert sofort
```

## Pixabay (Bilder) — `PIXABAY_API_KEY`

Mischt lizenzfreie **Pixabay**-Bilder in den Bilder-Tab.

1. Erstellen Sie ein kostenloses Konto bei [Pixabay](https://pixabay.com/).
2. Öffnen Sie angemeldet die [Pixabay API-Dokumentation](https://pixabay.com/api/docs/); Ihr persönlicher API-Schlüssel wird oben auf dieser Seite angezeigt.
3. Kopieren Sie ihn in `PIXABAY_API_KEY`.

## World News API (Nachrichten) — `WORLDNEWS_API_KEY`

Mischt Artikel der [World News API](https://worldnewsapi.com/) in den Nachrichten-Tab.

1. Registrieren Sie sich bei [worldnewsapi.com](https://worldnewsapi.com/) (der kostenlose Plan gewährt ein tägliches Punktekontingent).
2. Öffnen Sie Ihr **Konto-Dashboard** und kopieren Sie den **API-Schlüssel**.
3. Setzen Sie ihn als `WORLDNEWS_API_KEY`.

## TMDB (Film / TV-Karte) — `TMDB_API_KEY`

Aktiviert die Film / TV-[Wissenskarte]({{< relref "/de/user-guide/knowledge-cards" >}}).

1. Erstellen Sie ein kostenloses Konto bei [The Movie Database](https://www.themoviedb.org/).
2. Gehen Sie zu **Einstellungen → API** ([direkter Link](https://www.themoviedb.org/settings/api)) und beantragen Sie einen **Entwickler**-Schlüssel (sofort, kostenlos; Sie füllen ein kurzes Formular aus).
3. Kopieren Sie den **API-Schlüssel (v3 auth)**-Wert in `TMDB_API_KEY`.

## TripAdvisor (Orte-Karte) — `TRIPADVISOR_API_KEY`

Aktiviert die Restaurant / Hotel / Attraktionskarte.

1. Registrieren Sie sich für die [TripAdvisor Content API](https://www.tripadvisor.com/developers).
2. Erstellen Sie im Entwicklerportal einen **API-Schlüssel** (das kostenlose Kontingent enthält ein monatliches Anrufkontingent).
3. Kopieren Sie ihn in `TRIPADVISOR_API_KEY`.

> [!NOTE]
> Die TripAdvisor Content API verlangt die Anzeige von TripAdvisor-Attributionen, wo ihre Daten erscheinen, was Searpas Karte bereits tut. Sie können den Schlüssel in deren Portal auch auf die IP Ihres Servers beschränken.

## Stack Exchange (Q&A-Karte) — `STACKEXCHANGE_API_KEY`

Aktiviert die Stack Exchange-Fragen-und-Antworten-Karte. **Ein Schlüssel ist optional.**

- **Ohne Schlüssel** verwendet Searpa das gemeinsame anonyme Kontingent (10.000 Anfragen/Tag geteilt zwischen allen anonymen Aufrufern), was für geringen Datenverkehr ausreicht.
- **Mit einem Schlüssel** erhalten Sie ein dediziertes, viel höheres Kontingent:

  1. Registrieren Sie eine App bei [Stack Apps → Register OAuth](https://stackapps.com/apps/oauth/register) (verwenden Sie die URL Ihrer Instanz; Sie benötigen den OAuth-Fluss nicht).
  2. Kopieren Sie den generierten **Schlüssel**.
  3. Setzen Sie ihn als `STACKEXCHANGE_API_KEY`.

## Anbieter, die keinen Schlüssel benötigen

Diese funktionieren sofort, ohne Konto oder Schlüssel:

| Anbieter | Verwendet für |
|----------|--------------|
| **OpenStreetMap / Nominatim** | Der Karten-Tab und Karten-Schnellantworten |
| **Wikipedia / Wikidata** | Die Wikipedia-Wissenskarte und Themenerkennung |
| **Sepia / PeerTube** | Der ergänzende Anbieter des Videos-Tabs |
| **Open-Meteo** | Die Wetter-Sofortantwort |
| **Frankfurter** | Die Währungs-Sofortantwort |

Der Übersetzen-Tab ist die einzige schlüssellose Funktion, die dennoch **Infrastruktur** benötigt: eine LibreTranslate-Instanz, auf die Sie Searpa zeigen; siehe [Übersetzung]({{< relref "translation" >}}).

## Nach dem Hinzufügen von Schlüsseln

1. Legen Sie jeden Wert in Ihrer Umgebung (oder `.env`) fest; siehe [Konfiguration]({{< relref "configuration" >}}).
2. Starten Sie die App neu, damit sie die neuen Variablen aufnimmt.
3. Überprüfen Sie die **`/status`**-Seite (oder den [`status/` API-Endpunkt]({{< relref "/de/api/meta#provider-status" >}})), um zu bestätigen, dass jeder Anbieter als gesund gemeldet wird.
