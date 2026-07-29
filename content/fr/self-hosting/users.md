---
title: Utilisateurs et accès
weight: 7
---

# Utilisateurs et accès

Seurch est **accessible uniquement par connexion** et **sans inscription publique**, donc en tant qu'administrateur, vous contrôlez qui a un compte. C'est ce qui maintient une instance privée pour vos utilisateurs.

## Créer des comptes

Créez des utilisateurs avec la commande de gestion standard de Django :

```bash
# Docker
docker exec -it <conteneur> python manage.py createsuperuser

# Depuis les sources
make superuser
```

`createsuperuser` crée un compte administrateur ; pour les utilisateurs ordinaires, vous pouvez les créer de la même façon (ou depuis l'administration Django une fois que vous avez un superutilisateur). Chaque compte nécessite un nom d'utilisateur et un mot de passe ; un e-mail est optionnel (voir ci-dessous).

## L'e-mail est optionnel

Un compte utilisateur ne nécessite pas d'adresse e-mail. Son **seul** usage est la réinitialisation du mot de passe :

- **Avec un e-mail**, l'utilisateur peut réinitialiser un mot de passe oublié via le processus **Mot de passe oublié ?** (nécessite que [l'e-mail soit configuré]({{< relref "configuration#email-password-reset" >}})).
- **Sans e-mail**, un mot de passe oublié est **irrécupérable** par l'utilisateur ; vous le réinitialiseriez avec `manage.py changepassword <nom_utilisateur>`.

## Réinitialiser un mot de passe en tant qu'administrateur

```bash
docker exec -it <conteneur> python manage.py changepassword <nom_utilisateur>
```

## Configurer l'e-mail de réinitialisation de mot de passe

Pour que les réinitialisations de mot de passe en libre-service fonctionnent, définissez les variables `EMAIL_*` pour un vrai serveur SMTP, voir [Configuration → E-mail]({{< relref "configuration#email-password-reset" >}}). Sans serveur SMTP, créez simplement des comptes et distribuez des mots de passe directement, puis réinitialisez-les avec `changepassword` si nécessaire.

> [!NOTE]
> Il n'y a pas de page d'inscription à désactiver ni à limiter en débit ; l'absence d'inscription publique est intégrée. L'intégration d'un utilisateur est toujours une action délibérée de l'administrateur.
