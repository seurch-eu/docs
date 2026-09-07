---
title: Notes de production
weight: 11
---

# Notes de production

Quelques points importants à connaître lorsque vous déployez Seurch pour de vrais utilisateurs.

## L'image

- Sert l'application avec **gunicorn** (2 workers) sur le port **8000**.
- Sert ses propres fichiers statiques via [WhiteNoise](https://whitenoise.readthedocs.io/), compressés et hachés ; vous n'avez donc pas besoin d'un serveur de fichiers statiques séparé ni d'un CDN.
- Compile les catalogues de traduction et collecte les fichiers statiques **au moment de la construction**.
- Applique les **migrations** de base de données au démarrage.

## Proxy inverse et TLS

Placez un proxy inverse avec terminaison TLS devant (Caddy, nginx, Traefik, …) et transmettez vers le port 8000. Définissez :

- **`ALLOWED_HOSTS`** sur vos noms d'hôtes publics.
- **`DEBUG=False`** (la valeur par défaut) ; ne déployez jamais une instance publique en mode débogage.
- Un **`SECRET_KEY`** long et aléatoire.

## Vérification de santé

L'application répond à une vérification de santé sur **`/up`** (renvoie un succès lorsque l'application est active). Pointez la sonde de vivacité/préparation de votre orchestrateur ou votre équilibreur de charge là-dessus.

```
GET /up   →  200 OK
```

`/up` ne couvre que l'application. Pour être alerté d'un **fournisseur amont** en panne, pointez également un service de supervision externe vers `/status/health`, voir [Supervision]({{< relref "monitoring" >}}).

## Base de données

Utilisez un **PostgreSQL** géré ou auto-hébergé et définissez `DATABASE_URL`. C'est le seul composant avec état ; l'application elle-même est sans état. Sauvegardez PostgreSQL et vous aurez sauvegardé l'instance. Les paramètres par utilisateur, les bangs personnalisés, les sites bloqués, les clés API et les lignes de statut des fournisseurs y résident tous.

## E-mail

Configurez les variables `EMAIL_*` pour que les e-mails de réinitialisation de mot de passe puissent être envoyés, voir [Utilisateurs et accès]({{< relref "users" >}}). Si vous ne gérez pas de serveur SMTP, créez et réinitialisez les mots de passe avec des commandes de gestion à la place.

## Liens légaux / pied de page

Aucune politique de confidentialité, conditions d'utilisation ni mentions légales ne sont incluses par défaut ; leur contenu dépend de **qui exploite l'instance** et de la juridiction locale. Ajoutez les vôtres avec `FOOTER_LINKS` :

```
FOOTER_LINKS=Confidentialité=https://example.com/privacy,CGU=https://example.com/terms
```

Voir [Configuration → Liens de pied de page]({{< relref "configuration#footer-links" >}}).

## Mise à l'échelle

Seurch est une application Django standard sans état, vous pouvez donc faire tourner plusieurs conteneurs d'application derrière votre proxy, tous pointant vers le même PostgreSQL. Exécutez les [commandes de maintenance planifiée]({{< relref "maintenance" >}}) depuis un seul endroit (un hôte cron ou une tâche planifiée unique) plutôt que sur chaque réplique.

## Proxy d'images et trafic sortant

Si les utilisateurs activent le [proxy d'images]({{< relref "/user-guide/settings" >}}), les miniatures sont récupérées via le serveur ; tenez compte de ce trafic sortant. Tous les appels aux fournisseurs sont en HTTPS sortant depuis le serveur ; si vous êtes derrière une liste blanche, voir les [hôtes des fournisseurs]({{< relref "search-providers#network-allowlist" >}}).
