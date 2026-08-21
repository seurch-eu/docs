---
title: Recherche web
weight: 2
---

# Recherche web

L'onglet **Web** est le cœur de Seurch. Il peut s'appuyer sur quatre index web indépendants et fusionner ceux que vous activez en une seule liste classée.

## Les quatre moteurs

| Moteur | Description |
|--------|-------------|
| **Brave** | Un grand index web indépendant (alimente aussi Images, Actualités et Vidéos). |
| **Mojeek** | Un index de recherche britannique indépendant avec son propre robot d'exploration. |
| **Marginalia** | Un index non commercial axé sur le web petit et non commercial. |
| **Staan** | Un index européen construit par European Search Perspective, la coentreprise de Qwant et Ecosia. Résultats web uniquement. |

Vous choisissez les moteurs à utiliser dans **Paramètres → Moteurs**, section **Web**. Activez-en un seul pour une source unique, ou plusieurs pour les combiner. La sélection est **propre à chaque type de recherche** : les moteurs derrière vos résultats web ne touchent donc ni Images ni Actualités, voir [Paramètres]({{< relref "settings" >}}).

Sur une instance auto-hébergée, chaque moteur pour lequel l'opérateur dispose d'une clé est activé par défaut. Sur le service hébergé, un nouveau compte démarre avec **Brave et Staan**, les autres attendent d'être activés.

> [!NOTE]
> Staan cesse de paginer au-delà d'un décalage de 30 : il alimente les **quatre premières pages** d'une recherche puis se retire, et il ignore les requêtes de plus de 400 caractères. Les autres moteurs continuent de répondre dans les deux cas.

## Comment les résultats sont fusionnés

Lorsque plusieurs moteurs renvoient des résultats, Seurch les fusionne avec **Reciprocal Rank Fusion (RRF)** plutôt que de simplement concaténer les listes :

- Chaque URL de résultat reçoit des points selon son classement dans chaque moteur qui l'a retournée.
- La même URL provenant de plusieurs moteurs est regroupée en **une seule** entrée, et ses scores s'additionnent, ce qui fait remonter une page sur laquelle plusieurs moteurs s'accordent.
- Chaque résultat fusionné indique **quels moteurs** y ont contribué, vous permettant de voir quand il y a un accord entre moteurs.

L'effet : les résultats larges et courants que tout le monde remonte sont bien classés, tandis que les trouvailles distinctives d'un seul index (en particulier les résultats du petit web de Marginalia) apparaissent quand même.

## Affiner une recherche

- **Plage temporelle** — filtrez sur le dernier jour, la dernière semaine, le dernier mois ou l'année.
- **Recherche sécurisée** — activée par défaut ; désactivez-la dans [Paramètres]({{< relref "settings" >}}) pour inclure les résultats pour adultes.
- **Corrections orthographiques** — lorsqu'une requête semble mal orthographiée, Seurch propose une correction au-dessus des résultats.
- **Pagination** — naviguez dans d'autres résultats en bas de la liste.
- **Langues** — définissez une langue de recherche préférée dans Paramètres, ou laissez-la sur *Auto* pour suivre votre navigateur.

## Bloquer des sites

Vous pouvez masquer les résultats provenant de domaines que vous ne souhaitez jamais voir. Ajoutez-les dans **Paramètres → Sites bloqués** ; les résultats correspondants sont filtrés de toutes les recherches web. Cette liste est stockée dans votre compte.

## Bangs

Tapez un `!bang` n'importe où dans votre requête pour la rediriger ; par exemple `!w einstein` vous envoie directement sur Wikipédia, et `!images coucher de soleil` saute à l'onglet Images. Consultez [Bangs]({{< relref "bangs" >}}) pour tous les détails.
