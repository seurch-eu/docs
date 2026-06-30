---
title: Selbst-Hosting
weight: 20
bookCollapseSection: true
---

# Selbst-Hosting-Anleitung

Searpas Suchmaschine ist **Open Source**, sodass Sie Ihre eigene Instanz betreiben und der einzige Betreiber sein können, der jemals die Daten Ihrer Benutzer berührt. Diese Anleitung richtet sich an Administratoren, die Searpa einsetzen und betreiben.

Eine Instanz ist eine einzelne [Django](https://www.djangoproject.com/)-Anwendung, die auf **PostgreSQL** basiert. Sie wird als Docker-Image geliefert, das seine eigenen statischen Dateien bereitstellt und beim Start Datenbankmigrationen ausführt, sodass eine minimale Bereitstellung aus einem Container plus einer Datenbank besteht.

## In dieser Anleitung

| Seite | Inhalt |
|-------|--------|
| [Voraussetzungen]({{< relref "requirements" >}}) | Was Sie vor dem Start brauchen |
| [Schnellstart]({{< relref "quick-start" >}}) | Eine Instanz mit Docker zum Laufen bringen |
| [Konfiguration]({{< relref "configuration" >}}) | Jede Umgebungsvariable |
| [Suchanbieter]({{< relref "search-providers" >}}) | API-Schlüssel, die Suchmaschinen, Tabs und Karten aktivieren |
| [API-Schlüssel erhalten]({{< relref "provider-keys" >}}) | Schritt-für-Schritt-Anmeldung für jeden Anbieter |
| [Übersetzung]({{< relref "translation" >}}) | LibreTranslate für den Übersetzen-Tab einrichten |
| [Benutzer & Zugang]({{< relref "users" >}}) | Konten erstellen, E-Mail, Passwort zurücksetzen |
| [API-Schlüssel]({{< relref "api-keys" >}}) | API-Schlüssel für Benutzer ausstellen und widerrufen |
| [Wartung]({{< relref "maintenance" >}}) | Geplante Aufgaben, Bangs, Cache, Anbieterstatus |
| [Produktionshinweise]({{< relref "production" >}}) | Statische Dateien, Gesundheitsprüfungen, Fußzeile, E-Mail |

> [!NOTE]
> **Was Sie erhalten.** Selbst-Hosting gibt Ihnen die vollständige Searpa-Suchmaschine: jeden Tab, Sofortantworten, Wissenskarten, Einstellungen und die öffentliche API. Welche Tabs und Karten tatsächlich erscheinen, hängt davon ab, welche [Anbieter]({{< relref "search-providers" >}}) Sie konfigurieren.
