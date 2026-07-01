---
title: Browser setup
weight: 10
---

# Browser setup

You can make Searpa the search engine that fires when you type in the browser address bar or search box. This page covers every major browser, including how to set Searpa for **private / incognito** windows specifically.

## The search URL

When a browser asks for your search engine URL, use:

```
https://searpa.eu/?q=%s
```

Replace `searpa.eu` with your own instance's hostname if you are self-hosting.

The `%s` is a placeholder the browser fills in with your query. Some browsers label this field **Search URL** or **Query URL**; the format is the same.

## Private-browsing link

Because Searpa does not track queries or build profiles, it behaves the same in private / incognito windows as in a regular window — no extra configuration is needed for privacy. However, some browsers let you set a **dedicated** search engine for private windows, which is useful if you want Searpa only when browsing privately:

```
https://searpa.eu/?q=%s
```

The URL is identical; what changes is *where* in the browser settings you paste it.

---

## Chrome / Chromium

### Set as default (all windows)

1. Open **Settings** → **Search engine** → **Manage search engines and site search**.
2. Under **Site search**, click **Add**.
3. Fill in:
   - **Name**: `Searpa`
   - **Shortcut**: `searpa.eu` (or any keyword you like)
   - **URL**: `https://searpa.eu/?q=%s`
4. Click **Add**, then click the three-dot menu next to Searpa and choose **Make default**.

### Private windows

Chrome uses the same default search engine in Incognito. To search with Searpa from Incognito, either set it as the global default (above) or type the shortcut keyword you chose (`searpa.eu`) followed by <kbd>Tab</kbd> in the address bar, then type your query.

---

## Firefox

### Set as default (all windows)

1. Navigate to `https://searpa.eu/` in Firefox.
2. Click the **magnifying-glass** icon in the address bar, then **Add Searpa** (Firefox detects the site's OpenSearch description automatically).
3. Open **Settings** (☰ → **Settings**) → **Search**.
4. Under **Default Search Engine**, select **Searpa** from the dropdown.

If the automatic option doesn't appear, add it manually:

1. **Settings** → **Search** → scroll to **Search Shortcuts** → **Add**.
2. Enter:
   - **Search engine name**: `Searpa`
   - **Engine URL with `%s` in place of query**: `https://searpa.eu/?q=%s`

### Private windows (Firefox exclusive)

Firefox lets you pick a **different** search engine for Private Browsing:

1. **Settings** → **Search**.
2. Under **Default Search Engine**, check **Use this search engine in Private Windows too** — or, if you want Searpa *only* in private mode, set your regular default to something else and select **Searpa** under **Private browsing** → **Default private search engine** (this option appears in Firefox 121 and later).

---

## Safari

Safari does not support adding arbitrary custom search engines without a helper. The built-in options are limited to a fixed list (Google, Bing, DuckDuckGo, Yahoo, Ecosia, etc.).

### With an extension

Install **Searchie** or **Keyword Search** (both free on the App Store / Mac App Store). These extensions add a custom search engine field:

1. Install the extension and open its options.
2. Add a new engine with URL `https://searpa.eu/?q=%s` and keyword `searpa`.
3. Activate the extension and type `searpa <query>` in the address bar.

### Private browsing

Safari Private Browsing uses the same search engine as the regular window. If your extension supports it, the custom engine works in private tabs too.

---

## Microsoft Edge

### Set as default (all windows)

1. Open **Settings** (⋯ → **Settings**) → **Privacy, search, and services** → **Address bar and search** → **Search engines**.
2. Click **Add**.
3. Fill in:
   - **Name**: `Searpa`
   - **Keyword**: `searpa.eu`
   - **URL**: `https://searpa.eu/?q=%s`
4. Click **Add**, then click the three-dot menu next to Searpa and choose **Make default**.

### InPrivate windows

Edge uses the same default search engine in InPrivate mode. Set Searpa as the global default (above) and it will apply in InPrivate windows automatically.

---

## Brave

Brave is Chromium-based; the steps are nearly identical to Chrome.

### Set as default

1. **Settings** → **Search engine** → **Manage search engines**.
2. Click **Add** under **Other search engines**.
3. Fill in:
   - **Name**: `Searpa`
   - **Shortcut**: `searpa.eu`
   - **URL**: `https://searpa.eu/?q=%s`
4. Click **Add**, then **⋮** → **Make default**.

### Private and Tor windows

Brave Private windows use the same default as normal windows. Brave's **Private window with Tor** also uses the same search engine.

> [!NOTE]
> Brave's built-in **Brave Search** can be replaced with Searpa following the same steps. You can keep Brave Search as the shortcut keyword and set Searpa as the default, or vice versa.

---

## Opera

1. Open **Settings** (Alt+P) → **Basic** → **Search engine** → **Manage search engines**.
2. Click **Add**.
3. Fill in:
   - **Name**: `Searpa`
   - **Keyword**: `searpa`
   - **URL**: `https://searpa.eu/?q=%s`
4. Click **Add**, then select **Searpa** in the **Search engine** dropdown at the top of that section.

### Private windows

Opera Private mode uses the same search engine as regular mode; setting Searpa as the default applies everywhere.

---

## Vivaldi

1. **Settings** → **Search** → click **+** (Add search engine).
2. Fill in:
   - **Name**: `Searpa`
   - **Nickname**: `s`
   - **URL**: `https://searpa.eu/?q=%s`
3. Tick **Set as Default Search**.

### Private windows

Vivaldi lets you choose a separate search engine for Private mode:

1. **Settings** → **Search**.
2. Under **Private Window Search Engine**, select **Searpa** from the dropdown (it appears once you have added it above).
