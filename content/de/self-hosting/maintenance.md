---
title: Wartung
weight: 9
---

# Wartung

Searpa benötigt wenig laufende Pflege, aber einige **Verwaltungsbefehle** halten es ordentlich und aktuell. Führen Sie diese nach einem Zeitplan aus (ein Cron-Job, ein systemd-Timer oder die Funktion für geplante Aufgaben Ihres Orchestrators). Führen Sie jeden im Container aus (`docker exec <container> python manage.py …`) oder via `make` / `uv run` aus dem Quellcode.

## Geplante Aufgaben

| Befehl | Was er tut | Empfohlener Zeitplan |
|--------|-----------|----------------------|
| `clear_expired_cache` | Löscht abgelaufene Suchergebnis-Cache-Zeilen | Täglich |
| `check_provider_health` | Prüft Anbieter mit einem kostenlosen Gesundheits-Endpunkt, damit `/status` aktuell bleibt, ohne kostenpflichtiges Kontingent zu verbrauchen | Alle ~10 Minuten |
| `refresh_currency` | Aktualisiert gecachte Wechselkurse und bereinigt den Sofortantwort-Cache | Täglich (optional, aktualisiert sich auch bei Bedarf selbst) |

Ein Cron-Beispiel:

```cron
# Täglich 03:00: abgelaufene Cache-Einträge löschen
0 3 * * *  cd /app && python manage.py clear_expired_cache

# Alle 10 Minuten: die /status-Seite aktuell halten
*/10 * * * *  cd /app && python manage.py check_provider_health
```

Die `make`-Äquivalente aus dem Quellcode sind `make refresh-currency` und die obigen `manage.py`-Befehle.

## Einmalige / gelegentliche Aufgaben

### Bang-Definitionen

Die [Bangs]({{< relref "/user-guide/bangs" >}})-Datenbank (die Tausenden von `!Verknüpfungen`) wird aus dem [Open-Source-Bang-Repository von Kagi](https://github.com/kagisearch/bangs) heruntergeladen:

```bash
python manage.py fetch_bangs        # oder: make bangs
```

Führen Sie dies einmal bei der Einrichtung aus und gelegentlich erneut, um neue Bang-Definitionen aufzunehmen. Wenn die Bang-Daten fehlen, werden Bangs einfach als normaler Abfragetext behandelt.

### Datenbankmigrationen

Der Container wendet Migrationen automatisch bei jedem Start an, sodass ein normales Upgrade einfach das Ziehen eines neueren Images und ein Neustart ist. Um sie manuell auszuführen:

```bash
python manage.py migrate
```

## Upgrade

1. Ziehen Sie das neue Image (oder bauen Sie aus den neuesten Quellen neu).
2. Starten Sie den Container neu; Migrationen werden automatisch beim Booten ausgeführt.
3. Wenn die Versionshinweise neue Bang-Daten oder Anbieter erwähnen, führen Sie `fetch_bangs` aus und überprüfen Sie neue [Konfigurations]({{< relref "configuration" >}})-Variablen.

Da die App abgesehen von PostgreSQL zustandslos ist, ist ein Rolling-Restart sicher; halten Sie Ihre Datenbank wie üblich gesichert.

## Caching

Suchergebnisse werden kurzzeitig auf dem Server gecacht (etwa eine Stunde), um schnell zu bleiben und die Last bei Anbietern zu verringern; der Cache ist auf die Anfrage, nicht auf einen Benutzer, bezogen. `clear_expired_cache` entfernt veraltete Einträge, damit die Tabelle nicht unbegrenzt wächst.
