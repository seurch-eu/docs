---
title: Prérequis
weight: 1
---

# Prérequis

## Environnement d'exécution

| Composant | Notes |
|-----------|-------|
| **Un moteur de conteneurs** | Docker ou Podman, pour exécuter l'image publiée. |
| **PostgreSQL** | La base de données applicative. Tout PostgreSQL raisonnablement récent (16+) convient. |
| **Une clé API Brave Search** | Le minimum pour des résultats utiles, voir [Fournisseurs de recherche]({{< relref "search-providers" >}}). Le niveau gratuit suffit pour commencer. |
| **HTTPS sortant** | Le serveur appelle les fournisseurs amont ; si vous êtes derrière une liste blanche, voir les [hôtes des fournisseurs]({{< relref "search-providers#network-allowlist" >}}). |

Tout le reste — serveur web, service des fichiers statiques et compilation des catalogues de traduction — est intégré dans l'image.

## Optionnel

| Composant | Permet |
|-----------|--------|
| **Une instance LibreTranslate** | L'onglet [Traduction]({{< relref "translation" >}}). |
| **Clés API de fournisseurs** (Mojeek, Marginalia, TMDB, TripAdvisor, Stack Exchange, Pixabay, World News) | Moteurs supplémentaires, fournisseurs de médias et fiches de connaissance. |
| **Un serveur SMTP** | E-mail de réinitialisation de mot de passe. Sans lui, les utilisateurs sans mot de passe sont bloqués, voir [Utilisateurs et accès]({{< relref "users" >}}). |

## Pour le développement local depuis les sources

Si vous souhaitez construire depuis les sources ou développer, plutôt que d'exécuter l'image publiée, vous aurez également besoin de :

- **Python 3.13+**
- [**uv**](https://github.com/astral-sh/uv) pour la gestion des dépendances
- **Podman** avec **podman-compose** (la pile de développement inclut un fichier compose avec PostgreSQL, un intercepteur de mails et LibreTranslate)
- **Node.js 22+** *uniquement* si vous avez l'intention de modifier les styles ; le CSS compilé et les icônes sont committés, donc l'application et l'image n'ont pas besoin de Node en production

La commande `make setup` du dépôt amorce tout cela en une seule étape. Voir [Démarrage rapide]({{< relref "quick-start#from-source" >}}).
