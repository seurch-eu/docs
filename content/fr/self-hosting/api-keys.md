---
title: Clés API
weight: 8
---

# Clés API

Les utilisateurs accèdent à l'[API publique]({{< relref "/fr/api" >}}) avec des clés API par utilisateur. Les utilisateurs peuvent gérer leurs propres clés dans l'interface web (**Paramètres → Clés API**), et vous pouvez les gérer depuis la ligne de commande.

## Comment les clés sont stockées

Une clé ressemble à `searpa_sk_<préfixe>.<secret>` :

- Le **préfixe** (8 caractères) est stocké en clair pour une recherche rapide.
- Seul un **hachage SHA-256** du secret est stocké, jamais le secret lui-même.

Ainsi, la valeur complète d'une clé est affichée **exactement une fois**, à la création, et ne peut pas être récupérée par la suite, uniquement révoquée.

## Gestion en ligne de commande

Exécutez ces commandes à l'intérieur du conteneur (`docker exec -it <conteneur> …`) ou via `uv run python manage.py …` depuis les sources.

### Créer une clé

```bash
python manage.py create_api_key <nom_utilisateur> --name "mon script"
```

La clé complète est affichée une fois. Copiez-la immédiatement, elle ne peut plus être affichée ensuite.

### Lister les clés

```bash
python manage.py list_api_keys [--user <nom_utilisateur>]
```

Affiche le nom de chaque clé, son préfixe, l'heure de création et de dernière utilisation, et si elle est révoquée, jamais le secret.

### Révoquer une clé

```bash
python manage.py revoke_api_key searpa_sk_<préfixe>
```

Une clé révoquée est rejetée immédiatement à la prochaine requête.

## Limites de débit

Chaque clé est limitée par deux limites qui s'appliquent ensemble : un plafond **burst** à court terme et un plafond **sustained** journalier, configurés avec `API_THROTTLE_BURST` et `API_THROTTLE_SUSTAINED`. Dépasser l'une ou l'autre renvoie HTTP `429`. Voir [Configuration]({{< relref "configuration#public-api-rate-limits" >}}) et la page [Limites de débit de l'API]({{< relref "/fr/api/rate-limits" >}}).

## Comptabilité des usages

Chaque recherche effectuée via l'API compte dans le **total mensuel de recherches** du propriétaire de la clé (affiché à l'utilisateur dans Paramètres), exactement comme les recherches effectuées sur le site web. Les points de terminaison méta de l'API (`/`, `status/`, `key/`) ne comptent **pas**.
