---
title: Self-hosting
weight: 20
bookCollapseSection: true
---

# Self-hosting guide

Searpa's search engine is **open source**, so you can run your own instance and
be the only operator who ever touches your users' data. This guide is for
administrators deploying and operating Searpa.

An instance is a single [Django](https://www.djangoproject.com/) application
backed by **PostgreSQL**. It ships as a Docker image that serves its own static
files and runs database migrations on start, so a minimal deployment is one
container plus a database.

## In this guide

| Page | What it covers |
|------|----------------|
| [Requirements]({{< relref "requirements" >}}) | What you need before you start |
| [Quick start]({{< relref "quick-start" >}}) | Get an instance running with Docker |
| [Configuration]({{< relref "configuration" >}}) | Every environment variable |
| [Search providers]({{< relref "search-providers" >}}) | API keys that light up engines, tabs and cards |
| [Getting API keys]({{< relref "provider-keys" >}}) | Step-by-step signup for each provider |
| [Translation]({{< relref "translation" >}}) | Wiring up LibreTranslate for the Translate tab |
| [Users & access]({{< relref "users" >}}) | Creating accounts, email, password reset |
| [API keys]({{< relref "api-keys" >}}) | Issuing and revoking API keys for users |
| [Maintenance]({{< relref "maintenance" >}}) | Scheduled tasks, bangs, cache, provider status |
| [Production notes]({{< relref "production" >}}) | Static files, health checks, footer, email |

> [!NOTE]
> **What you get.** Self-hosting gives you the full Searpa search engine, every
> tab, instant answers, knowledge cards, settings and the public API. Which tabs
> and cards actually appear depends on which [providers]({{< relref "search-providers" >}})
> you configure.
