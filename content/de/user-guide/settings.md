---
title: Einstellungen
weight: 7
---

# Einstellungen

Öffnen Sie **Einstellungen** von der Startseite oder dem Menü aus, um Seurch anzupassen. Ihre Einstellungen **werden automatisch mit Ihrem Konto synchronisiert** und auf jedem Gerät wiederhergestellt, auf dem Sie sich anmelden. Sie werden auch in Ihrem Browser gespeichert, sodass sie auch vor der Anmeldung gelten.

## Was Sie ändern können

| Einstellung | Optionen | Standard |
|-------------|---------|---------|
| **Suchmaschinen** | Pro Suchart, beliebige Kombination der für diese Art verfügbaren Anbieter | Alles, was die Instanz konfiguriert hat |
| **SafeSearch** | Ein / Aus | Ein |
| **Suchsprache** | Auto oder eine der sieben UI-Sprachen | Auto (Ihr Browser) |
| **Oberflächensprache** | Auto oder eine der sieben UI-Sprachen | Auto |
| **Design** | System / Hell / Dunkel | System |
| **Links öffnen** | Gleicher Tab / Neuer Tab | Gleicher Tab |
| **Ähnliche Bilder** | Ein / Aus | Ein |
| **Bilder proxyen** | Ein / Aus | Aus |

### Suchmaschinen

Unter **Einstellungen → Suchmaschinen** wählen Sie die Anbieter hinter jeder Art von Suche. Der Bereich ist nach **Suchart** gegliedert – Web, Bilder, Nachrichten, Videos, Karten und Übersetzen – und **jede Suchart behält ihre eigene Auswahl**. Eine Suchmaschine kann also Ihre Web-Ergebnisse liefern, ohne Bilder oder Nachrichten zu berühren. Die Ergebnisse aller für eine Suchart aktivierten Anbieter werden verschränkt und dedupliziert.

Innerhalb einer Suchart sind die Anbieter unterteilt in:

- **Suchmaschinen**, die die Ergebnisse dieser Art erzeugen: die vier [Web-Suchmaschinen]({{< relref "web-search" >}}) bei Web sowie Brave plus je ein ergänzender Anbieter bei den Medien-Tabs (Pixabay für Bilder, die World News API für Nachrichten, Sepia für Videos).
- **Datenquellen**, die sie anreichern: die [Wissenskarten]({{< relref "knowledge-cards" >}}) (Wikipedia, TheTVDB, TripAdvisor, Stack Exchange) und die Wetter-Sofortantwort.

Jeder Schalter zeigt, von wo aus der Anbieter betrieben wird, ein **Open Source**-Abzeichen, wenn das zugrunde liegende Projekt quelloffen ist, und ein **Kostenpflichtig**-Abzeichen, wenn es sich um eine kostenpflichtige kommerzielle API handelt. So sind die Kosten einer Aktivierung dort sichtbar, wo der Schalter sitzt.

Standardmäßig ist jeder Anbieter aktiviert, den die Instanz konfiguriert hat. Beim gehosteten Dienst startet ein neues Konto stattdessen mit **Brave und Staan**; die übrigen kostenpflichtigen Anbieter warten darauf, eingeschaltet zu werden.

> [!NOTE]
> Wenn Sie für eine Suchart **alles** deaktivieren, wird dieser Tab auf der Ergebnisseite ausgeblendet. Schalten Sie einen Anbieter wieder ein, kommt der Tab zurück.

**Gesperrte Seiten** und **eigene [Bangs]({{< relref "bangs" >}})** haben eigene Bereiche in der Seitenleiste der Einstellungen.

### Sprachen

**Oberflächensprache** ändert die Seurch-Benutzeroberfläche; **Suchsprache** lenkt Ergebnisse in eine Sprache. Beide sind standardmäßig auf *Auto* eingestellt, was Ihrem Browser folgt. Seurchs Oberfläche ist auf Englisch, Französisch, Deutsch, Spanisch, Italienisch, Portugiesisch und Niederländisch verfügbar.

### Design und Links

Wählen Sie ein helles, dunkles oder systemfolgendes Design und ob Ergebnislinks im gleichen oder einem neuen Tab geöffnet werden.

### Bilder proxyen

Mit aktiviertem **Bilder proxyen** werden Bildvorschaubilder über den Seurch-Server abgerufen, nicht direkt von der Quelle, sodass die Quellwebsite Ihren Browser nie sieht. Es ist standardmäßig deaktiviert, da es etwas Latenz hinzufügt.

### Ähnliche Bilder

Wenn Sie ein Bildergebnis öffnen, zeigt Seurch daneben ein Raster visuell ähnlicher Bilder. Jede dieser Abfragen ist selbst eine Bildersuche und zählt daher zu Ihrer monatlichen Suchanzahl. Deaktivieren Sie **Ähnliche Bilder**, um sie ganz zu überspringen.

## Backup & Sync

Unter **Einstellungen → Backup & Sync** können Sie:

- Alle Ihre Einstellungen in eine JSON-Datei **exportieren**.
- Diese auf einer anderen Instanz oder nach einem Reset **importieren**.

Da die Einstellungen mit Ihrem Konto synchronisiert werden, müssen Sie dies normalerweise nicht manuell tun – die Anmeldung auf einem neuen Gerät stellt sie wieder her. Unbegrenzte Listen (Ihre benutzerdefinierten Bangs und blockierten Websites) werden in der Datenbank in Ihrem Konto gespeichert.
