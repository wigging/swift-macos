---
title: Window resizability
date: February 21, 2023
---

The desired window size is determined by the `windowResizability` method of the `WindowGroup`. The example below uses the frame of the content view to fix the window size to 300x200.

```swift
// WindowResizabilityApp.swift

import SwiftUI

@main
struct WindowResizabilityApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 300, height: 200)
                .background(.orange)
        }
        .windowResizability(.contentSize)
    }
}
```

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe").imageScale(.large)
            Text("Hello, world!").fontWeight(.bold)
        }
    }
}
```

<p><img src="../images/window-resize1.png" style="max-width:300px;" alt="window size"></p>

In the next example, a resizable window is created by defining the minimum and maximum size of the content view's frame. The minimum window size is 200x200 and its maximum size is 500x400.

```swift
// WindowResizabilityApp.swift

import SwiftUI

@main
struct WindowResizabilityApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 200, maxWidth: 500, minHeight: 200, maxHeight: 400)
                .background(.purple)
        }
        .windowResizability(.contentSize)
    }
}
```

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe").imageScale(.large)
            Text("Hello, world!").fontWeight(.bold)
        }
    }
}
```

<p><img src="../images/window-resize2.png" style="max-width:500px;" alt="window size"></p>
