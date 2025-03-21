---
title: Toggle animation
date: November 13, 2022
---

An example of fading text in and out using a toggle is given below. Without the animation modifier, the text would just appear or disappear below the toggle button.

<p><img src="../images/toggle-animation.png" style="max-width:400px;" alt="toggle animate"></p>

```swift
import SwiftUI

struct ContentView: View {

    @State private var visible = false

    var body: some View {
        VStack {
            Toggle("Visible", isOn: $visible)
            if visible {
                Text("Hello there 👋")
            }
        }
        .animation(.default, value: visible)
        .frame(width: 400, height: 300)
    }
}
```
