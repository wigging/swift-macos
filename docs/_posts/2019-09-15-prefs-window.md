---
title: Preferences window
tags: NSWindow
---

A preferences window contains user settings for the application. This window is usually opened from the Preferences item in the application's menu bar. To open a window from the Preferences menu item, connect an IBAction between the item and AppDelegate.

![preferences menu]({{ '/images/preferences-menu.png' | relative_url }}){: .large-img}

```swift
// AppDelegate.swift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var prefsWindow: NSWindow!

    @IBAction func openPrefsWindow(_ sender: NSMenuItem) {
        let prefsView = PreferencesView()
        prefsWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable],
            backing: .buffered,
            defer: false)
        prefsWindow.center()
        prefsWindow.title = "Preferences"
        prefsWindow.setFrameAutosaveName("Preferences Window")
        prefsWindow.contentView = NSHostingView(rootView: prefsView)
        prefsWindow.makeKeyAndOrderFront(nil)
        prefsWindow.isReleasedWhenClosed = false
    }

    // other code
}
```

The contents of the Preferences window is defined in a separate file where controls, text, and other items are added to the window's view.

![preferences window]({{ '/images/preferences-window.png' | relative_url }})

```swift
// PreferencesView.swift

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        Text("My Preferences Window")
            .font(.headline)
            .frame(width: 400, height: 200)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
```
