---
title: Voraussetzungen
weight: 1
---

# Voraussetzungen

## Laufzeitumgebung

| Komponente | Hinweise |
|------------|----------|
| **Eine Container-Laufzeitumgebung** | Docker oder Podman, um das veröffentlichte Image auszuführen. |
| **PostgreSQL** | Die Anwendungsdatenbank. Jedes halbwegs aktuelle PostgreSQL (16+) funktioniert. |
| **Ein Brave Search API-Schlüssel** | Das Minimum für nützliche Ergebnisse; siehe [Suchanbieter]({{< relref "search-providers" >}}). Das kostenlose Kontingent reicht zum Starten. |
| **Ausgehendes HTTPS** | Der Server ruft vorgelagerte Anbieter ab; wenn Sie hinter einer Zulassungsliste sind, sehen Sie die [Anbieter-Hosts]({{< relref "search-providers#network-allowlist" >}}). |

Alles andere – Webserver, Bereitstellung statischer Dateien und Kompilierung der Übersetzungskataloge – ist im Image enthalten.

## Optional

| Komponente | Ermöglicht |
|------------|-----------|
| **Eine LibreTranslate-Instanz** | Den [Übersetzen]({{< relref "translation" >}})-Tab. |
| **Anbieter-API-Schlüssel** (Mojeek, Marginalia, Staan, TheTVDB, TripAdvisor, Stack Exchange, Pixabay, World News) | Zusätzliche Suchmaschinen, Medienanbieter und Wissenskarten. |
| **Ein SMTP-Server** | Passwort-Reset-E-Mail. Ohne ihn sind Benutzer ohne Passwort ausgesperrt; siehe [Benutzer & Zugang]({{< relref "users" >}}). |

## Für die lokale Entwicklung aus dem Quellcode

Wenn Sie aus dem Quellcode bauen oder entwickeln möchten, anstatt das veröffentlichte Image zu verwenden, benötigen Sie auch:

- **Python 3.13+**
- [**uv**](https://github.com/astral-sh/uv) für die Abhängigkeitsverwaltung
- **Podman** mit **podman-compose** (der Dev-Stack enthält eine Compose-Datei mit PostgreSQL, einem Mail-Catcher und LibreTranslate)
- **Node.js 22+** *nur* wenn Sie die Stile bearbeiten möchten; das kompilierte CSS und die Icons sind committet, sodass App und Image keine Node-Laufzeit benötigen

Das `make setup`-Skript des Repositories bootstrapt all das in einem Schritt. Siehe [Schnellstart]({{< relref "quick-start#from-source" >}}).
