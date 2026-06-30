---
title: Conventions
weight: 3
---

# Conventions

## Paramètres de requête partagés

Les points de terminaison de recherche acceptent un ensemble commun de paramètres. Chacun correspond à une option que le site web conserve dans son cookie de préférences ; ici, ils sont explicites dans l'URL.

| Paramètre | S'applique à | Valeurs | Par défaut |
|-----------|-------------|---------|------------|
| `q` | tous les points de terminaison de recherche | La chaîne de requête (**requise**) | — |
| `engine` | web, images, actualités, vidéos, fiches | `brave`, `mojeek`, `marginalia`, ou `all` ; séparez-en plusieurs par une virgule ou un espace | `all` |
| `safe` | web, images, actualités, vidéos, fiches | `on` / `off` (`off`, `false`, `0`, `no` signifient tous off) | `on` |
| `lang` | la plupart des points de terminaison | Un code de langue, par ex. `fr`, `en` | vide (auto) |
| `page` | web, images, actualités, vidéos | Numéro de page, `1`–`50` | `1` |
| `date` | web, actualités, vidéos | Plage temporelle : `d` (jour), `w` (semaine), `m` (mois), `y` (année) | aucun |

Notes :

- **`engine`** — un nom de moteur inconnu renvoie `400` avec la liste des noms valides. Les onglets médias mélangent leur fournisseur supplémentaire (Pixabay / World News / Sepia) par-dessus Brave ; pour les moteurs Mojeek/Marginalia, ce fournisseur supplémentaire est la seule source de médias.
- **`page`** — les valeurs supérieures à `50` sont limitées à `50` (évite qu'un client ne surcharge un fournisseur), les valeurs inférieures à `1` sont limitées à `1`.

## Structure des réponses

Chaque point de terminaison renvoie du JSON. Les points de terminaison de recherche répercutent le contexte de la requête aux côtés des `results`, de sorte qu'une réponse est auto-descriptive :

```json
{
  "query": "climat",
  "tab": "web",
  "page": 1,
  "engine": ["brave", "mojeek", "marginalia"],
  "correction": "",
  "results": [ /* ... */ ]
}
```

- `query` — la requête telle que Searpa l'a interprétée.
- `tab` — le type de recherche effectuée.
- `engine` — les moteurs réellement interrogés (après résolution de `all` / des valeurs par défaut).
- `correction` — une suggestion orthographique pour la requête, ou `""` (web uniquement).
- `results` — le tableau de résultats (la structure dépend du point de terminaison).

Les fiches de connaissance et les réponses instantanées sont renvoyées sous forme de **JSON de forme fournisseur** (leur structure varie selon le fournisseur / type de réponse) ; ces points de terminaison n'ont donc pas de schéma fixe par champ, voir [Instantané et fiches]({{< relref "instant-cards" >}}).

## Méthodes HTTP

Tous les points de terminaison sont en **`GET`**, sauf `translate/`, qui accepte aussi **`POST`** pour que le texte long ne se retrouve pas dans l'URL et les journaux.
