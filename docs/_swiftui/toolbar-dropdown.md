---
title: Toolbar dropdown
---

Place a `Menu` in a `ToolbarItem` to display a dropdown menu when the toolbar item is clicked.

![toolbar dropdown](/swift-macos/images/toolbardropdown.png)

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Click the toolbar item to see a dropdown menu.")
        }
        .toolbar {
            ToolbarItem {
                Menu {
                    Button("Open in Preview", action: {})
                    Button("Save as PDF", action: {})
                } label: {
                    Label("Star", systemImage: "star.fill")
                }
            }
        }
        .frame(width: 400, height: 300)
    }
}
```
