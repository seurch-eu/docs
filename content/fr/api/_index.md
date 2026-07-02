---
title: API
weight: 30
bookCollapseSection: true
---

# Guide API

Chaque fonctionnalité de recherche Searpa — web, images, actualités, vidéos, cartes, traduction, réponses instantanées, fiches de connaissance, suggestions et statut des fournisseurs — est disponible par programme via une API JSON. Le même service alimente à la fois l'API et le site web, de sorte que les deux renvoient toujours les mêmes résultats.

L'API est construite avec [Django REST Framework](https://www.django-rest-framework.org/) et montée sous **`/api/v1/`**.

> [!IMPORTANT]
> L'API publique est une fonctionnalité **auto-hébergée**. Elle est incluse dans le moteur open source et disponible sur toute instance que vous [déployez vous-même]({{< relref "/self-hosting" >}}). Le service hébergé sur [searpa.eu](https://searpa.eu/) **ne l'expose pas** ; pour utiliser l'API, déployez votre propre instance et créez-y une clé.

## URL de base

```
https://search.example.com/api/v1/
```

Les exemples ci-dessous utilisent `search.example.com` comme substitut ; remplacez-le par l'hôte de votre propre instance.

## En un coup d'œil

- **Authentification :** chaque requête nécessite une [clé API]({{< relref "authentication" >}}) par utilisateur.
- **Sans état :** les options que le site web conserve dans un cookie (moteur, recherche sécurisée, langue, plage temporelle, page) sont de simples paramètres de requête, de sorte qu'une requête est entièrement décrite par son URL.
- **Limité en débit :** par clé, avec un [plafond burst et journalier]({{< relref "rate-limits" >}}).
- **JSON uniquement :** chaque point de terminaison renvoie du JSON.

## Une première requête

```bash
curl -H "Authorization: Api-Key searpa_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/web/?q=climat&lang=fr"
```

## Dans ce guide

| Page | Ce qu'elle couvre |
|------|-------------------|
| [Authentification]({{< relref "authentication" >}}) | Obtenir et envoyer une clé API |
| [Limites de débit]({{< relref "rate-limits" >}}) | Limites burst / sustained, `429`, comptage des usages |
| [Conventions]({{< relref "conventions" >}}) | Paramètres de requête partagés et structure des réponses |
| [Points de terminaison de recherche]({{< relref "search" >}}) | `web/`, `images/`, `news/`, `videos/`, `images/similar/` |
| [Cartes]({{< relref "maps" >}}) | Géocodage et géocodage inverse |
| [Traduction]({{< relref "translate" >}}) | Traduire du texte et lister les langues |
| [Instantané et fiches]({{< relref "instant-cards" >}}) | Réponses instantanées et fiches de connaissance |
| [Points de terminaison méta]({{< relref "meta" >}}) | `suggest/`, `status/`, `key/`, et la racine API |
| [Erreurs]({{< relref "errors" >}}) | Codes de statut et corps d'erreur |

> [!NOTE]
> La page développeur intégrée sur **`/api/`** renvoie vers cette documentation et vers le gestionnaire de clés. Une collection [Insomnia](https://insomnia.rest/) des points de terminaison est incluse dans le dépôt (`scripts/searpa-api.insomnia.json`).
