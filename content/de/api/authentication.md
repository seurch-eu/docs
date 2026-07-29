---
title: Authentifizierung
weight: 1
---

# Authentifizierung

Jede API-Anfrage muss einen gültigen **API-Schlüssel** enthalten. Schlüssel werden pro Benutzer ausgestellt; eine Anfrage ohne einen erhält `401`, und eine Anfrage mit einem schlechten oder widerrufenen Schlüssel wird abgelehnt.

> [!IMPORTANT]
> Die API ist eine [selbst-gehostete]({{< relref "/self-hosting" >}}) Funktion, daher werden Schlüssel auf **Ihrer eigenen Instanz** ausgestellt, nicht beim gehosteten seurch.eu-Dienst.

## Einen Schlüssel erhalten

Auf Ihrer Instanz:

- **In der Web-UI:** **Einstellungen → API-Schlüssel**, erstellen Sie einen Schlüssel (optional benennen). Der vollständige Schlüssel wird **einmal** angezeigt; kopieren Sie ihn sofort.
- **Über die Befehlszeile** (Administratoren):
  `python manage.py create_api_key <benutzername> --name "mein Skript"`, siehe [API-Schlüssel ausstellen]({{< relref "/self-hosting/api-keys" >}}).

Ein Schlüssel sieht aus wie:

```
seurch_sk_<präfix>.<geheimnis>
```

Nur ein Präfix und ein Hash des Geheimnisses werden serverseitig gespeichert, sodass ein verlorener Schlüssel nicht wiederhergestellt, nur widerrufen und ersetzt werden kann.

## Einen Schlüssel senden

Senden Sie den Schlüssel im `Authorization`-Header. `Api-Key` ist das dokumentierte Schema; `Bearer` wird als Synonym akzeptiert.

```bash
curl -H "Authorization: Api-Key seurch_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/web/?q=klima"
```

Ein `X-Api-Key`-Header wird ebenfalls akzeptiert, nützlich dort, wo Sie `Authorization` nicht setzen können:

```bash
curl -H "X-Api-Key: seurch_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/web/?q=klima"
```

### Python

```python
import requests

BASE = "https://search.example.com/api/v1"
HEADERS = {"Authorization": "Api-Key seurch_sk_<präfix>.<geheimnis>"}

r = requests.get(f"{BASE}/web/", params={"q": "klima", "lang": "de"}, headers=HEADERS)
r.raise_for_status()
print(r.json()["results"])
```

## Einen Schlüssel verifizieren

Rufen Sie den [`key/`]({{< relref "meta#key" >}})-Endpunkt auf, um zu bestätigen, dass ein Schlüssel funktioniert, und um seine Metadaten zu sehen (dieser Endpunkt zählt **nicht** zu Ihrer Nutzung):

```bash
curl -H "Authorization: Api-Key seurch_sk_<präfix>.<geheimnis>" \
  "https://search.example.com/api/v1/key/"
```

```json
{
  "name": "mein Skript",
  "prefix": "seurch_sk_1a2b3c4d",
  "created_at": "2026-06-01T10:00:00Z",
  "last_used_at": "2026-06-30T09:15:00Z",
  "revoked": false
}
```

> [!WARNING]
> Halten Sie Schlüssel geheim; jeder, der einen hat, kann in Ihrem Namen suchen und Ihr Ratenlimit verbrauchen. Das Markenpräfix `seurch_sk_` ermöglicht es Secret-Scannern, einen kompromittierten Schlüssel zu erkennen. Widerrufen Sie einen kompromittierten Schlüssel und stellen Sie einen neuen aus.
