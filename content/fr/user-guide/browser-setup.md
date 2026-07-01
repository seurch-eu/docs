---
title: Configurer votre navigateur
weight: 10
---

# Configurer votre navigateur

Vous pouvez faire de Searpa le moteur de recherche qui se déclenche lorsque vous tapez dans la barre d'adresse ou le champ de recherche du navigateur. Cette page couvre tous les principaux navigateurs, notamment la façon de définir Searpa pour les fenêtres **privées / incognito** spécifiquement.

## L'URL de recherche

Lorsqu'un navigateur vous demande l'URL de votre moteur de recherche, utilisez :

```
https://searpa.eu/?q=%s
```

Remplacez `searpa.eu` par le nom d'hôte de votre propre instance si vous l'auto-hébergez.

Le `%s` est un espace réservé que le navigateur remplace par votre requête. Certains navigateurs appellent ce champ **URL de recherche** ou **URL de requête** ; le format est le même.

## Lien pour la navigation privée

Étant donné que Searpa ne suit pas les requêtes et ne crée pas de profils, il se comporte de la même façon en fenêtre privée / incognito qu'en fenêtre normale — aucune configuration supplémentaire n'est nécessaire pour la confidentialité. Cependant, certains navigateurs vous permettent de définir un moteur de recherche **dédié** aux fenêtres privées, ce qui est utile si vous souhaitez Searpa uniquement lors de la navigation privée :

```
https://searpa.eu/?q=%s
```

L'URL est identique ; ce qui change, c'est *l'endroit* dans les paramètres du navigateur où vous la collez.

---

## Chrome / Chromium

### Définir comme moteur par défaut (toutes les fenêtres)

1. Ouvrez **Paramètres** → **Moteur de recherche** → **Gérer les moteurs de recherche et la recherche sur le site**.
2. Sous **Recherche sur le site**, cliquez sur **Ajouter**.
3. Remplissez :
   - **Nom** : `Searpa`
   - **Raccourci** : `searpa.eu` (ou tout mot-clé de votre choix)
   - **URL** : `https://searpa.eu/?q=%s`
4. Cliquez sur **Ajouter**, puis sur le menu à trois points à côté de Searpa et choisissez **Définir comme valeur par défaut**.

### Fenêtres incognito

Chrome utilise le même moteur de recherche par défaut en mode Incognito. Pour rechercher avec Searpa depuis une fenêtre incognito, définissez-le comme moteur par défaut (ci-dessus) ou tapez le mot-clé raccourci choisi (`searpa.eu`) suivi de <kbd>Tab</kbd> dans la barre d'adresse, puis saisissez votre requête.

---

## Firefox

### Définir comme moteur par défaut (toutes les fenêtres)

1. Accédez à `https://searpa.eu/` dans Firefox.
2. Cliquez sur l'icône de **loupe** dans la barre d'adresse, puis **Ajouter Searpa** (Firefox détecte automatiquement la description OpenSearch du site).
3. Ouvrez **Paramètres** (☰ → **Paramètres**) → **Recherche**.
4. Sous **Moteur de recherche par défaut**, sélectionnez **Searpa** dans la liste déroulante.

Si l'option automatique n'apparaît pas, ajoutez-le manuellement :

1. **Paramètres** → **Recherche** → faites défiler jusqu'à **Raccourcis de recherche** → **Ajouter**.
2. Saisissez :
   - **Nom du moteur de recherche** : `Searpa`
   - **URL du moteur avec `%s` à la place de la requête** : `https://searpa.eu/?q=%s`

### Fenêtres privées (exclusif à Firefox)

Firefox vous permet de choisir un moteur de recherche **différent** pour la navigation privée :

1. **Paramètres** → **Recherche**.
2. Sous **Moteur de recherche par défaut**, cochez **Utiliser ce moteur de recherche aussi dans les fenêtres privées** — ou, si vous souhaitez Searpa *uniquement* en mode privé, définissez votre moteur habituel pour les fenêtres normales et sélectionnez **Searpa** sous **Navigation privée** → **Moteur de recherche privé par défaut** (cette option est disponible depuis Firefox 121).

---

## Safari

