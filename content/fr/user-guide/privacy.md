---
title: Vie privée
weight: 9
---

# Vie privée

Searpa est conçu pour être une alternative privée aux moteurs de recherche financés par la surveillance. Voici ce que cela signifie en pratique.

## Ce que Searpa ne fait pas

- **Pas de traçage.** Searpa ne vous suit pas sur le web ni d'une session à l'autre pour construire un profil.
- **Pas de publicité.** Il n'y a pas de publicité, donc aucune incitation à vous profiler.
- **Pas de vente de données.** Vos recherches ne sont pas un produit vendu à quiconque.

## Comment vos requêtes sont traitées

- Les recherches s'exécutent **côté serveur**. Searpa parle aux fournisseurs amont (Brave, Mojeek, Marginalia et les autres) en votre nom, de sorte que ces fournisseurs ne voient pas votre navigateur ni votre IP, ils voient le serveur de Searpa.
- **Les clés API des fournisseurs n'atteignent jamais votre navigateur.** Tous les appels amont se font sur le serveur.
- **Le proxy d'images** (optionnel, dans [Paramètres]({{< relref "settings" >}})) achemine les miniatures via le serveur Searpa de sorte que les sites sources ne voient pas non plus votre navigateur.
- Les résultats sont brièvement **mis en cache** sur le serveur pour rester rapides et réduire la charge sur les fournisseurs ; le cache est indexé sur la requête, pas sur vous.

## Vos données

- Vos **paramètres** se synchronisent avec votre compte pour vous suivre sur tous vos appareils. Vous pouvez les [exporter ou les supprimer]({{< relref "settings" >}}).
- Votre **e-mail**, si vous en ajoutez un, n'est utilisé que pour la réinitialisation du mot de passe ; voir [Votre compte]({{< relref "account" >}}).

## Où c'est hébergé

Le service hébergé est exploité dans l'Union européenne sous le droit européen de la vie privée. Étant donné que le moteur de recherche est open source, n'importe qui peut auditer son fonctionnement, ou [déployer sa propre copie]({{< relref "/fr/self-hosting" >}}) et être le seul opérateur à jamais toucher ses données.

> [!NOTE]
> La politique de confidentialité spécifique, les conditions d'utilisation et les mentions légales dépendent de **qui exploite l'instance** que vous utilisez. Sur le service hébergé, consultez les liens dans le pied de page du site.
