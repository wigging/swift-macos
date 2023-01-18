+++
title = "ScrollView"
date = 2022-11-13
+++

The scroll view displays its content within a scrollable area of the window.

<p><img src="/img/scroll-view.png" style="max-width:400px;" alt="scroll view"></p>

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
