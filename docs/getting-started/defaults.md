---
title: Defaults tool
---

User defaults created via `UserDefaults` or `@AppStorage` can be read and deleted using the defaults command line tool. This is useful to clear an app's preferences when developing in Xcode by providing the bundle identifier to the tool.

Read the defaults for the app.

```bash
$ defaults read com.GavinWiggins.SidebarNav
````

Delete the defaults for the app.

```bash
$ defaults delete com.GavinWiggins.SidebarNav
```
