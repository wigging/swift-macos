---
title: Blur effect
date: February 4, 2023
---

The blur modifier, denoted by `.blur`, can be used to blur a view.

<p><img src="../img/blur-effect1.png" style="max-width:400px;" alt="blur effect"></p>
<p><img src="../img/blur-effect2.png" style="max-width:400px;" alt="blur effect"></p>

``` { .swift .pre1000 }
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
