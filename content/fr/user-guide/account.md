---
title: Votre compte
weight: 8
---

# Votre compte

## Se connecter

Searpa nécessite une connexion ; toute recherche se fait sous votre compte, et il n'existe pas de formulaire d'inscription public. Sur le service hébergé, les comptes sont sur invitation pendant la phase alpha ; sur une instance auto-hébergée, c'est l'administrateur qui crée les comptes.

Votre compte peut être **anonyme** : il nécessite uniquement un nom d'utilisateur et un mot de passe, **sans e-mail ni autre information personnelle**. Il n'existe pas de recherche anonyme (vous êtes toujours connecté), mais le compte derrière n'a pas besoin de vous identifier.

## E-mail optionnel

Ajouter une adresse e-mail à votre compte est **optionnel** ; un compte fonctionne parfaitement sans. Son seul usage est la **réinitialisation du mot de passe** :

- **Avec un e-mail enregistré**, vous pouvez utiliser **Mot de passe oublié ?** pour recevoir un lien de réinitialisation.
- **Sans e-mail**, un mot de passe perdu est **irrécupérable** ; sur une instance auto-hébergée, vous demanderiez à l'administrateur de le réinitialiser.

Votre e-mail n'est jamais utilisé à des fins de marketing, de traçage ou autre que la récupération de compte.

## Changer votre mot de passe

Utilisez le processus de réinitialisation de mot de passe (si vous avez un e-mail enregistré) ou les paramètres du compte pour changer votre mot de passe. Les utilisateurs auto-hébergés sans e-mail doivent contacter leur administrateur.

## Clés API

L'[API]({{< relref "/fr/api" >}}) programmatique est une fonctionnalité **auto-hébergée** ; elle n'est pas disponible sur le service hébergé searpa.eu. Sur une instance que vous [gérez vous-même]({{< relref "/fr/self-hosting" >}}), créez une **clé API** dans **Paramètres → Clés API** :

- Cliquez pour créer une clé, en lui donnant éventuellement un nom.
- La **clé complète n'est affichée qu'une seule fois** ; copiez-la immédiatement dans un endroit sûr. Seuls un préfixe et un hachage sont stockés, elle ne peut donc pas être affichée à nouveau.
- Révoquez une clé à tout moment depuis le même écran.

Votre total mensuel de recherches (sur le site web et l'API) est affiché dans Paramètres. Consultez le [guide API]({{< relref "/fr/api" >}}) pour savoir comment utiliser une clé.

> [!WARNING]
> Traitez une clé API comme un mot de passe. Quiconque la possède peut rechercher en votre nom et consommer votre limite de débit. Si une clé est compromise, révoquez-la et créez-en une nouvelle.
