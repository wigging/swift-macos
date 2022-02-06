---
title: Window and toolbar style
---

The window and toolbar style can be defined with the `.windowStyle()` and `.windowToolbarStyle()` modifiers for the `WindowGroup` in the main app struct. Some of the styles are demonstrated below.

This example shows the default window and toolbar styles.

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

![window style default](/swift-macos/images/windowstyle-default.png)

A window with a unified compact toolbar is shown below.

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

![window style unified compact](/swift-macos/images/windowstyle-unifiedcompact.png)

Lastly, a window with a hidden title bar and a unified compact toolbar is demonstrated.

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

![window style hidden title](/swift-macos/images/windowstyle-hiddentitle.png)
