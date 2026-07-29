---
title: Your account
weight: 8
---

# Your account

## Signing in

Seurch is login-only, every search happens under your account, and there is no
public sign-up form. On the hosted service, accounts are invite-only during the
alpha; on a self-hosted instance the administrator creates accounts.

Your account can be **anonymous**: it needs only a username and password, with
**no email or other personal details**. There is no anonymous *search* (you're
always signed in), but the account behind it need not identify you.

## Optional email

Adding an email address to your account is **optional**, an account works fully
without one. Its only purpose is **password reset**:

- **With an email on file**, you can use **Forgot password?** to receive a reset
  link.
- **Without one**, a lost password is **unrecoverable**, so on a self-hosted
  instance you'd ask the administrator to reset it.

Your email is never used for marketing, tracking or anything other than account
recovery.

## Changing your password

Use the password-reset flow (if you have an email on file) or the account
settings to change your password. Self-hosted users without an email should
contact their administrator.

## API keys

The programmatic [API]({{< relref "/api" >}}) is a **self-hosted** feature, it is
not available on the hosted seurch.eu service. On an instance you
[run yourself]({{< relref "/self-hosting" >}}), create an **API key** under
**Settings → API keys**:

- Click to create a key, optionally giving it a name.
- The **full key is shown only once**, copy it somewhere safe immediately. Only
  a prefix and a hash are stored, so it cannot be shown again.
- Revoke a key any time from the same screen.

Your monthly search total (across the website and the API) is shown in Settings.
See the [API guide]({{< relref "/api" >}}) for how to use a key.

> [!WARNING]
> Treat an API key like a password. Anyone with it can search as you and consume
> your rate limit. If a key leaks, revoke it and create a new one.
