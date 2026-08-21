---
title: Premiers pas
weight: 1
---

# Premiers pas

## Se connecter

Seurch nécessite un compte ; il n'existe pas de **recherche** anonyme. Le compte lui-même peut toutefois être **anonyme** : seuls un nom d'utilisateur et un mot de passe sont nécessaires, **aucune adresse e-mail ni information personnelle n'est requise** (l'e-mail est facultatif et sert uniquement à la réinitialisation du mot de passe, voir [Votre compte]({{< relref "account" >}})). Sur le service hébergé, les comptes sont sur invitation pendant la phase alpha ; sur une instance auto-hébergée, c'est l'administrateur qui les crée.

1. Rendez-vous sur votre instance Seurch (le service hébergé est disponible sur [seurch.eu](https://seurch.eu/)).
2. Cliquez sur **Se connecter** et saisissez votre nom d'utilisateur et votre mot de passe.
3. Vous arrivez sur la page d'accueil de recherche.

Si vous oubliez votre mot de passe et avez ajouté une adresse e-mail à votre compte, utilisez le lien **Mot de passe oublié ?** pour le réinitialiser. Sans e-mail enregistré, un mot de passe perdu ne peut pas être récupéré ; consultez [Votre compte]({{< relref "account" >}}).

## Votre première recherche

Saisissez une requête dans la zone de recherche et appuyez sur <kbd>Entrée</kbd>. Seurch interroge simultanément tous les moteurs activés, fusionne les résultats et les affiche sur une seule page. Au fur et à mesure que vous tapez, des suggestions de saisie automatique apparaissent ; sélectionnez-en une avec les touches fléchées ou continuez à taper.

Une page de résultats peut afficher plusieurs éléments simultanément :

- Une **[réponse instantanée]({{< relref "instant-answers" >}})** tout en haut pour les requêtes utilitaires (`2+2`, `météo à Paris`, `100 usd en eur`).
- Les **résultats web**, mélangés à partir de vos moteurs activés.
- Une ou plusieurs **[fiches de connaissance]({{< relref "knowledge-cards" >}})** sur le côté pour les sujets bien connus (une personne, un film, un lieu).

## Les onglets de recherche

En haut des résultats se trouvent des onglets. Chacun exécute la même requête contre un type de source différent :

| Onglet | Ce qu'il recherche |
|--------|-------------------|
| **Web** | Pages web sur Brave, Mojeek, Marginalia et Staan |
| **Images** | Photos, avec lightbox et « images similaires » |
| **Actualités** | Articles d'actualité récents |
| **Vidéos** | Résultats vidéo avec miniatures et durées |
| **Cartes** | Lieux et adresses sur une carte OpenStreetMap |
| **Traduction** | Traduire du texte entre langues |

Les onglets n'apparaissent que lorsque l'instance dispose du fournisseur correspondant configuré. Consultez [Onglets de recherche]({{< relref "search-tabs" >}}) pour les détails de chacun.

## Personnalisez votre expérience

Ouvrez **Paramètres** (depuis la page d'accueil ou le menu) pour choisir les moteurs à utiliser, définir vos langues d'interface et de recherche, choisir un thème clair ou sombre, et activer ou désactiver des sources de données individuelles. Vos paramètres se synchronisent avec votre compte et vous suivent sur tous les appareils connectés ; consultez [Paramètres]({{< relref "settings" >}}).

> [!NOTE]
> **Astuce clavier :** commencez n'importe quelle requête avec un [bang]({{< relref "bangs" >}}) comme `!w` (Wikipédia) ou `!images` pour accéder directement à un autre site ou onglet.
