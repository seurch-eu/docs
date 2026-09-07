---
title: Fournisseurs de recherche
weight: 4
---

# Fournisseurs de recherche

Seurch mélange les résultats de plusieurs fournisseurs indépendants. **Les onglets et fiches qui apparaissent dépendent des clés que vous définissez.** Un fournisseur sans clé est masqué ; l'onglet ou la fiche concerné n'apparaît tout simplement pas, plutôt que d'afficher une erreur.

Tous les appels amont se font **côté serveur** ; les clés ne sont jamais exposées au navigateur.

Cette page est l'**aperçu** indiquant quelle clé active quoi. Pour les instructions d'inscription pas à pas pour chaque fournisseur, voir [Obtenir les clés API]({{< relref "provider-keys" >}}).

## La base : Brave

| Variable | Obtenir une clé |
|----------|-----------------|
| `BRAVE_API_KEY` | [brave.com/search/api](https://brave.com/search/api/) (niveau gratuit disponible) |
| `BRAVE_SUGGEST_API_KEY` | Au même endroit, un abonnement **séparé** pour la complétion automatique |

Brave est le point de départ recommandé : une seule clé alimente les onglets **Web, Images, Actualités et Vidéos**. Sans moteur web configuré, ces onglets affichent un avis de configuration à la place des résultats.

## Moteurs web supplémentaires

Ajoutez-en autant que vous le souhaitez pour mélanger d'autres index indépendants dans l'onglet Web (fusionnés par Reciprocal Rank Fusion, voir [Recherche web]({{< relref "/user-guide/web-search" >}})) :

| Variable | Fournisseur | Obtenir une clé |
|----------|-------------|-----------------|
| `MOJEEK_API_KEY` | Mojeek (index UK indépendant) | [mojeek.com/services/search/api](https://www.mojeek.com/services/search/api/) |
| `MARGINALIA_API_KEY` | Marginalia (index petit web) | Pas d'inscription, la valeur littérale `public` est une clé partagée gratuite (limitée à ~1 requête / 5 s). Pour un quota plus élevé, en faire la demande sur [marginalia-search.com](https://about.marginalia-search.com/article/api/) |
| `STAAN_API_KEY` | Staan (index européen, par Qwant et Ecosia) | [staan.ai](https://staan.ai/) — 1 000 requêtes gratuites par mois, puis à partir de 1 EUR pour 1 000. S'arrête après les quatre premières pages d'une recherche |

## Fournisseurs de médias

Chaque onglet de médias mélange Brave avec un second fournisseur. Le fournisseur supplémentaire est aussi la **seule** source pour les moteurs uniquement web (Mojeek, Marginalia et Staan), qui n'ont pas de recherche de médias propre.

| Onglet | Variable | Fournisseur | Clé |
|--------|----------|-------------|-----|
| Images | `PIXABAY_API_KEY` | [Pixabay](https://pixabay.com/api/docs/) | Gratuite |
| Actualités | `WORLDNEWS_API_KEY` | [World News API](https://worldnewsapi.com/) | Niveau gratuit |
| Vidéos | *(aucune)* | [Sepia](https://sepiasearch.org/) / PeerTube | Aucune clé requise |

**Cartes** ne nécessite aucune clé, il utilise Nominatim d'OpenStreetMap.

## Fournisseurs de fiches de connaissance

L'onglet web peut afficher jusqu'à trois [fiches de connaissance]({{< relref "/user-guide/knowledge-cards" >}}) latérales :

| Fiche | Variable | Fournisseur | Clé |
|-------|----------|-------------|-----|
| Wikipédia | *(aucune)* | Wikipedia / Wikidata | Aucune clé requise |
| Film / Série | `THETVDB_API_KEY` (+ `THETVDB_PIN`) | [TheTVDB](https://www.thetvdb.com/dashboard/account/apikey) | Licence commerciale, ou clé financée par les utilisateurs plus le code PIN d'abonné |
| Lieux | `TRIPADVISOR_API_KEY` | [TripAdvisor Terra Partner API](https://docs.terra.tripadvisor.com) | Clé partenaire, envoyée via `X-API-Key` |
| Q&A | `STACKEXCHANGE_API_KEY` | [Stack Exchange](https://stackapps.com/apps/oauth/register) | Optionnelle, augmente le quota partagé anonyme |

Les API de fiches payantes ne sont appelées que lorsqu'une requête ressemble réellement à un film ou un lieu, et chaque consultation est mise en cache pendant une heure : le volume d'appels reste donc faible et modeste au regard d'une licence TheTVDB ou d'un forfait TripAdvisor.

> [!NOTE]
> La fiche des lieux s'appuie sur la **Terra Partner API** de TripAdvisor, qui a remplacé la Content API retirée du service — les clés de cette dernière renvoient désormais `403`. Elle est construite à partir des points de terminaison catalogue, qui répondent sans liste d'autorisation partenaire, la fiche affiche donc un nom, une zone, une adresse, une note, un nombre d'avis et une description, mais ni photo, ni cuisine, ni niveau de prix, ni classement : ceux-ci nécessitent une licence par établissement.

## Page de statut des fournisseurs

Une page **`/status`** intégrée indique si chaque fournisseur configuré est opérationnel, liée depuis le pied de page du site et depuis **Paramètres → Statut des fournisseurs**. Elle ne dépense jamais de quota payant pour le savoir :

- Les fournisseurs avec un **point de terminaison de santé gratuit** (Nominatim, LibreTranslate, Open-Meteo, Frankfurter) sont sondés régulièrement.
- Le statut de tous les autres fournisseurs est déduit du fait que des **recherches réelles** ont récemment réussi.

Maintenez le statut à jour en exécutant `check_provider_health` périodiquement, voir [Maintenance]({{< relref "maintenance" >}}).

Définissez `STATUS_PAGE_ENABLED=false` pour garder cette information pour vous : la page renvoie 404 et ses liens disparaissent. La santé continue d'être enregistrée, et `/status/health` répond toujours, un service de supervision externe continue donc de fonctionner, voir [Supervision]({{< relref "monitoring" >}}).

## Liste blanche réseau

Si le trafic sortant de votre serveur est restreint, les deux appels réseau de **réponse instantanée** nécessitent que ces hôtes soient autorisés :

- `api.frankfurter.dev` (taux de change)
- `geocoding-api.open-meteo.com` et `api.open-meteo.com` (météo)

Les fiches de connaissance joignent `api4.thetvdb.com`, `artworks.thetvdb.com`, `terra.tripadvisor.com` et `www.wikidata.org`.

Tout le reste est atteint via HTTPS standard vers l'hôte API de chaque fournisseur. Les réponses instantanées locales (calculs, unités, hachages, …) ne nécessitent aucun réseau.
