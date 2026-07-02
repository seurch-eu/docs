---
title: Searpa Dokumentation
type: docs
bookToc: false
---

# Searpa Dokumentation

**Searpa** ist eine datenschutzorientierte [Metasuchmaschine](https://de.wikipedia.org/wiki/Metasuchmaschine): Eine Suchanfrage kombiniert die besten Ergebnisse aus mehreren unabhängigen Quellen auf einer sauberen, schnellen Seite – ohne Tracking, ohne Werbung und ohne Profilerstellung. Die Suchmaschine ist Open Source, sodass jeder ihre Funktionsweise prüfen oder eine eigene Instanz betreiben kann.

Diese Dokumentation richtet sich an drei Zielgruppen:

### [Benutzerhandbuch]({{< relref "/user-guide" >}})

Alles, was Sie brauchen, um Searpa optimal zu nutzen: Web-Suche, die Tabs Bilder / Nachrichten / Videos / Karten / Übersetzen, Sofortantworten, Wissenskarten, Bangs und Kontoeinstellungen.
→ Beginnen Sie mit [Erste Schritte]({{< relref "/user-guide/getting-started" >}}).

### [Selbst-Hosting-Anleitung]({{< relref "/self-hosting" >}})

Betreiben Sie Ihre eigene Searpa-Instanz. Voraussetzungen, Docker-Schnellstart, alle Konfigurationsoptionen, Einbindung von Suchanbieterern, Benutzerverwaltung und API-Schlüssel sowie Hinweise zu Produktion und Wartung.
→ Beginnen Sie mit dem [Schnellstart]({{< relref "/self-hosting/quick-start" >}}).

### [API-Anleitung]({{< relref "/api" >}})

Nutzen Sie alle Searpa-Suchfunktionen programmatisch über eine JSON-API: Authentifizierung, Ratenlimits und eine Referenz für jeden Endpunkt mit kopierbaren `curl`- und Python-Beispielen.
→ Beginnen Sie mit der [API-Übersicht]({{< relref "/api" >}}).

## Was Searpa macht

- **Web-Suche über drei Suchmaschinen**: Brave, Mojeek und Marginalia. Aktivieren Sie eine beliebige Teilmenge; wenn mehrere aktiv sind, werden ihre Ergebnislisten per Reciprocal Rank Fusion zusammengeführt und dedupliziert, sodass ein Ergebnis, über das sich mehrere Suchmaschinen einig sind, nach oben steigt.
- **Bilder-, Nachrichten-, Video-, Karten- und Übersetzen**-Tabs, jeweils von unabhängigen Anbietern unterstützt.
- **Sofortantworten** über den Ergebnissen: Rechner, Einheiten- und Währungsumrechnung, Wetter, Weltzeit, QR-Codes, Hashes und mehr – die meisten lokal auf dem Server berechnet.
- **Wissenskarten** neben den Ergebnissen, aus Wikipedia, TMDB, TripAdvisor und Stack Exchange.
- **Kontoeinstellungen**, die geräteübergreifend synchronisiert werden, mit Export und Import.
- Eine **öffentliche JSON-API**, die alle diese Funktionen abdeckt.

## Datenschutz in einem Satz

Searpa verfolgt Sie nicht, zeigt keine Werbung und erstellt kein Profil. API-Schlüssel für vorgelagerte Anbieter bleiben auf dem Server und werden nie an Ihren Browser übermittelt; Anfragen werden ohne Identifizierung an Anbieter gesendet.
