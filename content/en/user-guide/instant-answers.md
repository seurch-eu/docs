---
title: Instant answers
weight: 4
---

# Instant answers

For common utility queries, Searpa shows an **instant answer** right at the top
of the web results, so you get the answer without clicking through. This is in
the spirit of DuckDuckGo's instant answers.

Almost every instant answer is computed **locally on the server**, with no third
party involved and nothing about your query sent anywhere.

## What you can ask

| Category | Example queries |
|----------|-----------------|
| Calculator | `2+2`, `sqrt(16)*3`, `15% of 200` |
| Unit conversion | `5 km to miles`, `100 f to c`, `2 cups to ml` |
| Base conversion | `0xff in decimal`, `255 in binary` |
| Colour | `#4f46e5`, `rgb(255,128,0)`, `color picker` |
| World clock | `time in tokyo`, `what time is it in new york` |
| QR code | `qr code https://example.com` |
| Hash / UUID | `md5 hello`, `sha256 of test`, `uuid` |
| Password | `password generator`, `strong password` |
| Unix time | `unix timestamp`, `1700000000 to date` |
| Encode / decode | `base64 encode hi`, `url decode foo%20bar` |
| JSON / Regex | `json formatter`, `regex tester` |
| HTTP / Ports | `http 404`, `port 443` |
| Randomisers | `roll 2d6`, `flip a coin`, `random number 1-100` |
| Timer | `timer 5 minutes`, `stopwatch` |
| What's my IP | `what's my ip` |

## Multilingual triggers

Instant answers fire in **seven languages**, English, French, German, Spanish,
Italian, Portuguese and Dutch. For example, all of these work:

- `météo à Paris` (weather)
- `wie spät ist es in Berlin` (world clock)
- `100 dólares a euros` (currency)
- `255 en binaire` (base conversion)

## The two that reach the network

Two instant answers fetch live, free, open data (and cache it), so they need a
network connection on the server:

- **Currency** — `100 usd to eur`. Exchange rates come from
  [Frankfurter](https://frankfurter.dev/) (European Central Bank data), fetched
  once and cached for 24 hours; every currency pair is then derived locally. A
  day-old rate is used if the feed is briefly unreachable.
- **Weather** — `weather in Paris`. Current conditions and a 7-day forecast from
  [Open-Meteo](https://open-meteo.com/), cached for an hour.

Everything else in the table above is answered entirely offline.
