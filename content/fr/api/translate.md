---
title: Traduction
weight: 6
---

# Traduction

Traduisez du texte entre langues, alimenté par le LibreTranslate de l'instance. Ce point de terminaison accepte **GET ou POST** ; utilisez POST pour garder le texte long hors de l'URL et des journaux.

```
GET  /api/v1/translate/
POST /api/v1/translate/
```

## Traduire du texte

| Paramètre | Requis | Signification |
|-----------|--------|---------------|
| `q` (ou `text`) | oui | Le texte à traduire |
| `target` | oui | Code de la langue cible (par ex. `fr`) |
| `source` | non | Code de la langue source ; par défaut `auto` (détection automatique) |

```bash
# GET
curl -H "Authorization: Api-Key searpa_sk_<préfixe>.<secret>" \
  "https://search.example.com/api/v1/translate/?q=hello&target=fr"

# POST (mieux pour les textes longs)
curl -X POST -H "Authorization: Api-Key searpa_sk_<préfixe>.<secret>" \
  -d "q=hello world" -d "target=fr" \
  "https://search.example.com/api/v1/translate/"
```

```json
{
  "source": "auto",
  "target": "fr",
  "translated_text": "bonjour le monde",
  "detected_lang": "en"
}
```

- `detected_lang` n'est renseigné que lorsque `source` était `auto` (sinon vide).
- Si la traduction n'est pas configurée sur l'instance, le point de terminaison renvoie **`503`** avec `{"detail": "Translation is unavailable or not configured on this deployment."}`.

## Lister les langues disponibles

```
GET /api/v1/translate/languages/
```

```json
{
  "languages": [
    { "code": "en", "name": "English" },
    { "code": "fr", "name": "French" }
  ]
}
```

La liste reflète ce que l'instance LibreTranslate connectée propose ; voir [Traduction]({{< relref "/fr/self-hosting/translation" >}}) pour le côté auto-hébergement.