Safari ne prend pas en charge l'ajout de moteurs de recherche personnalisés arbitraires sans extension. Les options intégrées se limitent à une liste fixe (Google, Bing, DuckDuckGo, Yahoo, Ecosia, etc.).

### Avec une extension

Installez **Searchie** ou **Keyword Search** (toutes deux gratuites sur l'App Store / Mac App Store). Ces extensions ajoutent un champ de moteur de recherche personnalisé :

1. Installez l'extension et ouvrez ses options.
2. Ajoutez un nouveau moteur avec l'URL `https://searpa.eu/?q=%s` et le mot-clé `searpa`.
3. Activez l'extension et tapez `searpa <requête>` dans la barre d'adresse.

### Navigation privée

La navigation privée de Safari utilise le même moteur de recherche que la fenêtre normale. Si votre extension le prend en charge, le moteur personnalisé fonctionne également dans les onglets privés.

---

## Microsoft Edge

### Définir comme moteur par défaut (toutes les fenêtres)

1. Ouvrez **Paramètres** (⋯ → **Paramètres**) → **Confidentialité, recherche et services** → **Barre d'adresses et recherche** → **Moteurs de recherche**.
2. Cliquez sur **Ajouter**.
3. Remplissez :
   - **Nom** : `Searpa`
   - **Mot-clé** : `searpa.eu`
   - **URL** : `https://searpa.eu/?q=%s`
4. Cliquez sur **Ajouter**, puis sur le menu à trois points à côté de Searpa et choisissez **Définir comme valeur par défaut**.

### Fenêtres InPrivate

Edge utilise le même moteur de recherche par défaut en mode InPrivate. Définissez Searpa comme moteur par défaut (ci-dessus) et il s'appliquera automatiquement aux fenêtres InPrivate.

---

## Brave

Brave est basé sur Chromium ; les étapes sont presque identiques à celles de Chrome.

### Définir comme moteur par défaut

1. **Paramètres** → **Moteur de recherche** → **Gérer les moteurs de recherche**.
2. Cliquez sur **Ajouter** sous **Autres moteurs de recherche**.
3. Remplissez :
   - **Nom** : `Searpa`
   - **Raccourci** : `searpa.eu`
   - **URL** : `https://searpa.eu/?q=%s`
4. Cliquez sur **Ajouter**, puis **⋮** → **Définir comme valeur par défaut**.

### Fenêtres privées et Tor

Les fenêtres privées de Brave utilisent le même moteur par défaut que les fenêtres normales. Les **fenêtres privées avec Tor** de Brave utilisent également le même moteur de recherche.

> [!NOTE]
> Le moteur **Brave Search** intégré peut être remplacé par Searpa en suivant les mêmes étapes. Vous pouvez conserver Brave Search comme mot-clé raccourci et définir Searpa comme moteur par défaut, ou inversement.

---

## Opera

1. Ouvrez **Paramètres** (Alt+P) → **Basique** → **Moteur de recherche** → **Gérer les moteurs de recherche**.
2. Cliquez sur **Ajouter**.
3. Remplissez :
   - **Nom** : `Searpa`
   - **Mot-clé** : `searpa`
   - **URL** : `https://searpa.eu/?q=%s`
4. Cliquez sur **Ajouter**, puis sélectionnez **Searpa** dans la liste déroulante **Moteur de recherche** en haut de cette section.

### Fenêtres privées

Le mode privé d'Opera utilise le même moteur de recherche que le mode normal ; définir Searpa comme moteur par défaut s'applique partout.

---

## Vivaldi

1. **Paramètres** → **Recherche** → cliquez sur **+** (Ajouter un moteur de recherche).
2. Remplissez :
   - **Nom** : `Searpa`
   - **Surnom** : `s`
   - **URL** : `https://searpa.eu/?q=%s`
3. Cochez **Définir comme moteur de recherche par défaut**.

### Fenêtres privées

Vivaldi vous permet de choisir un moteur de recherche distinct pour le mode privé :

1. **Paramètres** → **Recherche**.
2. Sous **Moteur de recherche des fenêtres privées**, sélectionnez **Searpa** dans la liste déroulante (il apparaît une fois que vous l'avez ajouté ci-dessus).
