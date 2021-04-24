---
title: Blur effect
date: 2021-04-23
---

The blur modifier can be used to blur a view.

```swift
import SwiftUI

struct ContentView: View {

    @State private var blurRadius: CGFloat = 0.0

    var body: some View {
        VStack(spacing: 40) {
            Text("Hello 😁")
                .font(.title)
                .blur(radius: blurRadius)

            Button("My Button"){}
                .blur(radius: blurRadius)

            Slider(value: $blurRadius, in: 0...20, minimumValueLabel: Text("0"), maximumValueLabel: Text("20")) {
                Text("Blur radius")
            }
            .padding()
        }
        .frame(width: 400, height: 300)
    }
}
```

![blur effect](/swift-macos/images/blur-effect1.png)

![blur effect](/swift-macos/images/blur-effect2.png)
