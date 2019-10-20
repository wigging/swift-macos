---
title: Window size
date: 2019-10-20
---

# Window size

The window size can be defined by setting the frame size of the containing view. In this example the VStack frame is set to a width of 500 and height of 300; therefore, the window will size will be 500 by 300.

```swift
struct ContentView : View {
    var body: some View {

        VStack {
            Text("Hello World")
        }
        .frame(width: 500, height: 300)

    }
}
```

<img src="assets/window-size.png" class="img-small">

## Example code

The window-size folder in the [swift-macos](https://github.com/wigging/swift-macos) repository contains an example Xcode provide for this article.
