---
title: Configuration
weight: 3
---

# Configuration

Seurch est entièrement configuré via des **variables d'environnement** (en production) ou un fichier `.env` (en développement). Le dépôt inclut un fichier `.env.example` documentant chaque variable ; cette page en est la référence.

## Noyau

| Variable | Rôle | Notes |
|----------|------|-------|
| `SECRET_KEY` | Clé secrète Django | **Requise en production.** Longue et aléatoire. |
| `DEBUG` | Mode débogage | Maintenez **`False`** (la valeur par défaut) en production. |
| `ALLOWED_HOSTS` | Noms d'hôtes séparés par des virgules que l'application servira | ex. `search.example.com`. |
| `DATABASE_URL` | URL de connexion PostgreSQL | ex. `postgres://utilisateur:mdp@hôte:5432/seurch`. |
| `LOG_LEVEL` | Verbosité des logs | `DEBUG` / `INFO` / `WARNING` / `ERROR` (par défaut `INFO`). |
| `LOG_SEARCH_QUERIES` | Journaliser le texte brut des requêtes | Suit `DEBUG`, donc **désactivé** en production. Les requêtes sont des données personnelles et les logs de conteneurs sont conservés ; désactivé, chaque ligne de log de fournisseur ne porte que la longueur de la requête. |

## Fournisseurs de recherche

Ces clés déterminent quels moteurs, onglets de médias et fiches de connaissance sont disponibles. Un fournisseur sans clé est simplement masqué (pas affiché comme cassé). Détails complets dans [Fournisseurs de recherche]({{< relref "search-providers" >}}).

| Variable | Active |
|----------|--------|
| `BRAVE_API_KEY` | Web, Images, Actualités et Vidéos via Brave (la base). |
| `BRAVE_SUGGEST_API_KEY` | Suggestions de complétion automatique (un abonnement Brave séparé). |
| `MOJEEK_API_KEY` | Le moteur web Mojeek. |
| `MARGINALIA_API_KEY` | Le moteur web Marginalia (`public` fonctionne d'emblée). |
| `STAAN_API_KEY` | Le moteur web Staan (index européen, résultats web uniquement). |
| `THETVDB_API_KEY` | La fiche de connaissance film / série (TheTVDB v4). |
| `THETVDB_PIN` | Code PIN d'abonné, uniquement pour une clé TheTVDB financée par les utilisateurs. |
| `TRIPADVISOR_API_KEY` | La fiche de connaissance lieux. |
| `STACKEXCHANGE_API_KEY` | Un quota Stack Exchange plus élevé pour la fiche Q&A (optionnel). |
| `PIXABAY_API_KEY` | Images Pixabay mélangées dans l'onglet Images. |
| `WORLDNEWS_API_KEY` | Articles de l'API World News mélangés dans l'onglet Actualités. |

### Le badge « Payant »

`PAID_PROVIDERS` détermine quels fournisseurs **Paramètres → Moteurs** signale d'un badge **Payant**, afin qu'un utilisateur voie lesquels sont des API commerciales facturées à l'usage avant de les activer. Non défini, la liste interne de l'application s'applique (Brave, Mojeek, Staan, World News) ; renseignez une liste de clés de fournisseurs séparées par des virgules si votre instance est sur d'autres forfaits :

```
PAID_PROVIDERS=brave,mojeek,staan,worldnews
```

Les noms qui ne sont pas des clés de fournisseurs sont ignorés : `PAID_PROVIDERS=none` ne badge donc rien. Le badge n'est qu'une étiquette, il ne change jamais ce qu'un utilisateur peut activer.

## Traduction

| Variable | Rôle |
|----------|------|
| `LIBRETRANSLATE_URL` | URL de votre instance LibreTranslate. **Non défini désactive entièrement l'onglet Traduction.** |
| `LIBRETRANSLATE_API_KEY` | Uniquement si votre LibreTranslate nécessite une clé (`LT_API_KEYS=true`). |
| `LIBRETRANSLATE_ORIGIN_COUNTRY` | Code pays à deux lettres pour le drapeau affiché à côté de « Traduction » dans Paramètres (par défaut `fr`). |

Voir [Traduction]({{< relref "translation" >}}).

## Statut des fournisseurs et supervision

Si cette instance publie la santé des fournisseurs, et ce qu'un service de supervision externe peut interroger. Détails complets dans [Supervision]({{< relref "monitoring" >}}).

| Variable | Rôle | Par défaut |
|----------|------|------------|
| `STATUS_PAGE_ENABLED` | Publier la page `/status`, et le point de terminaison `status/` de l'API qui sert les mêmes données. Désactivez-le pour garder pour vous quels fournisseurs vous utilisez et quand ils échouent. | `true` |
| `STATUS_MONITOR_ENABLED` | Servir `/status/health` et `/status/health/<fournisseur>`, les points de terminaison 200-ou-500 qu'interroge un moniteur. | `true` |
| `STATUS_MONITOR_TOKEN` | Secret partagé exigé par ces points de terminaison (`?token=`, `X-Monitor-Token`, ou `Authorization: Bearer`). | *(vide, ouvert)* |
| `STATUS_MONITOR_PROVIDERS` | Fournisseurs surveillés par l'agrégat `/status/health` : identifiants de fournisseurs et/ou clés de groupe `engine`, `media`, `cards`, `instant`, `maps`, `translate`. | *(vide, tous les fournisseurs configurés)* |

Les deux sont indépendants : la supervision continue de fonctionner page désactivée, et c'est tout l'intérêt, une instance qui ne publie pas la page doit quand même pouvoir être supervisée.

```
STATUS_PAGE_ENABLED=false
STATUS_MONITOR_PROVIDERS=engine
STATUS_MONITOR_TOKEN=une-longue-chaine-aleatoire
```

## Limites de débit de l'API publique

Appliquées par clé API (taux de limitation Django REST Framework, `<nombre>/<période>`, où la période est `second` / `minute` / `hour` / `day`). Les deux limites s'appliquent ensemble. Voir la page [Limites de débit de l'API]({{< relref "/api/rate-limits" >}}).

