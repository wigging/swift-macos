---
title: Text vertical
category: Text
tags: Text
image: text-vertical.png
---

Vertical text can be accomplished by rotating a text view 90 degrees. To rotate the frame of the text view, the fixed size modifier must be implemented along with defining the frame size.

```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        HStack {
            Text("Vertical text")
                .rotationEffect(.degrees(-90))
                .fixedSize()
                .frame(width: 20, height: 180)
            Circle()
                .frame(width: 200)
        }
        .frame(width: 400, height: 300)
    }
}
```

![text vertical](/swift-macos/images/text-vertical.png)
