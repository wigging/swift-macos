---
title: Application should reopen window
tags: [NSApplicationDelegate, NSApplication]
image: app-reopen.png
---

A Mac app created by the default macOS Xcode template will release the main window when it is closed. This makes it impossible to reopen the window unless certain features are added to the app.

![app reopen](/swift-macos/images/app-reopen.png)

In the AppDelegate, prevent the window from being released by setting the isReleasedWhenClosed property to false.

```swift
func applicationDidFinishLaunching(_ aNotification: Notification) {
    // ...

    // Prevent window from being released once it's closed.
    window.isReleasedWhenClosed = false
}
```

Next, use the applicationShouldHandleReopen method in the AppDelegate to handle the reopening of the main app window. You should now be able to reopen the window by clicking the app's Dock icon.

```swift
func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    if flag {
        print("hasVisibleWindows is `true`")
        window.orderFront(self)
    } else {
        print("hasVisibleWindows is `false`")
        window.makeKeyAndOrderFront(self)
    }
    return true
}
```

Another issue is the main app window is still released if the window is closed then another application is selected (becomes active). To prevent this, in the Info.plist file, set `Application can be killed to reclaim memory or other extraordinary circumstances` to `NO`. This is the same as setting `NSSupportsAutomaticTermination` to `NO` in the Info.plist file.
