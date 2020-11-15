---
title: Cursors
date: 2020-06-07
---

The mouse pointer (or cursor) is represented by an arrow on the screen. Different cursors are available in macOS to indicate actions that the user can take with the mouse.

![cursors](/swift-macos/images/cursors.png)

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Hover over each button to change cursor.")

            // i-beam cursor
            Button(" i-beam ") { }
            .onHover { hover in
                hover ? NSCursor.iBeam.push() : NSCursor.pop()
            }

            // crosshair cursor
            Button(" crosshair ") { }
            .onHover { hover in
                hover ? NSCursor.crosshair.push() : NSCursor.pop()
            }

            // close-hand cursor
            Button(" closed-hand ") { }
            .onHover { hover in
                hover ? NSCursor.closedHand.push() : NSCursor.pop()
            }

            // open-hand cursor
            Button(" open-hand ") { }
            .onHover { hover in
                hover ? NSCursor.openHand.push() : NSCursor.pop()
            }

            // pointing-hand cursor
            Button(" pointing-hand ") { }
            .onHover { hover in
                hover ? NSCursor.pointingHand.push() : NSCursor.pop()
            }

        }
        .frame(width: 400, height: 300)
    }
}
```

## Further reading

See [Apple's documentation](https://developer.apple.com/documentation/appkit/nscursor) for an overview of the system cursors and the class method for obtaining them.

