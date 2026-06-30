---
title: Bangs
weight: 6
---

# Bangs

Les **bangs** sont des `!raccourcis` que vous tapez dans la zone de recherche pour envoyer directement une requête vers un autre site ou un onglet Searpa différent. Searpa comprend le vocabulaire de bangs à la mode DuckDuckGo largement utilisé, des milliers de sites, plus quelques-uns qui lui sont propres.

Les définitions de bangs proviennent du [dépôt de bangs open source de Kagi](https://github.com/kagisearch/bangs), la même liste `!bang` communautaire que Kagi publie. Les auto-hébergeurs peuvent la rafraîchir avec `make bangs`, voir [Maintenance]({{< relref "/fr/self-hosting/maintenance#bang-definitions" >}}).

Un bang peut se placer n'importe où dans la requête, le reste du texte constitue les termes de recherche.

## Bangs de site

Préfixez une requête avec le bang d'un site pour rechercher directement sur ce site :

| Vous tapez | Va sur |
|------------|--------|
| `!w einstein` | Recherche d'article Wikipédia pour « einstein » |
| `!gh hugo` | Recherche GitHub pour « hugo » |
| `!yt lofi` | Recherche YouTube pour « lofi » |
| `!a casque` | Recherche Amazon |

Il en existe des milliers. Si un bang n'est pas reconnu, Searpa le traite simplement comme une partie de votre requête normale.

## Bangs d'onglet

Une poignée de bangs permet de sauter vers l'un des propres [onglets]({{< relref "search-tabs" >}}) de Searpa au lieu de quitter le site :

| Bang(s) | Onglet |
|---------|--------|
| `!web` | Web |
| `!images`, `!i` | Images |
| `!news`, `!n` | Actualités |
| `!videos`, `!v` | Vidéos |
| `!maps`, `!m` | Cartes |
| `!translate` | Traduction |

Par exemple, `!i golden retriever` lance une recherche d'images sans toucher aux onglets manuellement.

## Le bang « lucky »

Un `!` seul (par exemple `! meilleure machine à expresso`) est le bang **lucky** : il vous amène directement au premier résultat de votre requête.

## Bangs personnalisés

Vous pouvez définir vos **propres** bangs dans **Paramètres → Bangs**. Donnez à chacun un déclencheur et un modèle d'URL, et il fonctionne comme les bangs intégrés. Les bangs personnalisés sont enregistrés dans votre compte et vous suivent sur tous vos appareils.
