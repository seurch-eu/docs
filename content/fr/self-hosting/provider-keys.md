---
title: Obtenir les clés API
weight: 5
---

# Obtenir les clés API

Guides pas à pas pour obtenir la clé de chaque fournisseur. Aucune n'est requise pour démarrer Seurch, mais au moins un **moteur web** (Brave est le plus simple) est nécessaire pour des résultats utiles. Chaque fournisseur que vous ignorez masque simplement son onglet ou sa fiche ; voir [Fournisseurs de recherche]({{< relref "search-providers" >}}) pour ce que chacun active.

Une fois que vous avez une clé, définissez la variable d'environnement correspondante (voir [Configuration]({{< relref "configuration" >}})) et redémarrez l'application.

> [!NOTE]
> Tous ces fournisseurs ont un **niveau gratuit** suffisamment généreux pour une instance personnelle ou pour une petite équipe ; Seurch met agressivement en cache et n'appelle les API de fiches payantes que lorsqu'une requête correspond réellement. Les clés partagées (`public` pour Marginalia, Stack Exchange anonyme) ne nécessitent aucune inscription.

## Brave Search — `BRAVE_API_KEY`

Alimente les onglets **Web, Images, Actualités et Vidéos** depuis une seule clé. C'est le fournisseur à configurer en premier.

1. Rendez-vous sur le site [Brave Search API](https://brave.com/search/api/) et **créez un compte** sur le tableau de bord API.
2. Ajoutez le plan **Data for Search** et choisissez le niveau **Gratuit** (il demande une carte bancaire pour vérification, mais le niveau gratuit n'est pas facturé).
3. Ouvrez **Clés API** dans le tableau de bord et **générez une clé**.
4. Copiez-la dans `BRAVE_API_KEY`.

## Brave Suggest (complétion automatique) — `BRAVE_SUGGEST_API_KEY`

Active la complétion automatique dans la barre de recherche. C'est un **abonnement séparé** de la clé de recherche ci-dessus, avec sa propre clé.

1. Dans le même [tableau de bord Brave API](https://brave.com/search/api/), abonnez-vous au plan **Autosuggest** (niveau gratuit disponible).
2. Générez une clé pour cet abonnement.
3. Copiez-la dans `BRAVE_SUGGEST_API_KEY`.

Laissez-la non définie pour fonctionner sans complétion automatique ; tout le reste fonctionne quand même.

## Mojeek — `MOJEEK_API_KEY`

Ajoute l'index web indépendant **Mojeek** à l'onglet Web.

1. Visitez la page [Mojeek Search API](https://www.mojeek.com/services/search/api/) et **demandez l'accès à l'API** (un niveau gratuit est disponible).
2. Une fois approuvé, copiez la clé qu'ils émettent.
3. Définissez-la comme `MOJEEK_API_KEY`.

## Marginalia — `MARGINALIA_API_KEY`

Ajoute l'index **Marginalia** non commercial et axé sur le petit web. **Aucune inscription requise.**

- La valeur littérale **`public`** est une clé partagée gratuite et est la valeur par défaut dans `.env.example`, limitée à environ **1 requête toutes les 5 secondes**.
- Pour un quota plus élevé et non partagé, demandez une clé personnelle sur la [page API Marginalia](https://about.marginalia-search.com/article/api/).

```bash
MARGINALIA_API_KEY=public   # fonctionne d'emblée
```

## Pixabay (images) — `PIXABAY_API_KEY`

Mélange des images **Pixabay** libres de droits dans l'onglet Images.

1. Créez un compte gratuit sur [Pixabay](https://pixabay.com/).
2. Une fois connecté, ouvrez la [documentation API Pixabay](https://pixabay.com/api/docs/) ; votre clé API personnelle s'affiche en haut de cette page.
3. Copiez-la dans `PIXABAY_API_KEY`.

## World News API (actualités) — `WORLDNEWS_API_KEY`

Mélange des articles de l'[API World News](https://worldnewsapi.com/) dans l'onglet Actualités.

1. Inscrivez-vous sur [worldnewsapi.com](https://worldnewsapi.com/) (le plan gratuit accorde une allocation journalière de points).
2. Ouvrez votre **tableau de bord de compte** et copiez la **clé API**.
3. Définissez-la comme `WORLDNEWS_API_KEY`.

## TMDB (fiche film / série) — `TMDB_API_KEY`

Active la [fiche de connaissance]({{< relref "/user-guide/knowledge-cards" >}}) film / série.

1. Créez un compte gratuit sur [The Movie Database](https://www.themoviedb.org/).
2. Allez dans **Paramètres → API** ([lien direct](https://www.themoviedb.org/settings/api)) et demandez une clé **Développeur** (immédiate, gratuite ; vous remplissez un court formulaire).
3. Copiez la valeur **Clé API (authentification v3)** dans `TMDB_API_KEY`.

## TripAdvisor (fiche lieux) — `TRIPADVISOR_API_KEY`

Active la fiche restaurant / hôtel / attraction.

1. Inscrivez-vous à l'[API Content TripAdvisor](https://www.tripadvisor.com/developers).
2. Dans le portail développeur, **créez une clé API** (le niveau gratuit inclut une allocation mensuelle d'appels).
3. Copiez-la dans `TRIPADVISOR_API_KEY`.

> [!NOTE]
> L'API Content TripAdvisor nécessite d'afficher les attributions TripAdvisor là où ses données apparaissent, ce que la fiche de Seurch fait déjà. Vous pouvez également restreindre la clé à l'IP de votre serveur dans leur portail.

## Stack Exchange (fiche Q&A) — `STACKEXCHANGE_API_KEY`

Active la fiche de questions-réponses Stack Exchange. **Une clé est optionnelle.**

- **Sans clé**, Seurch utilise le quota partagé anonyme (10 000 requêtes/jour partagées entre tous les appelants anonymes), ce qui convient pour un faible trafic.
- **Avec une clé**, vous obtenez un quota dédié beaucoup plus élevé :

  1. Enregistrez une application sur [Stack Apps → Register OAuth](https://stackapps.com/apps/oauth/register) (utilisez l'URL de votre instance ; vous n'avez pas besoin du flux OAuth).
  2. Copiez la **Clé** générée.
  3. Définissez-la comme `STACKEXCHANGE_API_KEY`.

## Fournisseurs ne nécessitant aucune clé

Ceux-ci fonctionnent d'emblée, sans compte ni clé :

| Fournisseur | Utilisé pour |
|-------------|-------------|
| **OpenStreetMap / Nominatim** | L'onglet Cartes et les réponses rapides de carte |
| **Wikipedia / Wikidata** | La fiche de connaissance Wikipédia et la détection de sujet |
| **Sepia / PeerTube** | Le fournisseur supplémentaire de l'onglet Vidéos |
| **Open-Meteo** | La réponse instantanée météo |
| **Frankfurter** | La réponse instantanée devise |

L'onglet Traduction est la seule fonctionnalité sans clé qui nécessite quand même une **infrastructure** : une instance LibreTranslate vers laquelle vous pointez Seurch, voir [Traduction]({{< relref "translation" >}}).

## Après avoir ajouté les clés

1. Placez chaque valeur dans votre environnement (ou `.env`), voir [Configuration]({{< relref "configuration" >}}).
2. Redémarrez l'application pour qu'elle prenne en compte les nouvelles variables.
3. Vérifiez la page **`/status`** (ou le [point de terminaison API `status/`]({{< relref "/api/meta#provider-status" >}})) pour confirmer que chaque fournisseur rapporte un état sain.
