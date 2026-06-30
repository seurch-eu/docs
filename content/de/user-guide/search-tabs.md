---
title: Such-Tabs
weight: 3
---

# Such-Tabs

Neben dem Web-Tab hat Searpa dedizierte Tabs für Bilder, Nachrichten, Videos, Karten und Übersetzungen. Jeder führt Ihre Anfrage gegen Quellen aus, die für diese Art von Inhalt geeignet sind. Ein Tab erscheint nur, wenn die Instanz den benötigten Anbieter konfiguriert hat.

## Bilder

Bilderergebnisse stammen aus dem Brave-Bildindex, ergänzt durch **Pixabay**, wenn aktiviert. Ergebnisse werden als Rasteransicht von Vorschaubildern angezeigt.

Klicken Sie auf ein Bild, um eine **Lightbox** zu öffnen (ähnlich wie Google Bilder):

- Das Bild größer, mit Links zur **Quellseite** und zum **vollständigen Bild**.
- Ein Raster **ähnlicher Bilder**, eine neue Bildsuche, ausgehend von der Bildunterschrift des geöffneten Bildes. Klicken Sie auf eines, um es in den Fokus zu nehmen und weiterzustöbern, oder **Alle Ergebnisse anzeigen**, um die vollständige Suche zu öffnen.

Ähnliche Bilder werden nur für das Bild geladen, das Sie tatsächlich öffnen, sodass sie das Raster nie verlangsamen. Mit deaktiviertem JavaScript öffnet ein Klick auf ein Ergebnis eine serverseitig gerenderte Detailseite mit demselben Bild, denselben Links und demselben Ähnlichkeitsraster.

## Nachrichten

Der **Nachrichten**-Tab gibt aktuelle Artikel aus dem Brave-Nachrichtenindex zurück, ergänzt durch die **World News API**, wenn aktiviert. Jedes Ergebnis zeigt die Quelle, das Alter der Veröffentlichung und ein Vorschaubild. Verwenden Sie den Zeitbereichsfilter, um sich auf die aktuellste Berichterstattung zu konzentrieren.

## Videos

Der **Videos**-Tab kombiniert Brave-Videoergebnisse mit **Sepia**, dem Suchindex für [PeerTube](https://joinpeertube.org/) (ein dezentrales, offenes Videonetzwerk). Ergebnisse zeigen ein Vorschaubild, die Dauer und die Hosting-Website.

## Karten

Der **Karten**-Tab benötigt keine Einrichtung und kein Konto bei einem Anbieter. Geben Sie einen Ortsnamen oder eine Adresse ein, und Searpa:

- **Geokodiert** ihn mit [Nominatim](https://nominatim.openstreetmap.org/) (OpenStreetMaps Suche) und
- zeigt den Standort auf einer **eingebetteten OpenStreetMap-Karte** mit einem Link **In Maps öffnen** und Wegbeschreibungen.

Wenn eine normale **Web**-Suche wie eine Adresse oder ein Ort aussieht, erscheint eine kleine Karten-Schnellantwort neben den Ergebnissen, und die [Wissenskarte]({{< relref "knowledge-cards" >}}) eines Ortes verlinkt direkt zur Karte.

## Übersetzen

Der **Übersetzen**-Tab übersetzt Text zwischen Sprachen, powered by [LibreTranslate](https://libretranslate.com/) (Open-Source-Maschinelle Übersetzung). Wählen Sie eine Zielsprache (und optional eine Quellsprache oder lassen Sie sie automatisch erkennen), fügen Sie Ihren Text ein und lesen Sie die Übersetzung. Die verfügbaren Sprachen hängen von der LibreTranslate-Instanz ab, die der Betreiber angebunden hat.

> [!NOTE]
> Wenn ein Tab fehlt, hat der Instanz-Betreiber diesen Anbieter nicht konfiguriert. Bei einer [selbst gehosteten]({{< relref "/de/self-hosting" >}}) Instanz kontrollieren Sie, welche Anbieter aktiviert sind.
