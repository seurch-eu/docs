---
title: Such-Tabs
weight: 3
---

# Such-Tabs

Neben dem Web-Tab hat Seurch dedizierte Tabs für Bilder, Nachrichten, Videos, Karten und Übersetzungen. Jeder führt Ihre Anfrage gegen Quellen aus, die für diese Art von Inhalt geeignet sind. Ein Tab erscheint nur, wenn die Instanz den benötigten Anbieter konfiguriert hat **und** Sie unter [Einstellungen → Suchmaschinen]({{< relref "settings" >}}) mindestens einen der Anbieter dieses Tabs aktiviert haben – dort behält jede Suchart ihre eigene Auswahl.

## Bilder

Bilderergebnisse stammen aus dem Brave-Bildindex, ergänzt durch **Pixabay**, wenn aktiviert. Ergebnisse werden als Rasteransicht von Vorschaubildern angezeigt.

Klicken Sie auf ein Bild, um eine **Lightbox** zu öffnen (ähnlich wie Google Bilder):

- Das Bild größer, mit Links zur **Quellseite** und zum **vollständigen Bild**.
- Ein Raster **ähnlicher Bilder**, eine neue Bildsuche, ausgehend von der Bildunterschrift des geöffneten Bildes. Klicken Sie auf eines, um es in den Fokus zu nehmen und weiterzustöbern, oder **Alle Ergebnisse anzeigen**, um die vollständige Suche zu öffnen.

Ähnliche Bilder werden nur für das Bild geladen, das Sie tatsächlich öffnen, sodass sie das Raster nie verlangsamen. Mit deaktiviertem JavaScript öffnet ein Klick auf ein Ergebnis eine serverseitig gerenderte Detailseite mit demselben Bild, denselben Links und demselben Ähnlichkeitsraster.

## Nachrichten

Der **Nachrichten**-Tab gibt aktuelle Artikel aus dem Brave-Nachrichtenindex zurück, ergänzt durch die **World News API**, wenn aktiviert. Jedes Ergebnis zeigt die Quelle, das Alter der Veröffentlichung und ein Vorschaubild. Verwenden Sie den Zeitbereichsfilter, um sich auf die aktuellste Berichterstattung zu konzentrieren.

## Videos

Der **Videos**-Tab kombiniert Brave-Videoergebnisse mit **Sepia**, dem Suchindex für [PeerTube](https://joinpeertube.org/) (ein dezentrales, offenes Videonetzwerk). Die beiden Listen werden verschränkt, sodass PeerTube-Videos nicht unter alles rutschen, was Brave gefunden hat. Ergebnisse zeigen ein Vorschaubild, die Dauer und die Hosting-Website.

## Karten

Der **Karten**-Tab benötigt keine Einrichtung und kein Konto bei einem Anbieter. Geben Sie einen Ortsnamen oder eine Adresse ein, und Seurch:

- **Geokodiert** ihn mit [Nominatim](https://nominatim.openstreetmap.org/) (OpenStreetMaps Suche) und
- zeigt den Standort auf einer **eingebetteten OpenStreetMap-Karte** mit einem Link **In Maps öffnen** und Wegbeschreibungen.

Der Tab zeigt immer eine Karte. Wechseln Sie ohne Anfrage dorthin, oder suchen Sie nach etwas, das sich nicht verorten lässt, erhalten Sie eine Weltansicht mit der Meldung in der Seitenleiste statt eines leeren Panels, sodass Sie sich stattdessen dorthin schwenken und zoomen können. **Wegbeschreibungen** brauchen ein Ziel, diese Schaltfläche erscheint also erst, wenn ein Ort gefunden wurde.

Wenn eine normale **Web**-Suche wie eine Adresse oder ein Ort aussieht, erscheint eine kleine Karten-Schnellantwort neben den Ergebnissen, und die [Wissenskarte]({{< relref "knowledge-cards" >}}) eines Ortes verlinkt direkt zur Karte.

## Übersetzen

Der **Übersetzen**-Tab übersetzt Text zwischen Sprachen, powered by [LibreTranslate](https://libretranslate.com/) (Open-Source-Maschinelle Übersetzung). Wählen Sie eine Zielsprache (und optional eine Quellsprache oder lassen Sie sie automatisch erkennen), fügen Sie Ihren Text ein und lesen Sie die Übersetzung. Die verfügbaren Sprachen hängen von der LibreTranslate-Instanz ab, die der Betreiber angebunden hat.

## Wenn ein Tab leer bleibt

Jeder Tab unterscheidet drei Fälle, sodass ein leeres Panel Ihnen sagt, in welchem Sie sich befinden:

- **Noch nichts gesucht.** Ein Tab-Wechsel trägt keine Anfrage mit, der Tab lädt Sie also ein, eine einzugeben.
- **Kein Anbieter dafür.** Die Instanz hat keinen Schlüssel für diese Suchart, oder Sie haben alle ihre Anbieter deaktiviert, und das Panel sagt es.
- **Nichts gefunden.** Die Suche lief und kam leer zurück, sie schlägt also vor, die Schreibweise zu prüfen oder andere Stichwörter zu versuchen.

> [!NOTE]
> Wenn ein Tab ganz fehlt, hat entweder der Instanz-Betreiber diesen Anbieter nicht konfiguriert, oder Sie haben unter [Einstellungen → Suchmaschinen]({{< relref "settings" >}}) alle Anbieter dieser Suchart deaktiviert. Bei einer [selbst gehosteten]({{< relref "/self-hosting" >}}) Instanz kontrollieren Sie beides.
