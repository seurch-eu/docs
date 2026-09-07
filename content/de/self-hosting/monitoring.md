---
title: Überwachung
weight: 10
---

# Überwachung

Seurch stellt seinen Gesundheitszustand auf drei Ebenen bereit, die unterschiedliche Fragen beantworten. Überwachen Sie mindestens die ersten beiden: Zusammen unterscheiden sie „die Anwendung ist ausgefallen“ von „die Anwendung läuft, ein vorgelagerter Anbieter ist ausgefallen“.

| Endpunkt | Beantwortete Frage | Zielgruppe |
|----------|--------------------|------------|
| `/up` | Liefert der Anwendungsprozess aus? | Die Liveness-Probe Ihres Orchestrators |
| `/status/health` | Funktionieren die vorgelagerten Anbieter? | Ein externer Überwachungsdienst |
| `/status` | Welcher Anbieter ist ausgefallen, und seit wann? | Angemeldete Benutzer |

## Anwendungs-Liveness — `/up`

Wird vor der Host-Validierung beantwortet und funktioniert daher aus dem Container-Netzwerk heraus, siehe [Produktionshinweise]({{< relref "production" >}}). Er weiß nichts über Anbieter: Eine Instanz, bei der jeder Anbieter ausfällt, antwortet hier weiterhin mit `200`, weil die Anwendung selbst in Ordnung ist.

## Anbieter-Gesundheit — `/status/health`

