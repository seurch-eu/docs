---
title: Auto-hébergement
weight: 20
bookCollapseSection: true
---

# Guide d'auto-hébergement

Le moteur de recherche de Seurch est **open source**, vous pouvez donc déployer votre propre instance et être le seul opérateur à jamais toucher les données de vos utilisateurs. Ce guide est destiné aux administrateurs déployant et exploitant Seurch.

Une instance est une application [Django](https://www.djangoproject.com/) unique s'appuyant sur **PostgreSQL**. Elle est livrée sous forme d'image Docker qui sert ses propres fichiers statiques et applique les migrations de base de données au démarrage, de sorte qu'un déploiement minimal consiste en un conteneur plus une base de données.

## Dans ce guide

| Page | Ce qu'elle couvre |
|------|-------------------|
| [Prérequis]({{< relref "requirements" >}}) | Ce dont vous avez besoin avant de commencer |
| [Démarrage rapide]({{< relref "quick-start" >}}) | Faire tourner une instance avec Docker |
| [Configuration]({{< relref "configuration" >}}) | Chaque variable d'environnement |
| [Fournisseurs de recherche]({{< relref "search-providers" >}}) | Clés API qui activent les moteurs, onglets et fiches |
| [Obtenir les clés API]({{< relref "provider-keys" >}}) | Guide pas à pas pour s'inscrire à chaque fournisseur |
| [Traduction]({{< relref "translation" >}}) | Connecter LibreTranslate pour l'onglet Traduction |
| [Utilisateurs et accès]({{< relref "users" >}}) | Création de comptes, e-mail, réinitialisation du mot de passe |
| [Clés API]({{< relref "api-keys" >}}) | Émission et révocation des clés API pour les utilisateurs |
| [Maintenance]({{< relref "maintenance" >}}) | Tâches planifiées, bangs, cache, statut des fournisseurs |
| [Supervision]({{< relref "monitoring" >}}) | Points de terminaison de santé pour un moniteur externe, et la page de statut |
| [Notes de production]({{< relref "production" >}}) | Fichiers statiques, vérifications de santé, pied de page, e-mail |

> [!NOTE]
> **Ce que vous obtenez.** L'auto-hébergement vous donne le moteur de recherche Seurch complet, chaque onglet, les réponses instantanées, les fiches de connaissance, les paramètres et l'API publique. Les onglets et fiches qui apparaissent réellement dépendent des [fournisseurs]({{< relref "search-providers" >}}) que vous configurez.
