---
title: Browser einrichten
weight: 10
---

# Browser einrichten

Sie können Searpa als Suchmaschine festlegen, die beim Tippen in der Adressleiste oder im Suchfeld des Browsers ausgelöst wird. Diese Seite behandelt alle gängigen Browser, einschließlich der Einrichtung von Searpa speziell für **private / Inkognito-Fenster**.

## Die Such-URL

Wenn ein Browser nach der URL Ihrer Suchmaschine fragt, verwenden Sie:

```
https://searpa.eu/?q=%s
```

Ersetzen Sie `searpa.eu` durch den Hostnamen Ihrer eigenen Instanz, wenn Sie selbst hosten.

Das `%s` ist ein Platzhalter, den der Browser durch Ihre Suchanfrage ersetzt. Einige Browser nennen dieses Feld **Such-URL** oder **Anfrage-URL**; das Format ist identisch.

## Link für privates Surfen

Da Searpa keine Anfragen verfolgt und keine Profile aufbaut, verhält es sich in privaten / Inkognito-Fenstern genauso wie in einem normalen Fenster — für den Datenschutz ist keine zusätzliche Konfiguration erforderlich. Manche Browser ermöglichen es jedoch, eine **eigene** Suchmaschine für private Fenster festzulegen, was nützlich ist, wenn Sie Searpa nur beim privaten Surfen nutzen möchten:

```
https://searpa.eu/?q=%s
```

Die URL ist identisch; was sich ändert, ist *wo* in den Browsereinstellungen Sie sie einfügen.

---

## Chrome / Chromium

### Als Standard festlegen (alle Fenster)

1. Öffnen Sie **Einstellungen** → **Suchmaschine** → **Suchmaschinen und Website-Suche verwalten**.
2. Klicken Sie unter **Website-Suche** auf **Hinzufügen**.
3. Füllen Sie aus:
   - **Name**: `Searpa`
   - **Kürzel**: `searpa.eu` (oder ein beliebiges Schlüsselwort)
   - **URL**: `https://searpa.eu/?q=%s`
4. Klicken Sie auf **Hinzufügen**, dann auf das Drei-Punkte-Menü neben Searpa und wählen Sie **Als Standard festlegen**.

### Inkognito-Fenster

Chrome verwendet im Inkognito-Modus dieselbe Standard-Suchmaschine. Um in einem Inkognito-Fenster mit Searpa zu suchen, legen Sie es als globalen Standard fest (oben) oder tippen Sie das gewählte Kürzel (`searpa.eu`) gefolgt von <kbd>Tab</kbd> in die Adressleiste ein und geben Sie dann Ihre Anfrage ein.

---

## Firefox

### Als Standard festlegen (alle Fenster)

1. Navigieren Sie in Firefox zu `https://searpa.eu/`.
2. Klicken Sie auf das **Lupensymbol** in der Adressleiste und dann auf **Searpa hinzufügen** (Firefox erkennt die OpenSearch-Beschreibung der Website automatisch).
3. Öffnen Sie **Einstellungen** (☰ → **Einstellungen**) → **Suche**.
4. Wählen Sie unter **Standard-Suchmaschine** aus der Dropdown-Liste **Searpa** aus.

Falls die automatische Option nicht erscheint, fügen Sie es manuell hinzu:

1. **Einstellungen** → **Suche** → scrollen Sie zu **Suchkürzel** → **Hinzufügen**.
2. Geben Sie ein:
   - **Name der Suchmaschine**: `Searpa`
   - **Such-URL mit `%s` an Stelle der Anfrage**: `https://searpa.eu/?q=%s`

### Private Fenster (Firefox-exklusiv)

Firefox ermöglicht die Auswahl einer **anderen** Suchmaschine für den privaten Modus:

1. **Einstellungen** → **Suche**.
2. Aktivieren Sie unter **Standard-Suchmaschine** die Option **Diese Suchmaschine auch in privaten Fenstern verwenden** — oder, wenn Sie Searpa *nur* im privaten Modus verwenden möchten, legen Sie Ihre reguläre Suchmaschine für normale Fenster fest und wählen Sie **Searpa** unter **Privates Surfen** → **Standard-Suchmaschine für privates Surfen** (diese Option ist ab Firefox 121 verfügbar).

---

## Safari

Safari unterstützt das Hinzufügen beliebiger benutzerdefinierter Suchmaschinen ohne eine Erweiterung nicht. Die integrierten Optionen beschränken sich auf eine feste Liste (Google, Bing, DuckDuckGo, Yahoo, Ecosia usw.).

