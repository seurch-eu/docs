---
title: API-Schlüssel
weight: 8
---

# API-Schlüssel

Benutzer greifen auf die [öffentliche API]({{< relref "/api" >}}) mit benutzerspezifischen API-Schlüsseln zu. Benutzer können ihre eigenen Schlüssel in der Web-UI verwalten (**Einstellungen → API-Schlüssel**), und Sie können sie über die Befehlszeile verwalten.

## Wie Schlüssel gespeichert werden

Ein Schlüssel sieht aus wie `seurch_sk_<präfix>.<geheimnis>`:

- Das **Präfix** (8 Zeichen) wird im Klartext für die schnelle Suche gespeichert.
- Nur ein **SHA-256-Hash** des Geheimnisses wird gespeichert, nie das Geheimnis selbst.

Daher wird der vollständige Wert eines Schlüssels **genau einmal** angezeigt, bei der Erstellung, und kann danach nicht wiederhergestellt, nur widerrufen werden.

## Befehlszeilen-Verwaltung

Führen Sie diese Befehle im Container aus (`docker exec -it <container> …`) oder via `uv run python manage.py …` aus dem Quellcode.

### Schlüssel erstellen

```bash
python manage.py create_api_key <benutzername> --name "mein Skript"
```

Der vollständige Schlüssel wird einmal ausgegeben. Kopieren Sie ihn sofort; er kann nicht erneut angezeigt werden.

### Schlüssel auflisten

```bash
python manage.py list_api_keys [--user <benutzername>]
```

Zeigt den Namen jedes Schlüssels, sein Präfix, die Erstellungs- und letzte Verwendungszeit und ob er widerrufen wurde, nie das Geheimnis.

### Schlüssel widerrufen

```bash
python manage.py revoke_api_key seurch_sk_<präfix>
```

Ein widerrufener Schlüssel wird bei der nächsten Anfrage sofort abgelehnt.

## Ratenlimits

Jeder Schlüssel wird durch zwei zusammen geltende Limits begrenzt: ein kurzfristiges **Burst**-Limit und ein tägliches **Sustained**-Limit, konfiguriert mit `API_THROTTLE_BURST` und `API_THROTTLE_SUSTAINED`. Das Überschreiten eines der beiden gibt HTTP `429` zurück. Siehe [Konfiguration]({{< relref "configuration#public-api-rate-limits" >}}) und die [API-Ratenlimits]({{< relref "/api/rate-limits" >}})-Seite.

## Nutzungserfassung

Jede über die API durchgeführte Suche zählt zu dem **monatlichen Suchen-Gesamtbetrag** des Schlüsselinhabers (dem Benutzer in den Einstellungen angezeigt), genau wie Suchen auf der Website. Die Meta-Endpunkte der API (`/`, `status/`, `key/`) zählen **nicht**.