Das maschinenlesbare Gegenstück zur [Statusseite](#die-statusseite), für einen externen Überwachungsdienst wie [phare.io](https://phare.io), Better Stack oder Uptime Kuma. Er antwortet **200**, solange alles Überwachte läuft, und **500**, sobald etwas ausfällt — genau darauf alarmieren diese Dienste.

```
GET /status/health   →  200 OK
```

```json
{ "status": "ok", "watched": 8, "operational": 6, "down": [], "unknown": 2 }
```

| Situation | Antwort |
|-----------|---------|
| Alle überwachten Anbieter laufen (oder wurden noch nie beobachtet) | **200** `{"status": "ok", …}` |
| Ein oder mehrere überwachte Anbieter ausgefallen | **500** `{"status": "down", "down": ["brave"], …}` |
| Datenbank nicht erreichbar | **500** `{"status": "error", "detail": "database unavailable"}` |
| `STATUS_MONITOR_PROVIDERS` trifft auf nichts zu | **500** `{"status": "error", "detail": "no providers watched"}` |
| Deaktiviert mit `STATUS_MONITOR_ENABLED=false` | **404** |
| Falsches oder fehlendes `STATUS_MONITOR_TOKEN` | **403** |

Sowohl `/status/health` als auch `/status/health/` antworten, sodass ein ohne abschließenden Schrägstrich konfigurierter Monitor nie über eine Weiterleitung geschickt wird.

### Eine Prüfung pro Anbieter

`/status/health/<anbieter>` antwortet für einen einzigen vorgelagerten Dienst, sodass Ihr Überwachungsdienst eine eigene Prüfung pro Anbieter halten kann und eine Warnung benennt, *was* kaputt ist, statt „irgendetwas“.

```
GET /status/health/brave   →  200 OK
```

```json
{
  "status": "ok",
  "provider": "brave",
  "state": "up",
  "checked_at": "2026-09-01T09:00:00Z",
  "last_ok_at": "2026-09-01T09:00:00Z"
}
```

| Situation | Antwort |
|-----------|---------|
| Anbieter läuft | **200** `"state": "up"` |
| Anbieter ausgefallen | **500** `"state": "down"` |
| Noch nie beobachtet | **200** `"state": "unknown"` |
| Hier nicht konfiguriert, oder unbekannter Name | **404** |

Eine URL pro Anbieter:

| Anbieter | Endpunkt |
|----------|----------|
| Brave | `/status/health/brave` |
| Mojeek | `/status/health/mojeek` |
| Marginalia | `/status/health/marginalia` |
| Staan | `/status/health/staan` |
| Pixabay | `/status/health/pixabay` |
| Sepia | `/status/health/sepia` |
| World News API | `/status/health/worldnews` |
| Wikipedia | `/status/health/wikipedia` |
| Wikidata | `/status/health/wikidata` |
| TheTVDB | `/status/health/thetvdb` |
| TripAdvisor | `/status/health/tripadvisor` |
| Stack Exchange | `/status/health/stackexchange` |
| Open-Meteo (Wetter) | `/status/health/weather` |
| Frankfurter (Währungen) | `/status/health/currency` |
| OpenStreetMap / Nominatim | `/status/health/openstreetmap` |
| LibreTranslate | `/status/health/translate` |

Ein Anbieter, den Sie nicht konfiguriert haben, liefert **404**, nicht 200: Es gibt nichts zu berichten, und eine grüne Prüfung für einen Anbieter, der gar nicht angebunden ist, wäre schlimmer als eine offensichtlich kaputte. Richten Sie Prüfungen also nur für die Anbieter ein, die Sie tatsächlich betreiben.

### Auswählen, was die Sammelprüfung überwacht

`STATUS_MONITOR_PROVIDERS` beschränkt `/status/health` auf die Anbieter, für die es sich lohnt, jemanden zu wecken. Es nimmt Anbieter-Kennungen (die Tabelle oben) und/oder die Gruppenschlüssel `engine`, `media`, `cards`, `instant`, `maps` und `translate`:

```
# Nur für die Suchmaschinen selbst alarmieren
STATUS_MONITOR_PROVIDERS=engine

# Die Suchmaschinen plus Geokodierung
STATUS_MONITOR_PROVIDERS=engine,openstreetmap
```

Leer lassen (Standard), um jeden konfigurierten Anbieter zu überwachen. Namen, die auf nichts zutreffen, werden ignoriert, sodass ein Tippfehler nicht den Rest Ihrer Liste verwirft — trifft aber *keiner* zu, meldet der Endpunkt das als Fehler statt als Entwarnung, denn ein Monitor, der wegen eines Tippfehlers dauerhaft grün steht, ist schlimmer als gar kein Monitor.

Das beschränkt nur die Sammelprüfung. Jeder `/status/health/<anbieter>`-Endpunkt benennt seinen Anbieter und antwortet immer für ihn.

### Ein Token verlangen

Die Endpunkte sind **bewusst nicht authentifiziert** — ein Überwachungsdienst kann sich nicht anmelden. Setzen Sie `STATUS_MONITOR_TOKEN`, um ein gemeinsames Geheimnis zu verlangen, das auf drei Wegen gesendet werden kann:

```bash
curl "https://search.example.com/status/health?token=<secret>"
curl -H "X-Monitor-Token: <secret>" https://search.example.com/status/health
curl -H "Authorization: Bearer <secret>" https://search.example.com/status/health
```

Alles Falsche erhält ein `403`. `STATUS_MONITOR_ENABLED=false` entfernt die Endpunkte vollständig (`404`).

### Was die Antworten sagen und was nicht

- **Unbekannt ist nicht ausgefallen.** Die meisten Anbieter melden sich nur, wenn jemand sucht; ein nie beobachteter Anbieter gilt daher weder als laufend noch als ausgefallen. Erst ein aufgezeichneter Fehlschlag färbt eine Prüfung rot, sonst könnte eine ruhige Instanz nie grün werden.
- **Ein Datenbankfehler ist ein Ausfall.** Lassen sich die Statuszeilen nicht lesen, antwortet der Endpunkt mit 500 — eine Instanz, die PostgreSQL nicht erreicht, kann auch keine Suche ausliefern.
- **Sie sagen was, nicht warum.** Der Rumpf benennt die ausgefallenen Anbieter; der Fehlertext des Anbieters bleibt auf der Statusseite, hinter der Anmeldung.
- Jede Antwort ist JSON (auch die 404er) und trägt `Cache-Control: no-store`, sodass kein Proxy ein veraltetes Urteil ausliefert.

## Die Statusseite

`/status` ist die für Menschen gedachte Ansicht derselben Daten: eine Zeile je konfiguriertem Anbieter, wie sein Zustand ermittelt wurde und wann er zuletzt funktionierte. Sie ist aus der Fußzeile der Website und aus **Einstellungen → Anbieterstatus** verlinkt und erfordert eine Anmeldung.

Sie gibt dafür nie bezahltes Kontingent aus, siehe [Suchanbieter]({{< relref "search-providers" >}}) dazu, wie der Zustand jedes Anbieters ermittelt wird, und [Wartung]({{< relref "maintenance" >}}) für den Zeitplan der Sonden, der sie aktuell hält.

### Sie abschalten

Setzen Sie `STATUS_PAGE_ENABLED=false`, wenn Sie lieber nicht veröffentlichen möchten, welche Anbieter Ihre Instanz nutzt und wann sie ausfallen. Dann:

- `/status` liefert **404**, und die Links darauf in der Fußzeile und in den Einstellungen verschwinden.
- Der [`status/`]({{< relref "/api/meta" >}})-Endpunkt der API, der dieselben Daten liefert, gibt ebenfalls 404 zurück und fällt aus dem API-Wurzelindex heraus.
- Die Gesundheit wird weiterhin **aufgezeichnet** und bleibt lesbar, in der Datenbank und über die Überwachungsendpunkte oben.

> [!NOTE]
> `STATUS_MONITOR_ENABLED` ist unabhängig von `STATUS_PAGE_ENABLED` — das ist der Sinn. Eine Instanz, die die Seite nicht veröffentlicht, lässt sich trotzdem überwachen.

## Übersicht der Einstellungen

| Variable | Zweck | Standard |
|----------|-------|----------|
| `STATUS_PAGE_ENABLED` | Die `/status`-Seite und den `status/`-Endpunkt der API veröffentlichen | `true` |
| `STATUS_MONITOR_ENABLED` | `/status/health` und `/status/health/<anbieter>` ausliefern | `true` |
| `STATUS_MONITOR_TOKEN` | Gemeinsames Geheimnis für diese Endpunkte | *(leer, offen)* |
| `STATUS_MONITOR_PROVIDERS` | Welche Anbieter die Sammelprüfung überwacht | *(leer, alle konfigurierten)* |
