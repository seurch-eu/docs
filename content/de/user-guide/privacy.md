---
title: Datenschutz
weight: 9
---

# Datenschutz

Seurch ist als datenschutzfreundliche Alternative zu überwachungsfinanzierten Suchmaschinen konzipiert. Hier ist, was das in der Praxis bedeutet.

## Was Seurch nicht tut

- **Kein Tracking.** Seurch verfolgt Sie nicht im Web oder sitzungsübergreifend, um ein Profil zu erstellen.
- **Keine Werbung.** Es gibt keine Werbung, also keinen Anreiz, Sie zu profilieren.
- **Kein Datenverkauf.** Ihre Suchen sind kein Produkt, das an jemanden verkauft wird.

## Wie Ihre Anfragen behandelt werden

- Suchen laufen **serverseitig**. Seurch spricht in Ihrem Namen mit vorgelagerten Anbietern (Brave, Mojeek, Marginalia und andere), sodass diese Anbieter Ihren Browser oder Ihre IP nicht sehen – sie sehen Seurchs Server.
- **Anbieter-API-Schlüssel erreichen Ihren Browser nie.** Alle vorgelagerten Aufrufe erfolgen auf dem Server.
- **Bilder-Proxy** (optional, in den [Einstellungen]({{< relref "settings" >}})) leitet Vorschaubilder über den Seurch-Server, sodass Quellwebsites Ihren Browser ebenfalls nicht sehen.
- Ergebnisse werden kurzzeitig auf dem Server **gecacht**, um die Geschwindigkeit zu halten und die Last bei Anbietern zu reduzieren; der Cache ist auf die Anfrage, nicht auf Sie, bezogen.

## Ihre Daten

- Ihre **Einstellungen** werden mit Ihrem Konto synchronisiert, damit sie auf allen Geräten verfügbar sind. Sie können sie [exportieren oder löschen]({{< relref "settings" >}}).
- Ihre **E-Mail**, falls Sie eine hinzufügen, wird nur zum Zurücksetzen des Passworts verwendet; siehe [Ihr Konto]({{< relref "account" >}}).

## Wo der Dienst betrieben wird

Der gehostete Dienst wird in der Europäischen Union unter europäischem Datenschutzrecht betrieben. Da die Suchmaschine Open Source ist, kann jeder ihre Funktionsweise prüfen oder [eine eigene Kopie betreiben]({{< relref "/self-hosting" >}}) und der einzige Betreiber sein, der jemals ihre Daten berührt.

> [!NOTE]
> Die spezifische Datenschutzrichtlinie, die Nutzungsbedingungen und das Impressum hängen davon ab, **wer die Instanz betreibt**, die Sie verwenden. Beim gehosteten Dienst finden Sie die Links in der Website-Fußzeile.
