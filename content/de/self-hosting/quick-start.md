---
title: Schnellstart
weight: 2
---

# Schnellstart

Der schnellste Weg zu einer laufenden Instanz ist das Docker-Image. Sie benötigen eine PostgreSQL-Datenbank und mindestens einen [Brave Search API-Schlüssel]({{< relref "search-providers" >}}).

## Mit Docker

```bash
docker run -p 8000:8000 \
  -e SECRET_KEY=ihr-langer-zufaelliger-schluessel \
  -e DATABASE_URL=postgres://benutzer:passwort@db-host:5432/seurch \
  -e ALLOWED_HOSTS=search.example.com \
  -e BRAVE_API_KEY=ihr-brave-schluessel \
  -e BRAVE_SUGGEST_API_KEY=ihr-brave-suggest-schluessel \
  -e MARGINALIA_API_KEY=public \
  seurch
```

Beim Start:

1. Wendet Datenbank-**Migrationen** an (kein Vorgang, wenn das Schema aktuell ist).
2. Stellt die App mit **gunicorn** (2 Worker) auf Port **8000** bereit.
3. Stellt eigene statische Dateien über [WhiteNoise](https://whitenoise.readthedocs.io/) bereit (komprimiert und gehasht), kein separater Webserver oder CDN erforderlich.
4. Antwortet auf eine Gesundheitsprüfung unter **`/up`**.

Die Übersetzungskataloge und statischen Dateien werden beim Build kompiliert, sodass nichts weiteres gestartet werden muss.

Stellen Sie einen TLS-terminierenden Reverse-Proxy (Caddy, nginx, Traefik, …) vor Port 8000 und setzen Sie `ALLOWED_HOSTS` auf Ihre Domain. Siehe [Produktionshinweise]({{< relref "production" >}}).

### Ersten Benutzer erstellen

Die App hat **keine öffentliche Registrierung**, erstellen Sie also ein Konto, bevor Sie sich anmelden können:

```bash
docker exec -it <container> python manage.py createsuperuser
```

Weitere Informationen unter [Benutzer & Zugang]({{< relref "users" >}}).

## Mit Docker Compose

Ein minimales `compose.yaml` mit der Datenbank neben der App:

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_DB: seurch
      POSTGRES_USER: seurch
      POSTGRES_PASSWORD: aendern-sie-mich
    volumes:
      - pgdata:/var/lib/postgresql/data

  app:
    image: seurch
    depends_on: [db]
    ports:
      - "8000:8000"
    environment:
      SECRET_KEY: ihr-langer-zufaelliger-schluessel
      DATABASE_URL: postgres://seurch:aendern-sie-mich@db:5432/seurch
      ALLOWED_HOSTS: search.example.com
      BRAVE_API_KEY: ihr-brave-schluessel
      BRAVE_SUGGEST_API_KEY: ihr-brave-suggest-schluessel
      MARGINALIA_API_KEY: public

volumes:
  pgdata:
```

```bash
docker compose up -d
docker compose exec app python manage.py createsuperuser
```

Siehe [Konfiguration]({{< relref "configuration" >}}) für die vollständige Liste der Umgebungsvariablen und [Suchanbieter]({{< relref "search-providers" >}}) für die Schlüssel, die jeden Tab und jede Karte aktivieren.

## Aus dem Quellcode

Um das Image selbst zu bauen oder lokal zu entwickeln, klonen Sie das Seurch-Repository und verwenden Sie den mitgelieferten Workflow:

```bash
cp .env.example .env        # dann mindestens BRAVE_API_KEY hinzufügen
make setup                  # Abhängigkeiten installieren, Dev-Dienste starten, migrieren, i18n kompilieren
make run                    # Dev-Server unter http://localhost:8000
make superuser              # Konto erstellen
```

`make setup` startet einen Dev-Stack (PostgreSQL + ein Mail-Catcher + LibreTranslate) via Podman Compose, sodass Sie direkt einen funktionierenden Übersetzen-Tab erhalten. Führen Sie `make` ohne Argumente aus, um alle Ziele aufzulisten. Bauen Sie ein Produktions-Image mit:

```bash
docker build -t seurch .
```

> [!WARNING]
> Setzen Sie in der Produktion immer einen langen, zufälligen **`SECRET_KEY`** und eine echte **`DATABASE_URL`**, und setzen Sie **`DEBUG=False`** (der Standard, wenn nicht gesetzt). Der Wert in `.env.example` ist nur für die lokale Entwicklung.
