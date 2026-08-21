---
title: Paramètres
weight: 7
---

# Paramètres

Ouvrez **Paramètres** depuis la page d'accueil ou le menu pour personnaliser Seurch. Vos préférences **se synchronisent automatiquement avec votre compte** et sont restaurées sur tous les appareils connectés. Elles sont également stockées dans votre navigateur, ce qui les applique même avant que vous vous connectiez.

## Ce que vous pouvez modifier

| Paramètre | Options | Par défaut |
|-----------|---------|------------|
| **Moteurs** | Par type de recherche, toute combinaison des fournisseurs disponibles pour ce type | Tout ce que l'instance a configuré |
| **Recherche sécurisée** | Activée / Désactivée | Activée |
| **Langue de recherche** | Auto, ou l'une des sept langues d'interface | Auto (votre navigateur) |
| **Langue d'interface** | Auto, ou l'une des sept langues d'interface | Auto |
| **Thème** | Système / Clair / Sombre | Système |
| **Ouvrir les liens** | Même onglet / Nouvel onglet | Même onglet |
| **Images similaires** | Activées / Désactivées | Activées |
| **Proxy des images** | Activé / Désactivé | Désactivé |

### Moteurs

**Paramètres → Moteurs** est l'endroit où vous choisissez les fournisseurs derrière chaque type de recherche. La section est regroupée par **type de recherche** — Web, Images, Actualités, Vidéos, Cartes et Traduire — et **chaque type conserve sa propre sélection** : un moteur peut donc alimenter vos résultats web sans toucher aux Images ni aux Actualités. Les résultats de tous les fournisseurs activés pour un type de recherche sont entrelacés et dédupliqués.

Au sein d'un type de recherche, les fournisseurs se répartissent en :

- **Moteurs de recherche**, ceux qui produisent les résultats de ce type : les quatre [moteurs web]({{< relref "web-search" >}}) pour Web, et Brave plus un fournisseur supplémentaire pour chaque onglet de médias (Pixabay pour Images, l'API World News pour Actualités, Sepia pour Vidéos).
- **Sources de données**, celles qui les enrichissent : les [fiches de connaissance]({{< relref "knowledge-cards" >}}) (Wikipédia, TheTVDB, TripAdvisor, Stack Exchange) et la réponse instantanée météo.

Chaque bascule indique depuis où le fournisseur est opéré, un badge **Open source** lorsque le projet sous-jacent est libre, et un badge **Payant** lorsqu'il s'agit d'une API commerciale facturée à l'usage : le coût d'une activation est ainsi visible là où se trouve l'interrupteur.

Par défaut, chaque fournisseur configuré par l'instance est activé. Sur le service hébergé, un nouveau compte démarre plutôt avec **Brave et Staan**, les autres fournisseurs payants attendant d'être activés.

> [!NOTE]
> Désactiver **tout** pour un type de recherche masque cet onglet de la page de résultats. Réactivez un fournisseur et l'onglet revient.

**Sites bloqués** et **[bangs]({{< relref "bangs" >}}) personnalisés** ont leurs propres sections dans la barre latérale des paramètres.

### Langues

La **langue d'interface** modifie l'interface Seurch ; la **langue de recherche** oriente les résultats vers une langue. Les deux sont par défaut sur *Auto*, ce qui suit votre navigateur. L'interface de Seurch est disponible en anglais, français, allemand, espagnol, italien, portugais et néerlandais.

### Thème et liens

Choisissez un thème clair, sombre ou qui suit les préférences du système, et si les liens de résultats s'ouvrent dans le même onglet ou dans un nouvel onglet.

### Proxy des images

Avec le **Proxy des images** activé, les miniatures d'images sont récupérées via le serveur Seurch plutôt que directement depuis la source, de sorte que le site source ne voit jamais votre navigateur. Il est désactivé par défaut car il ajoute une légère latence.

### Images similaires

Lorsque vous ouvrez un résultat d'image, Seurch affiche à côté une grille d'images visuellement similaires. Chacune de ces recherches est elle-même une recherche d'images et compte donc dans votre total mensuel. Désactivez **Images similaires** pour l'ignorer entièrement.

## Sauvegarde et synchronisation

Dans **Paramètres → Sauvegarde et synchronisation**, vous pouvez :

- **Exporter** tous vos paramètres dans un fichier JSON.
- **Les importer** sur une autre instance ou après une réinitialisation.

Étant donné que les paramètres se synchronisent avec votre compte, vous n'avez normalement pas besoin de le faire manuellement : se connecter sur un nouvel appareil les restaure. Les listes non bornées (vos bangs personnalisés et sites bloqués) sont stockées dans la base de données associée à votre compte.
