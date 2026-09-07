---
title: Supervision
weight: 10
---

# Supervision

Seurch expose sa santé à trois niveaux, qui répondent à des questions différentes. Supervisez au moins les deux premiers : ensemble, ils permettent de distinguer « l'application est en panne » de « l'application fonctionne, un fournisseur amont est en panne ».

| Point de terminaison | Question à laquelle il répond | Public |
|----------------------|-------------------------------|--------|
| `/up` | Le processus applicatif répond-il ? | La sonde de vivacité de votre orchestrateur |
| `/status/health` | Les fournisseurs amont fonctionnent-ils ? | Un service de supervision externe |
| `/status` | Quel fournisseur est en panne, et depuis quand ? | Les utilisateurs connectés |

## Vivacité de l'application — `/up`

Répond avant la validation de l'hôte, il fonctionne donc depuis l'intérieur du réseau du conteneur, voir [Notes de production]({{< relref "production" >}}). Il ne sait rien des fournisseurs : une instance dont tous les fournisseurs échouent répond quand même `200` ici, parce que l'application elle-même va bien.

## Santé des fournisseurs — `/status/health`

Le pendant lisible par une machine de la [page de statut](#la-page-de-statut), destiné à un service de supervision externe tel que [phare.io](https://phare.io), Better Stack ou Uptime Kuma. Il répond **200** tant que tout ce qu'il surveille est opérationnel et **500** dès que quelque chose tombe, ce qui est précisément ce sur quoi ces services alertent.

```
GET /status/health   →  200 OK
```

```json
{ "status": "ok", "watched": 8, "operational": 6, "down": [], "unknown": 2 }
```

| Situation | Réponse |
|-----------|---------|
| Tous les fournisseurs surveillés opérationnels (ou jamais observés) | **200** `{"status": "ok", …}` |
| Un ou plusieurs fournisseurs surveillés en panne | **500** `{"status": "down", "down": ["brave"], …}` |
| Base de données injoignable | **500** `{"status": "error", "detail": "database unavailable"}` |
| `STATUS_MONITOR_PROVIDERS` ne correspond à rien | **500** `{"status": "error", "detail": "no providers watched"}` |
| Désactivé avec `STATUS_MONITOR_ENABLED=false` | **404** |
| `STATUS_MONITOR_TOKEN` absent ou incorrect | **403** |

`/status/health` et `/status/health/` répondent tous les deux, de sorte qu'un moniteur configuré sans la barre oblique finale n'est jamais renvoyé via une redirection.

### Une vérification par fournisseur

`/status/health/<fournisseur>` répond pour un seul service amont, afin que votre service de supervision puisse tenir une vérification distincte par fournisseur et qu'une alerte nomme *ce qui* est tombé plutôt que « quelque chose ».

```
GET /status/health/brave   →  200 OK
```

```json
{
  "status": "ok",
  "provider": "brave",
  "state": "up",
  "checked_at": "2026-09-01T09:00:00Z",
  "last_ok_at": "2026-09-01T09:00:00Z"
}
```

| Situation | Réponse |
|-----------|---------|
| Fournisseur opérationnel | **200** `"state": "up"` |
| Fournisseur en panne | **500** `"state": "down"` |
| Jamais encore observé | **200** `"state": "unknown"` |
| Non configuré ici, ou nom inconnu | **404** |

Une URL par fournisseur :

| Fournisseur | Point de terminaison |
|-------------|----------------------|
| Brave | `/status/health/brave` |
| Mojeek | `/status/health/mojeek` |
| Marginalia | `/status/health/marginalia` |
| Staan | `/status/health/staan` |
| Pixabay | `/status/health/pixabay` |
| Sepia | `/status/health/sepia` |
| World News API | `/status/health/worldnews` |
| Wikipédia | `/status/health/wikipedia` |
| Wikidata | `/status/health/wikidata` |
| TheTVDB | `/status/health/thetvdb` |
| TripAdvisor | `/status/health/tripadvisor` |
| Stack Exchange | `/status/health/stackexchange` |
| Open-Meteo (météo) | `/status/health/weather` |
| Frankfurter (devises) | `/status/health/currency` |
| OpenStreetMap / Nominatim | `/status/health/openstreetmap` |
| LibreTranslate | `/status/health/translate` |

Un fournisseur que vous n'avez pas configuré renvoie **404**, et non 200 : il n'y a rien à signaler, et une vérification au vert pour un fournisseur qui n'est même pas branché serait pire qu'une vérification manifestement cassée. Ne mettez donc en place des vérifications que pour les fournisseurs que vous exploitez réellement.

### Choisir ce que surveille l'agrégat

`STATUS_MONITOR_PROVIDERS` restreint `/status/health` aux fournisseurs qui méritent de réveiller quelqu'un. Il accepte des identifiants de fournisseurs (le tableau ci-dessus) et/ou les clés de groupe `engine`, `media`, `cards`, `instant`, `maps` et `translate` :

```
# N'alerter que pour les moteurs de recherche eux-mêmes
STATUS_MONITOR_PROVIDERS=engine

# Les moteurs plus le géocodage
STATUS_MONITOR_PROVIDERS=engine,openstreetmap
```

Laissez la variable vide (par défaut) pour surveiller tous les fournisseurs configurés. Les noms qui ne correspondent à rien sont ignorés, une faute de frappe ne fait donc pas tomber le reste de votre liste — mais si *aucun* ne correspond, le point de terminaison le signale comme une erreur plutôt que comme un feu vert, car un moniteur bloqué au vert sur une faute de frappe est pire que pas de moniteur du tout.

Cela ne restreint que l'agrégat. Chaque point de terminaison `/status/health/<fournisseur>` nomme son fournisseur et répond toujours pour lui.

### Exiger un jeton

Ces points de terminaison sont **non authentifiés par conception** — un service de supervision ne peut pas se connecter. Définissez `STATUS_MONITOR_TOKEN` pour exiger un secret partagé, envoyé de trois manières au choix :

```bash
curl "https://search.example.com/status/health?token=<secret>"
curl -H "X-Monitor-Token: <secret>" https://search.example.com/status/health
curl -H "Authorization: Bearer <secret>" https://search.example.com/status/health
```

Toute valeur incorrecte reçoit un `403`. `STATUS_MONITOR_ENABLED=false` supprime entièrement les points de terminaison (`404`).

### Ce que les réponses disent, et ne disent pas

- **Inconnu n'est pas en panne.** La plupart des fournisseurs ne se manifestent que lorsque quelqu'un lance une recherche ; un fournisseur jamais observé n'est donc ni opérationnel ni en panne. Seul un échec enregistré fait passer une vérification au rouge, sans quoi une instance peu sollicitée ne pourrait jamais passer au vert.
- **Une erreur de base de données est une panne.** Si les enregistrements de statut ne peuvent pas être lus, le point de terminaison répond 500 : une instance qui ne peut pas joindre PostgreSQL ne peut pas non plus servir une recherche.
- **Ils disent quoi, pas pourquoi.** Le corps nomme les fournisseurs en panne ; le texte d'erreur amont reste sur la page de statut, derrière une connexion.
- Chaque réponse est du JSON (y compris les 404) et porte `Cache-Control: no-store`, aucun proxy ne sert donc un verdict périmé.

## La page de statut

`/status` est la vue destinée aux humains des mêmes données : une ligne par fournisseur configuré, la manière dont son état a été déterminé, et la dernière fois où il a été vu fonctionner. Elle est liée depuis le pied de page du site et depuis **Paramètres → Statut des fournisseurs**, et nécessite une connexion.

Elle ne dépense jamais de quota payant pour le savoir, voir [Fournisseurs de recherche]({{< relref "search-providers" >}}) pour la manière dont l'état de chaque fournisseur est établi, et [Maintenance]({{< relref "maintenance" >}}) pour la planification des sondes qui la maintient à jour.

### La désactiver

Définissez `STATUS_PAGE_ENABLED=false` si vous préférez ne pas publier quels fournisseurs votre instance utilise et quand ils échouent. Alors :

- `/status` renvoie **404**, et les liens vers elle dans le pied de page et les Paramètres disparaissent.
- Le point de terminaison [`status/`]({{< relref "/api/meta" >}}) de l'API, qui sert les mêmes données, renvoie lui aussi 404 et disparaît de l'index racine de l'API.
- La santé continue d'être **enregistrée** et reste lisible, dans la base de données et via les points de terminaison de supervision ci-dessus.

> [!NOTE]
> `STATUS_MONITOR_ENABLED` est indépendant de `STATUS_PAGE_ENABLED` — c'est tout l'intérêt. Une instance qui ne publie pas la page peut quand même être supervisée.

## Récapitulatif des réglages

| Variable | Rôle | Défaut |
|----------|------|--------|
| `STATUS_PAGE_ENABLED` | Publier la page `/status` et le point de terminaison `status/` de l'API | `true` |
| `STATUS_MONITOR_ENABLED` | Servir `/status/health` et `/status/health/<fournisseur>` | `true` |
| `STATUS_MONITOR_TOKEN` | Secret partagé pour ces points de terminaison | *(vide, ouvert)* |
| `STATUS_MONITOR_PROVIDERS` | Fournisseurs surveillés par l'agrégat | *(vide, tous ceux configurés)* |
