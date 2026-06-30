---
title: Produktionshinweise
weight: 10
---

# Produktionshinweise

Einige wichtige Punkte, wenn Sie Searpa für echte Benutzer betreiben.

## Das Image

- Stellt die App mit **gunicorn** (2 Worker) auf Port **8000** bereit.
- Stellt eigene statische Dateien über [WhiteNoise](https://whitenoise.readthedocs.io/) bereit, komprimiert und gehasht, sodass Sie keinen separaten statischen Dateiserver oder CDN benötigen.
- Kompiliert Übersetzungskataloge und sammelt statische Dateien **zur Build-Zeit**.
- Führt Datenbank-**Migrationen beim Start** aus.

## Reverse-Proxy und TLS

Stellen Sie einen TLS-terminierenden Reverse-Proxy davor (Caddy, nginx, Traefik, …) und leiten Sie an Port 8000 weiter. Setzen Sie:

- **`ALLOWED_HOSTS`** auf Ihre öffentlichen Hostnamen.
- **`DEBUG=False`** (der Standard); betreiben Sie nie eine öffentliche Instanz mit aktiviertem Debug.
- Einen langen, zufälligen **`SECRET_KEY`**.

## Gesundheitsprüfung

Die App antwortet auf eine Gesundheitsprüfung unter **`/up`** (gibt Erfolg zurück, wenn die App läuft). Zeigen Sie den Liveness/Readiness-Probe Ihres Orchestrators oder Ihren Load-Balancer dorthin.

```
GET /up   →  200 OK
```

## Datenbank

Verwenden Sie ein verwaltetes oder selbst gehostetes **PostgreSQL** und setzen Sie `DATABASE_URL`. Dies ist die einzige zustandsbehaftete Komponente; die Anwendung selbst ist zustandslos. Sichern Sie PostgreSQL und Sie haben die Instanz gesichert. Benutzereinstellungen, benutzerdefinierte Bangs, blockierte Websites, API-Schlüssel und Anbieter-Status-Zeilen leben alle dort.

## E-Mail

Konfigurieren Sie die `EMAIL_*`-Variablen, damit Passwort-Reset-E-Mails gesendet werden können; siehe [Benutzer & Zugang]({{< relref "users" >}}). Wenn Sie kein SMTP betreiben, erstellen und setzen Sie Passwörter stattdessen mit Verwaltungsbefehlen zurück.

## Rechtliches / Fußzeilen-Links

Keine Datenschutzrichtlinie, Nutzungsbedingungen oder rechtliche Hinweise werden standardmäßig geliefert; ihr Inhalt hängt davon ab, **wer die Instanz betreibt** und der lokalen Rechtsordnung. Fügen Sie Ihre eigenen mit `FOOTER_LINKS` hinzu:

```
FOOTER_LINKS=Datenschutz=https://example.com/privacy,Impressum=https://example.com/impressum
```

Siehe [Konfiguration → Fußzeilen-Links]({{< relref "configuration#footer-links" >}}).

## Skalierung

Searpa ist eine Standard-zustandslose Django-App, sodass Sie mehrere App-Container hinter Ihrem Proxy betreiben können, die alle auf dasselbe PostgreSQL zeigen. Führen Sie die [geplanten Wartungsbefehle]({{< relref "maintenance" >}}) von einem einzigen Ort aus (einem Cron-Host oder einer geplanten Aufgabe), nicht auf jeder Instanz.

## Bilder-Proxy und ausgehender Datenverkehr

Wenn Benutzer das [Bilder-Proxy]({{< relref "/de/user-guide/settings" >}}) aktivieren, werden Vorschaubilder über den Server abgerufen; berücksichtigen Sie diesen ausgehenden Datenverkehr. Alle Anbieteraufrufe sind ausgehendes HTTPS vom Server; wenn Sie hinter einer Zulassungsliste sind, sehen Sie die [Anbieter-Hosts]({{< relref "search-providers#network-allowlist" >}}).
