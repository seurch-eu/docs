---
title: Authentification
weight: 1
---

# Authentification

Chaque requête API doit comporter une **clé API** valide. Les clés sont émises par utilisateur ; une requête sans clé reçoit `401`, et une requête avec une clé incorrecte ou révoquée est rejetée.

> [!IMPORTANT]
> L'API est une fonctionnalité [auto-hébergée]({{< relref "/self-hosting" >}}), donc les clés sont émises sur **votre propre instance**, pas sur le service hébergé seurch.eu.

## Obtenir une clé

Sur votre instance :

- **Dans l'interface web :** **Paramètres → Clés API**, créez une clé (nommez-la optionnellement). La clé complète est affichée **une seule fois** ; copiez-la immédiatement.
- **Depuis la ligne de commande** (administrateurs) :
  `python manage.py create_api_key <nom_utilisateur> --name "mon script"`, voir [Gestion des clés API]({{< relref "/self-hosting/api-keys" >}}).

Une clé ressemble à :

```
seurch_sk_<préfixe>.<secret>
```

Seul un préfixe et un hachage du secret sont stockés côté serveur, de sorte qu'une clé perdue ne peut pas être récupérée, uniquement révoquée et remplacée.

## Envoyer une clé

Envoyez la clé dans l'en-tête `Authorization`. `Api-Key` est le schéma documenté ; `Bearer` est accepté comme synonyme.

```bash
curl -H "Authorization: Api-Key seurch_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climat"
```

Un en-tête `X-Api-Key` est également accepté, utile là où vous ne pouvez pas définir `Authorization` :

```bash
curl -H "X-Api-Key: seurch_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climat"
```

### Python

```python
import requests

BASE = "https://search.example.com/api/v1"
HEADERS = {"Authorization": "Api-Key seurch_sk_<préfixe>.<secret>"}

r = requests.get(f"{BASE}/web/", params={"q": "climat", "lang": "fr"}, headers=HEADERS)
r.raise_for_status()
print(r.json()["results"])
```

## Vérifier une clé

Appelez le point de terminaison [`key/`]({{< relref "meta#key" >}}) pour confirmer qu'une clé fonctionne et voir ses métadonnées (ce point de terminaison ne **compte pas** dans votre usage) :

```bash
curl -H "Authorization: Api-Key seurch_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/key/"
```

```json
{
  "name": "mon script",
  "prefix": "seurch_sk_1a2b3c4d",
  "created_at": "2026-06-01T10:00:00Z",
  "last_used_at": "2026-06-30T09:15:00Z",
  "revoked": false
}
```

> [!WARNING]
> Gardez les clés secrètes ; quiconque en possède une peut rechercher à votre place et consommer votre limite de débit. Le préfixe de marque `seurch_sk_` permet aux scanners de secrets de détecter une clé compromise. Révoquez une clé compromise et émettez-en une nouvelle.
