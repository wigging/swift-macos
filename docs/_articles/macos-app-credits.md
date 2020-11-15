---
title: Application credits
date: 2020-09-20
---

The about window in a Mac application is viewed by selecting the app's name in the top menu bar, then choosing the about item in the menu. The image below is Safari's about window.

![app credits safari](/swift-macos/images/app-credits-safari.png)

To customize the about window for your app, add a file named Credits.rtf to the Xcode project. The text in the RTF file will appear in the about window below the app version and copyright. For example, the following text in Credits.rtf will appear under the version number when you build and run the Xcode project for AppCredits.

```
My Credits

These are the credits for this app. They go in a rich text file named
"Credits" in the Xcode project. See below for an example of a list.

    •   First item is here
    •   Second item here
    •   Third item goes here
    •   Fourth items goes here
    •   Fifth item is here
    •   Six item is the last
```

![app credits](/swift-macos/images/app-credits.png)
