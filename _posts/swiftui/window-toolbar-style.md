---
title: Window and toolbar style
date: November 13, 2022
---

The window and toolbar style can be defined with the windowStyle() and windowToolbarStyle() modifiers for the WindowGroup in the main app struct. Some of the styles are demonstrated below.

This example shows the default window and toolbar styles.

<p><img src="../img/windowstyle1.png" style="max-width:400px;" alt="default window style"></p>

```swift
import SwiftUI

@main
struct WindowStyleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.automatic)
        .windowToolbarStyle(.automatic)
    }
}
```

A window with a unified compact toolbar is shown below.

<p><img src="../img/windowstyle2.png" style="max-width:400px;" alt="unified compact window style"></p>

```swift
import SwiftUI

@main
struct WindowStyleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.automatic)
        .windowToolbarStyle(.unifiedCompact)
    }
}
```

Lastly, a window with a hidden title bar and a unified compact toolbar is demonstrated.

<p><img src="../img/windowstyle3.png" style="max-width:400px;" alt="hidden title window style"></p>

```swift
import SwiftUI

@main
struct WindowStyleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unifiedCompact)
    }
}
```
