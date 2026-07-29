---
title: Traduction
weight: 6
---

# Traduction (LibreTranslate)

L'onglet **Traduction** est alimenté par [LibreTranslate](https://libretranslate.com/), un serveur de traduction automatique open source et auto-hébergeable. Seurch l'appelle côté serveur ; aucun service de traduction tiers n'est impliqué.

## Activer l'onglet

Pointez Seurch vers une instance LibreTranslate avec `LIBRETRANSLATE_URL` :

```
LIBRETRANSLATE_URL=http://libretranslate:5000
```

- **Définissez-la** et l'onglet Traduction (ainsi que son paramètre) apparaissent, avec les langues que cette instance propose.
- **Laissez-la non définie** et l'onglet Traduction ainsi que son paramètre sont entièrement désactivés.

## Exécuter LibreTranslate

La pile de développement démarre automatiquement un LibreTranslate local (`make up` en lance un sur `http://localhost:5000`). Pour la production, déployez le vôtre, par exemple :

```yaml
services:
  libretranslate:
    image: libretranslate/libretranslate
    ports:
      - "5000:5000"
```

Définissez ensuite `LIBRETRANSLATE_URL` sur son adresse (utilisez le nom de service interne si les deux s'exécutent dans le même réseau Docker).

## Paramètres optionnels

| Variable | Quand en avez-vous besoin |
|----------|--------------------------|
| `LIBRETRANSLATE_API_KEY` | Uniquement si votre LibreTranslate impose des clés (`LT_API_KEYS=true`). |
| `LIBRETRANSLATE_ORIGIN_COUNTRY` | Code pays à deux lettres pour le drapeau affiché à côté de « Traduction » dans **Paramètres → Moteurs → Sources de données** (par défaut `fr`). L'instance peut être hébergée n'importe où ; c'est purement cosmétique. |

## Statut

LibreTranslate expose un point de terminaison `/languages` gratuit, donc la page [`/status`]({{< relref "search-providers#provider-status-page" >}}) de Seurch le sonde directement et indique si la traduction est actuellement disponible.
