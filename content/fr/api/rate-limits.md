---
title: Limites de débit
weight: 2
---

# Limites de débit

Chaque clé API dispose de son propre budget, appliqué par **deux limites qui s'appliquent ensemble**. Une requête doit satisfaire les deux :

| Limite | Par défaut | Rôle |
|--------|------------|------|
| **Burst** | `60/min` | Plafond à court terme, protège les fournisseurs amont d'un client incontrôlé. |
| **Sustained** | `5000/day` | Plafonne le volume quotidien total. |

Sur une instance auto-hébergée, ces valeurs sont configurables avec `API_THROTTLE_BURST` et `API_THROTTLE_SUSTAINED`, voir [Configuration]({{< relref "/self-hosting/configuration#public-api-rate-limits" >}}).

## Lorsque vous dépassez une limite

Dépasser l'une ou l'autre limite renvoie :

```
HTTP 429 Too Many Requests
```

```json
{ "detail": "Request was throttled. Expected available in 12 seconds." }
```

DRF inclut un indice `Retry-After` dans le message ; reculez et réessayez après le délai indiqué. Un client robuste devrait gérer `429` avec un recul exponentiel.

## Comptabilité des usages

Chaque requête de **recherche** compte dans le total mensuel de recherches du propriétaire de la clé (le même total affiché pour les recherches sur le site web dans Paramètres). Une recherche **web** compte une fois par moteur interrogé : une requête sur quatre moteurs en ajoute donc quatre ; tout autre point d'accès compte pour une. Cela inclut :

`web/`, `images/`, `images/similar/` (uniquement lorsqu'une vraie recherche s'exécute), `news/`, `videos/`, `maps/`, `translate/`, `translate/languages/`, `instant/`, `cards/` et `suggest/`.

Les points de terminaison **méta** ne **comptent pas** dans l'usage :

- La racine API (`/api/v1/`)
- `status/`
- `key/`

Vous pouvez donc interroger `key/` ou `status/` librement pour vérifier l'état de santé sans dépenser votre budget de recherches (ils comptent quand même contre la limite de débit brute).
