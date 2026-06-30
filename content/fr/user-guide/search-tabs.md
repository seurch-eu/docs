---
title: Onglets de recherche
weight: 3
---

# Onglets de recherche

En plus de l'onglet Web, Searpa propose des onglets dédiés aux images, aux actualités, aux vidéos, aux cartes et à la traduction. Chacun exécute votre requête contre des sources adaptées à ce type de contenu. Un onglet n'apparaît que lorsque l'instance dispose du fournisseur correspondant configuré.

## Images

Les résultats d'images proviennent de l'index Brave, complétés par **Pixabay** lorsqu'il est activé. Les résultats sont affichés sous forme de grille de miniatures.

Cliquez sur une image pour ouvrir une **lightbox** (similaire à Google Images) :

- L'image en grand, avec des liens vers la **page source** et l'**image complète**.
- Une grille d'**images similaires**, une nouvelle recherche d'images basée sur la légende de l'image ouverte. Cliquez sur l'une d'elles pour la mettre en avant et continuer à explorer, ou **Voir tous les résultats** pour lancer la recherche complète.

Les images similaires ne se chargent que pour l'image que vous ouvrez réellement, elles ne ralentissent donc jamais la grille. Avec JavaScript désactivé, cliquer sur un résultat ouvre une page de détail rendue côté serveur avec la même image, les mêmes liens et la même grille similaire, donc la fonctionnalité reste disponible.

## Actualités

L'onglet **Actualités** renvoie des articles récents de l'index Brave, complétés par l'**API World News** lorsqu'elle est activée. Chaque résultat affiche la source, l'ancienneté de la publication et une miniature. Utilisez le filtre de plage temporelle pour vous concentrer sur la couverture la plus récente.

## Vidéos

L'onglet **Vidéos** mélange les résultats vidéo Brave avec **Sepia**, l'index de recherche pour [PeerTube](https://joinpeertube.org/) (un réseau vidéo décentralisé et ouvert). Les résultats affichent une miniature, la durée et le site hôte.

## Cartes

L'onglet **Cartes** ne nécessite aucune configuration ni compte auprès d'un fournisseur. Tapez un nom de lieu ou une adresse et Searpa :

- **Géocode** avec [Nominatim](https://nominatim.openstreetmap.org/) (la recherche d'OpenStreetMap), et
- affiche l'emplacement sur une **carte OpenStreetMap intégrée**, avec un lien **Ouvrir dans Maps** et des itinéraires.

Lorsqu'une recherche **web** normale ressemble à une adresse ou un lieu, une mini-carte de réponse rapide apparaît à côté des résultats, et la [fiche de connaissance]({{< relref "knowledge-cards" >}}) d'un lieu pointe directement vers la carte.

## Traduction

L'onglet **Traduction** traduit du texte entre langues, alimenté par [LibreTranslate](https://libretranslate.com/) (traduction automatique open source). Choisissez une langue cible (et éventuellement une langue source, ou laissez-la se détecter automatiquement), collez votre texte et lisez la traduction. Les langues disponibles dépendent de l'instance LibreTranslate à laquelle l'opérateur est connecté.

> [!NOTE]
> Si un onglet est manquant, l'opérateur de l'instance n'a pas configuré ce fournisseur. Sur une instance [auto-hébergée]({{< relref "/fr/self-hosting" >}}), vous contrôlez les fournisseurs activés.
