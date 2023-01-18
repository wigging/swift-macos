+++
title = "Defaults command line tool"
date = 2022-11-10
+++

User defaults created via UserDefaults or AppStorage can be read and deleted using the defaults command line tool. This is useful to clear an app's preferences when developing in Xcode by providing the bundle identifier to the tool.

```bash
# Read the defaults for the app
defaults read com.GavinWiggins.SidebarNav

# Delete the defaults for the app
defaults delete com.GavinWiggins.SidebarNav
```
