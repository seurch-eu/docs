---
title: Users & access
weight: 7
---

# Users & access

Seurch is **login-only** with **no public registration**, so as the
administrator you control who has an account. This is what keeps an instance
private to your users.

## Creating accounts

Create users with Django's standard management command:

```bash
# Docker
docker exec -it <container> python manage.py createsuperuser

# From source
make superuser
```

`createsuperuser` makes an admin account; for ordinary users you can create them
the same way (or from the Django admin once you have a superuser). Each account
needs a username and password; an email is optional (see below).

## Email is optional

A user account doesn't require an email address. Its **only** use is password
reset:

- **With an email**, the user can reset a forgotten password via the
  **Forgot password?** flow (requires [email to be configured]({{< relref "configuration#email-password-reset" >}})).
- **Without one**, a forgotten password is **unrecoverable** by the user, you'd
  reset it for them with `manage.py changepassword <username>`.

## Resetting a password as admin

```bash
docker exec -it <container> python manage.py changepassword <username>
```

## Configuring password-reset email

For self-service password resets to work, set the `EMAIL_*` variables to a real
SMTP server, see [Configuration → Email]({{< relref "configuration#email-password-reset" >}}).
Without an SMTP server, simply create accounts and hand out passwords directly,
and reset them with `changepassword` when needed.

> [!NOTE]
> There is no sign-up page to disable or rate-limit, the absence of public
> registration is built in. Onboarding a user is always a deliberate admin action.
