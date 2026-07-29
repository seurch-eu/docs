---
title: Démarrage rapide
weight: 2
---

# Démarrage rapide

Le moyen le plus rapide d'avoir une instance opérationnelle est l'image Docker. Vous avez besoin d'une base de données PostgreSQL et, au minimum, d'une [clé API Brave Search]({{< relref "search-providers" >}}).

## Avec Docker

```bash
docker run -p 8000:8000 \
  -e SECRET_KEY=votre-long-secret-aléatoire \
  -e DATABASE_URL=postgres://utilisateur:motdepasse@hôte-db:5432/seurch \
  -e ALLOWED_HOSTS=search.example.com \
  -e BRAVE_API_KEY=votre-clé-brave \
  -e BRAVE_SUGGEST_API_KEY=votre-clé-brave-suggest \
  -e MARGINALIA_API_KEY=public \
  seurch
```

Au démarrage, le conteneur :

1. Applique les **migrations** de base de données (sans effet une fois le schéma à jour).
2. Sert l'application avec **gunicorn** (2 workers) sur le port **8000**.
3. Sert ses propres fichiers statiques via [WhiteNoise](https://whitenoise.readthedocs.io/) (compressés et hachés), sans serveur web séparé ni CDN requis.
4. Répond à une vérification de santé sur **`/up`**.

Les catalogues de traduction et les fichiers statiques sont compilés à la construction, il n'y a donc rien d'autre à lancer.

Placez un proxy inverse avec TLS (Caddy, nginx, Traefik, …) devant le port 8000 et définissez `ALLOWED_HOSTS` sur votre domaine. Voir [Notes de production]({{< relref "production" >}}).

### Créez votre premier utilisateur

L'application n'a **pas d'inscription publique**, créez donc un compte avant de pouvoir vous connecter :

```bash
docker exec -it <conteneur> python manage.py createsuperuser
```

Voir [Utilisateurs et accès]({{< relref "users" >}}) pour plus d'informations.

## Avec Docker Compose

Un `compose.yaml` minimal avec la base de données aux côtés de l'application :

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_DB: seurch
      POSTGRES_USER: seurch
      POSTGRES_PASSWORD: changez-moi
    volumes:
      - pgdata:/var/lib/postgresql/data

  app:
    image: seurch
    depends_on: [db]
    ports:
      - "8000:8000"
    environment:
      SECRET_KEY: votre-long-secret-aléatoire
      DATABASE_URL: postgres://seurch:changez-moi@db:5432/seurch
      ALLOWED_HOSTS: search.example.com
      BRAVE_API_KEY: votre-clé-brave
      BRAVE_SUGGEST_API_KEY: votre-clé-brave-suggest
      MARGINALIA_API_KEY: public

volumes:
  pgdata:
```

```bash
docker compose up -d
docker compose exec app python manage.py createsuperuser
```

Voir [Configuration]({{< relref "configuration" >}}) pour la liste complète des variables d'environnement, et [Fournisseurs de recherche]({{< relref "search-providers" >}}) pour les clés qui activent chaque onglet et fiche.

## Depuis les sources

Pour construire l'image vous-même ou développer localement, clonez le dépôt Seurch et utilisez le workflow fourni :

```bash
cp .env.example .env        # puis ajoutez au minimum BRAVE_API_KEY
make setup                  # installer les dépendances, démarrer les services de dev, migrer, compiler i18n
make run                    # serveur de dev sur http://localhost:8000
make superuser              # créer un compte
```

`make setup` démarre une pile de développement (PostgreSQL + un intercepteur de mails + LibreTranslate) via Podman Compose, vous obtenez donc un onglet Traduction fonctionnel dès le départ. Exécutez `make` sans arguments pour lister toutes les cibles. Construisez une image de production avec :

```bash
docker build -t seurch .
```

> [!WARNING]
> Définissez toujours un **`SECRET_KEY`** long et aléatoire et un **`DATABASE_URL`** réel en production, et définissez **`DEBUG=False`** (la valeur par défaut lorsque non défini). La valeur dans `.env.example` est uniquement pour le développement local.
