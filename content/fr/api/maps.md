---
title: Cartes
weight: 5
---

# Cartes

Géocodez un nom de lieu ou effectuez un géocodage inverse d'une paire de coordonnées, en utilisant Nominatim d'OpenStreetMap. Aucune clé de fournisseur n'est requise.

```
GET /api/v1/maps/
```

## Géocoder un nom de lieu

```
GET /api/v1/maps/?q=<lieu>&limit=<n>&lang=<code>
```

- `q` — le lieu ou l'adresse à rechercher (**requis** dans ce mode).
- `limit` — nombre maximum de résultats, `1`–`50` (par défaut `10`).
- `lang` — langue préférée pour les noms.

```bash
curl -H "Authorization: Api-Key searpa_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/maps/?q=Tour+Eiffel&limit=1"
```

```json
{
  "query": "Tour Eiffel",
  "places": [
    {
      "name": "Tour Eiffel",
      "display_name": "Tour Eiffel, Paris, France",
      "lat": 48.8584,
      "lon": 2.2945,
      "category": "tourism",
      "type": "attraction",
      "addresstype": "tourism",
      "importance": 0.82,
      "embed_url": "https://www.openstreetmap.org/export/embed.html?...",
      "mini_embed_url": "https://...",
      "osm_url": "https://www.openstreetmap.org/...",
      "directions_url": "https://www.openstreetmap.org/directions?...",
      "geo_uri": "geo:48.8584,2.2945"
    }
  ]
}
```

## Géocodage inverse de coordonnées

Passez `lat` et `lon` à la place de `q` :

```
GET /api/v1/maps/?lat=48.8584&lon=2.2945
```

- `lat`, `lon` — les coordonnées à inverser (tous deux requis pour ce mode).
- `label` (ou `q`) — un nom optionnel à attacher au lieu renvoyé.

```json
{
  "query": "",
  "places": [
    { "name": "...", "display_name": "...", "lat": 48.8584, "lon": 2.2945, "...": "..." }
  ]
}
```

Chaque lieu inclut des `embed_url` / `mini_embed_url` prêts à l'emploi (pour une carte intégrée), `osm_url`, `directions_url` et un `geo_uri`, ce qui vous permet de renvoyer directement vers une carte ou des itinéraires.
