---
title: Erreurs
weight: 9
---

# Erreurs

L'API utilise des codes de statut HTTP standard et renvoie un corps JSON décrivant le problème.

## Codes de statut

| Code | Signification | Cause typique |
|------|---------------|---------------|
| `200` | OK | Requête réussie. |
| `400` | Mauvaise requête | Un paramètre incorrect, par ex. un `q` manquant, un `page` non entier, ou un `engine` inconnu. |
| `401` | Non autorisé | Aucune clé API envoyée (ou aucun en-tête d'authentification reconnu). |
| `403` | Interdit | La clé appartient à un compte désactivé. |
| `429` | Trop de requêtes | Une [limite de débit]({{< relref "rate-limits" >}}) a été dépassée. |
| `503` | Service indisponible | Un service dépendant n'est pas configuré, par ex. la traduction lorsque LibreTranslate n'est pas défini. |

## Corps d'erreur

### Erreurs de validation (`400`)

Messages indexés par champ :

```json
{ "q": ["This query parameter is required."] }
```

```json
{
  "engine": ["Unknown engine(s): foo. Valid: brave, mojeek, marginalia (or \"all\")."]
}
```

### Erreurs d'authentification (`401` / `403`)

```json
{ "detail": "Invalid or revoked API key." }
```

Une requête sans **aucune** clé reçoit un `401` propre avec un en-tête `WWW-Authenticate: Api-Key` ; une requête avec une **mauvaise** clé reçoit `401` avec le message ci-dessus ; une clé sur un compte désactivé reçoit `403` (`"User account is disabled."`).

### Limitation (`429`)

```json
{ "detail": "Request was throttled. Expected available in 12 seconds." }
```

### Service non configuré (`503`)

```json
{ "detail": "Translation is unavailable or not configured on this deployment." }
```

## Bien gérer les erreurs

- Traitez `401`/`403` comme terminaux ; corrigez la clé, ne réessayez pas.
- Reculez sur `429` en utilisant le délai dans le message (un recul exponentiel est idéal).
- Pour `400`, lisez le message indexé par champ ; il nomme le paramètre en faute.
- Un champ optionnel manquant dans une réponse **réussie** est renvoyé comme valeur vide (`""`, `[]`, ou `null`), pas comme une erreur ; vous pouvez donc lire les champs sans les vérifier tous.
