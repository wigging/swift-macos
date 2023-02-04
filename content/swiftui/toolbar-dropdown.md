---
title: Toolbar dropdown
date: November 13, 2022
---

Place a menu in a toolbar item to display a dropdown when the toolbar item is clicked.

<p><img src="../img/toolbar-dropdown.png" style="max-width:400px;" alt="toolbar dropdown"></p>

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
