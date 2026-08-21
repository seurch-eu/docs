---
title: Points de terminaison de recherche
weight: 4
---

# Points de terminaison de recherche

Les points de terminaison essentiels : recherche web, d'images, d'actualités et de vidéos, plus l'assistant « images similaires ». Tous acceptent les [paramètres partagés]({{< relref "conventions" >}}) (`q`, `engine`, `safe`, `lang`, `page`, `date`).

## Recherche web

```
GET /api/v1/web/?q=...
```

```bash
curl -H "Authorization: Api-Key seurch_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climat&engine=all&lang=fr&date=w"
```

```json
{
  "query": "climat",
  "tab": "web",
  "page": 1,
  "engine": ["brave", "mojeek", "marginalia", "staan"],
  "correction": "",
  "results": [
    {
      "title": "Changement climatique",
      "url": "https://example.org/climat",
      "description": "...",
      "display_url": "example.org",
      "favicon_url": "https://...",
      "age": "il y a 2 jours",
      "source": "all",
      "source_label": "Mojeek · Marginalia · Staan",
      "sitelinks": []
    }
  ]
}
```

- `source` / `source_label` — quels moteurs ont renvoyé le résultat. `brave` / `mojeek` / `marginalia` / `staan` pour un seul moteur, `both` lorsque deux s'accordent, ou `all` à partir de trois. `source_label` est la forme lisible, les noms joints par ` · `. Brave en est délibérément absent : ses conditions d'attribution n'autorisent à le nommer qu'avec leur traitement de logo exact, le libellé ne nomme donc que les autres moteurs.
- `correction` — une correction orthographique suggérée, ou `""`.

## Recherche d'images

```
GET /api/v1/images/?q=...
```

```json
{
  "query": "golden retriever",
  "tab": "images",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://example.com/page",
      "source": "example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

### Images similaires

Reproduit la grille « images similaires » de la lightbox du site web, une recherche d'images alimentée par la légende d'une image ouverte.

```
GET /api/v1/images/similar/?q=<légende>&query=<requête-page>&exclude_url=<url>
```

- `q` — la légende de l'image ouverte (la graine principale).
- `query` — la requête de la page, utilisée comme graine de secours.
- `exclude_url` — exclut l'image ouverte des résultats.

Fournissez `q` et/ou `query` (au moins l'un). La réponse répercute la requête `seed` réellement utilisée :

```json
{
  "query": "golden retriever chiot",
  "engine": ["brave"],
  "results": [ { "title": "...", "url": "...", "source": "...", "thumbnail": "..." } ]
}
```

Une vraie recherche d'images (et un comptage d'usage) n'a lieu que lorsqu'une graine utilisable est trouvée.

## Recherche d'actualités

```
GET /api/v1/news/?q=...
```

```json
{
  "query": "élections",
  "tab": "news",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://news.example.com/article",
      "description": "...",
      "age": "il y a 3 heures",
      "source": "Example News",
      "hostname": "news.example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

## Recherche de vidéos

```
GET /api/v1/videos/?q=...
```

```json
{
  "query": "tutoriel hugo",
  "tab": "videos",
  "page": 1,
  "engine": ["brave"],
  "results": [
    {
      "title": "...",
      "url": "https://video.example.com/watch",
      "age": "il y a 1 mois",
      "source": "...",
      "duration": "12:34",
      "hostname": "video.example.com",
      "thumbnail": "https://.../thumb.jpg"
    }
  ]
}
```

> [!NOTE]
> Chaque champ de résultat a une valeur vide par défaut, de sorte qu'un fournisseur qui omet un champ produit une valeur vide (par ex. `""` ou `[]`) plutôt qu'une clé manquante.
