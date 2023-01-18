+++
title = "Window size"
date = 2022-11-17
+++

The desired window size is determined by the resizability of the WindowGroup. As shown below, the resizability of the window is based on the ContentView.

```swift
import SwiftUI

@main
struct WindowSizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
    }
}
```

The size of the ContentView is defined by the frame size. This example generates a 300x200 fixed window size.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe").imageScale(.large)
            Text("Hello, world!").fontWeight(.bold)
        }
        .frame(width: 300, height: 200)
        .background(.orange)
    }
}
```

<p><img src="/img/window300x200.png" style="max-width:300px;" alt="window size"></p>

A resizable window is created with the example shown below. Its minimum size is 200x200 and its maximum size is 500x400.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe").imageScale(.large)
            Text("Hello, world!").fontWeight(.bold)
        }
        .frame(minWidth: 200, maxWidth: 500, minHeight: 200, maxHeight: 400)
        .background(.purple)
    }
}
```

<p><img src="/img/window500x400.png" style="max-width:500px;" alt="window size"></p>
