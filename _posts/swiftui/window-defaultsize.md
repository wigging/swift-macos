---
title: Window default size
date: February 22, 2023
---

The default window size in this example is set to 400x200. If the window size is changed by dragging the corner or side, then the new size becomes the default size when the app is relaunched. Delete the app's container to restore the app to its default state.

```swift
// WindowDefaultSizeApp.swift

import SwiftUI

@main
struct WindowDefaultSizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 400, height: 200)
    }
}
```

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .padding(.bottom)
            Text("""
            Reset window to default size by deleting
            ~/Library/Containers/com.GavinWiggins.WindowDefaultSize
            """)
        }
        .padding()
    }
}
```

<img src="../images/window-defaultsize.png" style="max-width:400px;" alt="window default size">
