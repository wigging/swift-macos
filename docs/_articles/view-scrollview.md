---
title: Scroll view
date: 2020-07-23
---

A scroll view displays its content within a scrollable area of the window.

![scroll view](/swift-macos/images/scroll-view.png)

```swift
import SwiftUI

struct ContentView: View {
    @State private var toggled = true

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text("Scroll up and down").font(.headline)

                Toggle(isOn: $toggled) { Text("Toggle 1") }

                Toggle(isOn: $toggled) { Text("Toggle 2") }

                Toggle(isOn: $toggled) { Text("Toggle 3") }

                Button("Button 1") { }

                Button("Button 2") { }

                Button("Button 3") { }

                Text("Last Item in scroll view")
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 300, height: 200)
    }
}
```
