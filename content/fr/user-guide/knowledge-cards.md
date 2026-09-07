---
title: Fiches de connaissance
weight: 5
---

# Fiches de connaissance

Lorsque votre recherche **web** (première page) porte sur un sujet bien connu, Seurch affiche jusqu'à trois **fiches de connaissance** à côté des résultats, un résumé rapide qui vous évite souvent de cliquer.

## Les fiches

| Fiche | Source | Affiche |
|-------|--------|---------|
| **Wikipédia** | Wikipédia | Un résumé, une image et un lien vers le sujet. C'est la fiche principale, elle aide aussi à détecter ce que les autres fiches doivent montrer. |
| **Film / Série** | [TheTVDB](https://thetvdb.com/) | Détails d'un film ou d'une série : affiche, note, année, synopsis. |
| **Lieux** | [TripAdvisor](https://www.tripadvisor.com/) | Un restaurant, un hôtel ou une attraction : sa zone, sa note et son nombre d'avis, une courte description, et l'adresse (qui renvoie à la [carte]({{< relref "search-tabs" >}})). |
| **Q&A** | [Stack Exchange](https://stackexchange.com/) | La meilleure question et réponse pour une requête technique. |

## Comment elles sont choisies

Seurch n'affiche une fiche que lorsque votre requête correspond réellement à ce type de sujet :

- Wikipédia (et Wikidata en arrière-plan) détermine **ce qu'est** le sujet : un film, une personne, un lieu, de manière indépendante de la langue.
- Les fiches enrichies (film, lieux, Q&A) ne sont récupérées que lorsque la requête ressemble vraiment à ce type de sujet, et le meilleur correspondant est retenu ; les correspondances faibles sont écartées.

Cela permet au panneau de rester pertinent et évite les recherches inutiles.

## Chargement différé

Les fiches **se chargent juste après** les résultats principaux, par une requête en arrière-plan rapide, de sorte qu'une fiche lente ne retarde jamais votre réponse. Il n'y a rien à configurer : lorsque votre navigateur exécute JavaScript, les fiches arrivent un instant après les résultats, et dans le cas contraire elles sont rendues avec la page.

Vous pouvez activer ou désactiver chaque source de fiche individuellement dans **Paramètres → Moteurs**, où elles figurent parmi les **sources de données** du type de recherche Web, voir [Paramètres]({{< relref "settings" >}}).
