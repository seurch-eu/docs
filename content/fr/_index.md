---
title: Documentation Seurch
type: docs
bookToc: false
---

# Documentation Seurch

**Seurch** est un [métamoteur de recherche](https://fr.wikipedia.org/wiki/M%C3%A9tamoteur) axé sur la vie privée : une requête mélange les meilleurs résultats de plusieurs sources indépendantes en une seule page claire et rapide, sans traçage, sans publicité et sans profilage. Son moteur de recherche est open source, ce qui permet à tout le monde d'auditer son fonctionnement ou de déployer sa propre instance.

Cette documentation s'adresse à trois types de publics :

### [Guide utilisateur]({{< relref "/user-guide" >}})

Tout ce dont vous avez besoin pour tirer le meilleur parti de Seurch : recherche web, onglets Images / Actualités / Vidéos / Cartes / Traduction, réponses instantanées, fiches de connaissance, bangs et paramètres de compte.
→ Commencez par [Premiers pas]({{< relref "/user-guide/getting-started" >}}).

### [Guide d'auto-hébergement]({{< relref "/self-hosting" >}})

Déployez votre propre instance Seurch. Prérequis, démarrage rapide avec Docker, toutes les options de configuration, connexion des fournisseurs de recherche, création d'utilisateurs et génération de clés API, ainsi que des notes sur la production et la maintenance.
→ Commencez par [Démarrage rapide]({{< relref "/self-hosting/quick-start" >}}).

### [Guide API]({{< relref "/api" >}})

Utilisez toutes les fonctionnalités de recherche Seurch par programme via une API JSON : authentification, limites de débit et référence de chaque point de terminaison, avec des exemples `curl` et Python prêts à l'emploi.
→ Commencez par [l'aperçu de l'API]({{< relref "/api" >}}).

## Ce que fait Seurch

- **Recherche web sur trois moteurs**, Brave, Mojeek et Marginalia. Activez n'importe quel sous-ensemble ; lorsque plusieurs sont actifs, leurs listes de résultats sont fusionnées par Reciprocal Rank Fusion et dédupliquées, ce qui fait remonter un résultat sur lequel plusieurs moteurs s'accordent.
- **Onglets Images, Actualités, Vidéos, Cartes et Traduction**, chacun appuyé par des fournisseurs indépendants.
- **Réponses instantanées** au-dessus des résultats : calculatrice, conversion d'unités et de devises, météo, horloge mondiale, codes QR, hachages et bien plus, calculés localement sur le serveur.
- **Fiches de connaissance** à côté des résultats, provenant de Wikipédia, TMDB, TripAdvisor et Stack Exchange.
- **Paramètres par compte** synchronisés sur tous les appareils, avec export et import.
- Une **API JSON publique** couvrant toutes ces fonctionnalités.

## La vie privée en une ligne

Seurch ne vous traque pas, n'affiche pas de publicités et ne construit pas de profil. Les clés API des fournisseurs amont restent sur le serveur et ne sont jamais exposées à votre navigateur, et les requêtes sont envoyées aux fournisseurs sans vous identifier.
