---
title: Benutzer & Zugang
weight: 7
---

# Benutzer & Zugang

Searpa ist **nur mit Anmeldung** zugänglich und hat **keine öffentliche Registrierung**; als Administrator kontrollieren Sie, wer ein Konto hat. Dies hält eine Instanz privat für Ihre Benutzer.

## Konten erstellen

Erstellen Sie Benutzer mit Djangos Standard-Verwaltungsbefehl:

```bash
# Docker
docker exec -it <container> python manage.py createsuperuser

# Aus dem Quellcode
make superuser
```

`createsuperuser` erstellt ein Admin-Konto; für gewöhnliche Benutzer können Sie diese auf die gleiche Weise erstellen (oder über das Django-Admin, sobald Sie einen Superuser haben). Jedes Konto benötigt einen Benutzernamen und ein Passwort; eine E-Mail ist optional (siehe unten).

## E-Mail ist optional

Ein Benutzerkonto erfordert keine E-Mail-Adresse. Ihr **einziger** Verwendungszweck ist das Zurücksetzen des Passworts:

- **Mit einer E-Mail** kann der Benutzer ein vergessenes Passwort über den **Passwort vergessen?**-Fluss zurücksetzen (erfordert [konfigurierte E-Mail]({{< relref "configuration#email-password-reset" >}})).
- **Ohne E-Mail** ist ein vergessenes Passwort für den Benutzer **nicht wiederherstellbar**; Sie würden es für ihn mit `manage.py changepassword <benutzername>` zurücksetzen.

## Passwort als Administrator zurücksetzen

```bash
docker exec -it <container> python manage.py changepassword <benutzername>
```

## Passwort-Reset-E-Mail konfigurieren

Damit Self-Service-Passwort-Resets funktionieren, setzen Sie die `EMAIL_*`-Variablen auf einen echten SMTP-Server; siehe [Konfiguration → E-Mail]({{< relref "configuration#email-password-reset" >}}). Ohne SMTP-Server erstellen Sie Konten und vergeben Passwörter direkt und setzen sie bei Bedarf mit `changepassword` zurück.

> [!NOTE]
> Es gibt keine Registrierungsseite, die deaktiviert oder ratenbegrenzt werden müsste; das Fehlen öffentlicher Registrierung ist eingebaut. Die Aufnahme eines Benutzers ist immer eine bewusste Admin-Aktion.
