---
title: Réponses instantanées
weight: 4
---

# Réponses instantanées

Pour les requêtes utilitaires courantes, Seurch affiche une **réponse instantanée** tout en haut des résultats web, vous donnant la réponse sans cliquer nulle part. C'est dans l'esprit des réponses instantanées de DuckDuckGo.

Presque toutes les réponses instantanées sont calculées **localement sur le serveur**, sans tiers impliqué et sans envoyer votre requête nulle part.

## Ce que vous pouvez demander

| Catégorie | Exemples de requêtes |
|-----------|---------------------|
| Calculatrice | `2+2`, `sqrt(16)*3`, `15% de 200` |
| Conversion d'unités | `5 km en miles`, `100 f en c`, `2 tasses en ml` |
| Conversion de base | `0xff en décimal`, `255 en binaire` |
| Couleur | `#4f46e5`, `rgb(255,128,0)`, `color picker` |
| Horloge mondiale | `heure à tokyo`, `quelle heure est-il à new york` |
| Code QR | `qr code https://example.com` |
| Hachage / UUID | `md5 hello`, `sha256 de test`, `uuid` |
| Mot de passe | `générateur de mot de passe`, `mot de passe sécurisé` |
| Heure Unix | `timestamp unix`, `1700000000 en date` |
| Encodage / décodage | `base64 encoder bonjour`, `url décoder foo%20bar` |
| JSON / Regex | `formateur json`, `testeur regex` |
| HTTP / Ports | `http 404`, `port 443` |
| Aléatoire | `lancer 2d6`, `pile ou face`, `nombre aléatoire 1-100` |
| Minuteur | `minuteur 5 minutes`, `chronomètre` |
| Mon IP | `quelle est mon ip` |

## Déclencheurs multilingues

Les réponses instantanées se déclenchent dans **sept langues** : anglais, français, allemand, espagnol, italien, portugais et néerlandais. Par exemple, tous ces exemples fonctionnent :

- `météo à Paris`
- `wie spät ist es in Berlin` (horloge mondiale)
- `100 dólares a euros` (devise)
- `255 en binaire` (conversion de base)

## Les deux qui accèdent au réseau

Deux réponses instantanées récupèrent des données en direct, gratuites et ouvertes (et les mettent en cache), elles nécessitent donc une connexion réseau sur le serveur :

- **Devise** — `100 usd en eur`. Les taux de change proviennent de [Frankfurter](https://frankfurter.dev/) (données de la Banque centrale européenne), récupérées une fois et mises en cache pendant 24 heures ; toutes les paires de devises sont ensuite calculées localement. Un taux vieux d'un jour est utilisé si le flux est brièvement inaccessible.
- **Météo** — `météo à Paris`. Conditions actuelles et prévision sur 7 jours de [Open-Meteo](https://open-meteo.com/), mis en cache pendant une heure.

Tout le reste dans le tableau ci-dessus est traité entièrement hors ligne.
