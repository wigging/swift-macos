---
title: Blur effect
date: November 13, 2022
---

The blur modifier, denoted by `.blur`, can be used to blur a view.

<img src="../images/blur-effect1.png" style="max-width:400px;" alt="blur effect">
<img src="../images/blur-effect2.png" style="max-width:400px;" alt="blur effect">

```{ .swift .pre1000 }
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
