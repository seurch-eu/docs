---
title: Instantané et fiches
weight: 7
---

# Réponses instantanées et fiches de connaissance

Ces deux points de terminaison reproduisent les réponses en ligne et les panneaux latéraux du site web. Leur contenu variant selon le type de réponse et le fournisseur, ils renvoient du **JSON de forme fournisseur** plutôt qu'un schéma fixe par champ ; traitez les structures comme des données et lisez les champs dont vous avez besoin.

## Réponses instantanées

```
GET /api/v1/instant/?q=...
```

Renvoie la réponse instantanée pour une requête utilitaire (calculs, conversion d'unités/base/couleur, météo, devise, horloge mondiale, hachages, QR, « quelle est mon IP », …), ou `null` lorsque la requête n'est pas une réponse inline de Searpa.

```bash
curl -H "Authorization: Api-Key searpa_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/instant/?q=100+usd+en+eur"
```

```json
{
  "query": "100 usd en eur",
  "answer": {
    "type": "currency",
    "...": "..."
  }
}
```

Lorsqu'il n'y a pas de réponse instantanée :

```json
{ "query": "phrase quelconque", "answer": null }
```

La structure de l'objet `answer` dépend du `type` de réponse (devise, météo, calculatrice, unité, …). Consultez la [liste côté utilisateur]({{< relref "/fr/user-guide/instant-answers" >}}) pour ce qui peut correspondre, et notez que les déclencheurs sont multilingues.

## Fiches de connaissance

```
GET /api/v1/cards/?q=...
```

Renvoie le panneau de connaissance pour une requête, dérivé du même contexte web + Wikipedia que le site web utilise. Accepte `lang`, `safe` et `engine`.

```json
{
  "query": "inception",
  "wikipedia": { "...": "..." },
  "tmdb": { "...": "..." },
  "tripadvisor": null,
  "stackexchange": null,
  "map": null
}
```

Chaque fiche est `null` lorsqu'elle ne s'applique pas à la requête (seules les fiches pertinentes sont renseignées, la même logique que le site web : une requête sur un film remplit `tmdb`, une requête sur un lieu remplit `tripadvisor` et `map`, etc.). La disponibilité des fiches dépend aussi des [fournisseurs]({{< relref "/fr/self-hosting/search-providers#knowledge-card-providers" >}}) configurés sur l'instance.

> [!NOTE]
> Une seule requête `cards/` effectue une recherche web plus une consultation Wikipedia en arrière-plan (pour détecter le sujet), donc elle compte comme une recherche dans votre usage.
