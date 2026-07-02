---
title: Ihr Konto
weight: 8
---

# Ihr Konto

## Anmelden

Searpa ist nur mit Anmeldung nutzbar; jede Suche findet unter Ihrem Konto statt, und es gibt kein öffentliches Registrierungsformular. Beim gehosteten Dienst sind Konten während der Alpha-Phase nur auf Einladung erhältlich; bei einer selbst gehosteten Instanz erstellt der Administrator die Konten.

Ihr Konto kann **anonym** sein: Es braucht nur einen Benutzernamen und ein Passwort, **keine E-Mail oder anderen persönlichen Daten**. Es gibt keine anonyme *Suche* (Sie sind immer angemeldet), aber das dahinterstehende Konto muss Sie nicht identifizieren.

## Optionale E-Mail

Das Hinzufügen einer E-Mail-Adresse zu Ihrem Konto ist **optional**; ein Konto funktioniert vollständig ohne. Ihr einziger Zweck ist das **Zurücksetzen des Passworts**:

- **Mit einer hinterlegten E-Mail** können Sie **Passwort vergessen?** verwenden, um einen Reset-Link zu erhalten.
- **Ohne E-Mail** ist ein verlorenes Passwort **nicht wiederherstellbar**; bei einer selbst gehosteten Instanz würden Sie den Administrator bitten, es zurückzusetzen.

Ihre E-Mail wird nie für Marketing, Tracking oder irgendetwas anderes als die Kontowiederherstellung verwendet.

## Ihr Passwort ändern

Verwenden Sie den Passwort-Reset-Vorgang (wenn Sie eine E-Mail hinterlegt haben) oder die Kontoeinstellungen, um Ihr Passwort zu ändern. Selbst-gehostete Benutzer ohne E-Mail sollten ihren Administrator kontaktieren.

## API-Schlüssel

Die programmatische [API]({{< relref "/api" >}}) ist eine **selbst-gehostete** Funktion und auf dem gehosteten searpa.eu-Dienst nicht verfügbar. Auf einer Instanz, die Sie [selbst betreiben]({{< relref "/self-hosting" >}}), erstellen Sie einen **API-Schlüssel** unter **Einstellungen → API-Schlüssel**:

- Klicken Sie zum Erstellen eines Schlüssels und geben Sie ihm optional einen Namen.
- Der **vollständige Schlüssel wird nur einmal angezeigt**; kopieren Sie ihn sofort an einen sicheren Ort. Nur ein Präfix und ein Hash werden gespeichert, er kann also nicht erneut angezeigt werden.
- Widerrufen Sie einen Schlüssel jederzeit über denselben Bildschirm.

Ihre monatliche Suchen-Gesamtzahl (über die Website und die API) wird in den Einstellungen angezeigt. Weitere Informationen zur Nutzung eines Schlüssels finden Sie in der [API-Anleitung]({{< relref "/api" >}}).

> [!WARNING]
> Behandeln Sie einen API-Schlüssel wie ein Passwort. Jeder, der ihn hat, kann in Ihrem Namen suchen und Ihr Ratenlimit verbrauchen. Wenn ein Schlüssel kompromittiert wird, widerrufen Sie ihn und erstellen Sie einen neuen.
