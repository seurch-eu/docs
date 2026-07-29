---
title: Points de terminaison méta
weight: 8
---

# Points de terminaison méta

Assistants pour la complétion automatique, l'état de santé des fournisseurs, l'introspection de clé et la découverte de points de terminaison. La racine, `status/` et `key/` **ne comptent pas** dans votre usage mensuel de recherches (ils comptent quand même contre la limite de débit brute).

## Suggestions

Suggestions de complétion automatique de la barre de recherche pour une requête. *(Compte comme une recherche.)*

```
GET /api/v1/suggest/?q=...
```

```bash
curl -H "Authorization: Api-Key seurch_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/suggest/?q=clim"
```

```json
{
  "query": "clim",
  "suggestions": ["climat", "changement climatique", "escalade"]
}
```

## Statut des fournisseurs

État actuel (opérationnel/hors service) de chaque fournisseur amont configuré, les données derrière la page `/status`. *(Ne compte pas dans l'usage.)*

```
GET /api/v1/status/
```

```json
{
  "providers": [
    {
      "slug": "brave",
      "name": "Brave",
      "group": "web",
      "monitor": "query",
      "state": "up",
      "checked_at": "2026-06-30T09:00:00Z",
      "last_ok_at": "2026-06-30T09:00:00Z",
      "last_error": "",
      "source": ""
    }
  ]
}
```

- `monitor` — comment le statut a été déterminé : `query` (observé depuis des recherches réelles) ou `probe` (vérification de santé active).
- `state` — `up`, `down`, ou `unknown` (rien d'observé encore).

Un fournisseur sans clé API configurée est omis (masqué, pas affiché comme hors service).

## Informations sur la clé

Détails de la clé effectuant la requête, pratique pour vérifier qu'une clé fonctionne. *(Ne compte pas dans l'usage.)*

```
GET /api/v1/key/
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

Le secret n'est jamais renvoyé, uniquement le préfixe et les métadonnées.

## Racine API

Un index de chaque point de terminaison disponible (URL absolues), utile pour la découverte. *(Ne compte pas dans l'usage.)*

```
GET /api/v1/
```

```json
{
  "web_search": "https://search.example.com/api/v1/web/",
  "image_search": "https://search.example.com/api/v1/images/",
  "similar_image_search": "https://search.example.com/api/v1/images/similar/",
  "news_search": "https://search.example.com/api/v1/news/",
  "video_search": "https://search.example.com/api/v1/videos/",
  "maps": "https://search.example.com/api/v1/maps/",
  "translate": "https://search.example.com/api/v1/translate/",
  "translate_languages": "https://search.example.com/api/v1/translate/languages/",
  "instant": "https://search.example.com/api/v1/instant/",
  "cards": "https://search.example.com/api/v1/cards/",
  "suggest": "https://search.example.com/api/v1/suggest/",
  "status": "https://search.example.com/api/v1/status/",
  "key": "https://search.example.com/api/v1/key/"
}
```
