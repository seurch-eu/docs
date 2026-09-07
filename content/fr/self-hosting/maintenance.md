---
title: Maintenance
weight: 9
---

# Maintenance

Seurch nécessite peu de maintenance continue, mais quelques **commandes de gestion** permettent de le garder propre et à jour. Exécutez-les selon un planning (tâche cron, minuteur systemd ou fonctionnalité de tâche planifiée de votre orchestrateur). Exécutez chacune à l'intérieur du conteneur (`docker exec <conteneur> python manage.py …`) ou via `make` / `uv run` depuis les sources.

## Tâches planifiées

| Commande | Ce qu'elle fait | Planning suggéré |
|----------|----------------|------------------|
| `clear_expired_cache` | Supprime les lignes de cache de résultats de recherche expirées | Quotidien |
| `check_provider_health` | Sonde les fournisseurs avec un point de terminaison de santé gratuit afin que `/status` reste à jour, sans dépenser de quota payant | Toutes les ~10 minutes |
| `refresh_currency` | Rafraîchit les taux de change mis en cache et purge le cache de réponses instantanées | Quotidien (optionnel, se rafraîchit aussi à la demande) |

Un exemple de cron :

```cron
# Quotidien à 03:00 : supprimer les entrées de cache expirées
0 3 * * *  cd /app && python manage.py clear_expired_cache

# Toutes les 10 minutes : maintenir la page /status à jour
*/10 * * * *  cd /app && python manage.py check_provider_health
```

Les équivalents `make` depuis les sources sont `make refresh-currency` et les commandes `manage.py` ci-dessus.

`check_provider_health` maintient le statut enregistré à jour ; c'est ce que relit un service de supervision externe interrogeant [`/status/health`]({{< relref "monitoring" >}}), exécutez-le donc régulièrement si vous alertez sur la santé des fournisseurs.

## Tâches ponctuelles / occasionnelles

### Définitions de bangs

La base de données de [bangs]({{< relref "/user-guide/bangs" >}}) (les milliers de `!raccourcis`) est téléchargée depuis le [dépôt de bangs open source de Kagi](https://github.com/kagisearch/bangs) avec :

```bash
python manage.py fetch_bangs        # ou : make bangs
```

Exécutez-la une fois à la configuration, puis occasionnellement pour récupérer les nouvelles définitions de bangs. Si les données de bangs sont manquantes, les bangs retombent simplement sur du texte de requête ordinaire.

### Migrations de base de données

Le conteneur applique automatiquement les migrations à chaque démarrage, donc une mise à niveau normale consiste simplement à extraire une image plus récente et à redémarrer. Pour les exécuter manuellement :

```bash
python manage.py migrate
```

## Mise à niveau

1. Extrayez la nouvelle image (ou reconstruisez depuis les dernières sources).
2. Redémarrez le conteneur ; les migrations s'exécutent automatiquement au démarrage.
3. Si les notes de version mentionnent de nouvelles données de bangs ou de nouveaux fournisseurs, exécutez `fetch_bangs` et révisez les nouvelles variables de [configuration]({{< relref "configuration" >}}).

Étant donné que l'application est sans état à l'exception de PostgreSQL, un redémarrage progressif est sûr ; gardez votre base de données sauvegardée comme d'habitude.

## Cache

Les résultats de recherche sont mis en cache brièvement sur le serveur (environ une heure) pour rester rapides et alléger la charge sur les fournisseurs ; le cache est indexé sur la requête, pas sur un utilisateur. `clear_expired_cache` supprime les entrées périmées afin que la table ne grossisse pas indéfiniment.
