---
title: Window size
---

The window size is defined by the frame size of the containing view. In this example the VStack frame is set to a width of 500 and height of 300 which makes the window width 500 and height 300.

![window size](/swift-macos/images/window-size.png)

```swift
import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            Text("Window size is 500 by 300")
        }
        .frame(width: 500, height: 300)
    }
}
```