| Variable | Rôle | Par défaut |
|----------|------|------------|
| `API_THROTTLE_BURST` | Plafond à court terme, protège les fournisseurs amont d'un client incontrôlé | `60/min` |
| `API_THROTTLE_SUSTAINED` | Plafond de volume quotidien | `5000/day` |

## E-mail (réinitialisation du mot de passe)

Utilisé uniquement pour envoyer des messages de réinitialisation de mot de passe, voir [Utilisateurs et accès]({{< relref "users" >}}).

| Variable | Rôle |
|----------|------|
| `EMAIL_BACKEND` | Backend e-mail Django (SMTP, console, …). |
| `EMAIL_HOST` / `EMAIL_PORT` | Serveur SMTP. |
| `EMAIL_USE_TLS` | `True` / `False`. |
| `EMAIL_HOST_USER` / `EMAIL_HOST_PASSWORD` | Identifiants SMTP. |
| `DEFAULT_FROM_EMAIL` | L'adresse « De » sur les e-mails sortants. |

Pour un test rapide sans vrai serveur SMTP, définissez `EMAIL_BACKEND=django.core.mail.backends.console.EmailBackend` pour afficher les e-mails dans le log du conteneur.

## Liens de pied de page

Le pied de page n'inclut **aucune** politique de confidentialité, conditions d'utilisation ou mentions légales par défaut ; ce contenu est spécifique à l'opérateur de l'instance et à votre juridiction. Ajoutez les vôtres sous forme de paires `Libellé=URL` séparées par des virgules :

```
FOOTER_LINKS=Confidentialité=https://example.com/privacy,Mentions légales=https://example.com/legal
```

Laissez `FOOTER_LINKS` non défini pour n'afficher aucun lien supplémentaire en pied de page.

## Lien vers les sources et informations de build

| Variable | Rôle |
|----------|------|
| `SOURCE_URL` | Dépôt vers lequel pointe le lien **Source** du pied de page. Faites-le pointer vers votre propre fork si vous exécutez une version modifiée. |
| `GIT_REF` | Branche ou tag Git affiché à côté du copyright dans le pied de page. |
| `GIT_SHA` | Hash du commit affiché à côté du copyright, pour retracer un déploiement jusqu'au build exact. |

L'image Docker définit `GIT_REF` et `GIT_SHA` automatiquement au moment du build ; ne les renseignez à la main que pour d'autres méthodes de déploiement.
