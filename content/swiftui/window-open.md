---
title: Open a window
date: November 13, 2022
---

To open a window using SwiftUI, first add a WindowGroup that will display the window's view. Use the handlesExternalEvents modifier to indicate the event that is used to display the window.

<img src="../images/window-open.png" style="max-width:600px;" alt="open a window">

```swift
import SwiftUI

@main
struct WindowOpenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        WindowGroup("My Info Window") {
            InfoView()
        }
        .handlesExternalEvents(matching: ["infowindow"])
    }
}
```

```swift
import SwiftUI

struct InfoView: View {
    var body: some View {
        Text("Some text goes here")
            .padding()
            .frame(width: 300, height: 200)
    }
}
```

A Button is used to open the window. The button's action defines the URL related to the app's URL scheme and event.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Click button to open the window")
            Button("Open Info Window") {
                if let url = URL(string: "windowapp://infowindow") {
                    NSWorkspace.shared.open(url)
                }
            }
        }
        .padding()
        .frame(width: 300, height: 200)
    }
}
```

Finally, to get all of this to work properly, define the URL scheme in the Xcode project's settings at Target &rarr; Info &rarr; URL Types.

<img src="../images/window-open-url.png" style="max-width:1000px;" alt="url scheme">