### Mit einer Erweiterung

Installieren Sie **Searchie** oder **Keyword Search** (beide kostenlos im App Store / Mac App Store). Diese Erweiterungen fügen ein benutzerdefiniertes Suchmaschinenfeld hinzu:

1. Installieren Sie die Erweiterung und öffnen Sie ihre Optionen.
2. Fügen Sie eine neue Suchmaschine mit der URL `https://searpa.eu/?q=%s` und dem Schlüsselwort `searpa` hinzu.
3. Aktivieren Sie die Erweiterung und tippen Sie `searpa <anfrage>` in die Adressleiste.

### Privates Surfen

Safaris privates Surfen verwendet dieselbe Suchmaschine wie das normale Fenster. Wenn Ihre Erweiterung es unterstützt, funktioniert die benutzerdefinierte Suchmaschine auch in privaten Tabs.

---

## Microsoft Edge

### Als Standard festlegen (alle Fenster)

1. Öffnen Sie **Einstellungen** (⋯ → **Einstellungen**) → **Datenschutz, Suche und Dienste** → **Adressleiste und Suche** → **Suchmaschinen**.
2. Klicken Sie auf **Hinzufügen**.
3. Füllen Sie aus:
   - **Name**: `Searpa`
   - **Schlüsselwort**: `searpa.eu`
   - **URL**: `https://searpa.eu/?q=%s`
4. Klicken Sie auf **Hinzufügen**, dann auf das Drei-Punkte-Menü neben Searpa und wählen Sie **Als Standard festlegen**.

### InPrivate-Fenster

Edge verwendet im InPrivate-Modus dieselbe Standard-Suchmaschine. Legen Sie Searpa als globalen Standard fest (oben) und es gilt automatisch auch für InPrivate-Fenster.

---

## Brave

Brave basiert auf Chromium; die Schritte sind nahezu identisch mit Chrome.

### Als Standard festlegen

1. **Einstellungen** → **Suchmaschine** → **Suchmaschinen verwalten**.
2. Klicken Sie unter **Andere Suchmaschinen** auf **Hinzufügen**.
3. Füllen Sie aus:
   - **Name**: `Searpa`
   - **Kürzel**: `searpa.eu`
   - **URL**: `https://searpa.eu/?q=%s`
4. Klicken Sie auf **Hinzufügen**, dann **⋮** → **Als Standard festlegen**.

### Private und Tor-Fenster

Private Brave-Fenster verwenden denselben Standard wie normale Fenster. Braves **privates Fenster mit Tor** verwendet ebenfalls dieselbe Suchmaschine.

> [!NOTE]
> Braves integrierte **Brave Search** kann durch Searpa ersetzt werden, indem Sie dieselben Schritte ausführen. Sie können Brave Search als Kürzel beibehalten und Searpa als Standard festlegen oder umgekehrt.

---

## Opera

1. Öffnen Sie **Einstellungen** (Alt+P) → **Allgemein** → **Suchmaschine** → **Suchmaschinen verwalten**.
2. Klicken Sie auf **Hinzufügen**.
3. Füllen Sie aus:
   - **Name**: `Searpa`
   - **Schlüsselwort**: `searpa`
   - **URL**: `https://searpa.eu/?q=%s`
4. Klicken Sie auf **Hinzufügen** und wählen Sie dann **Searpa** im Dropdown **Suchmaschine** oben in diesem Abschnitt.

### Private Fenster

Operas privater Modus verwendet dieselbe Suchmaschine wie der normale Modus; die Festlegung von Searpa als Standard gilt überall.

---

## Vivaldi

1. **Einstellungen** → **Suche** → klicken Sie auf **+** (Suchmaschine hinzufügen).
2. Füllen Sie aus:
   - **Name**: `Searpa`
   - **Spitzname**: `s`
   - **URL**: `https://searpa.eu/?q=%s`
3. Setzen Sie ein Häkchen bei **Als Standard-Suchmaschine festlegen**.

### Private Fenster

Vivaldi ermöglicht die Auswahl einer separaten Suchmaschine für den privaten Modus:

1. **Einstellungen** → **Suche**.
2. Wählen Sie unter **Suchmaschine für private Fenster** aus der Dropdown-Liste **Searpa** (es erscheint, sobald Sie es oben hinzugefügt haben).
