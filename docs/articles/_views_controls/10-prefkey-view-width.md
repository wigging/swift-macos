---
title: PreferenceKey View Width
slug: preferencekey
date: 2020-07-30
---

The PreferenceKey protocol can be implemented to ensure the width of two views stay the same. For example, in the image below, the red bottom rectangle will remain the same width as the orange rectangle when the window is resized.

![preferencekey view width](/swift-macos/images/prefkey-view-width.png)

```swift
struct ViewWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ContentView: View {

    @State private var boxWidth = CGFloat.zero

    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 20)

                Rectangle()
                    .fill(Color.orange)
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewWidthKey.self, value: $0.frame(in: .local).size.width)
                    })
            }

            HStack {
                Spacer()
                Rectangle()
                    .fill(Color.red)
                    .frame(width: boxWidth, height: 20)
            }
        }
        .onPreferenceChange(ViewWidthKey.self) { self.boxWidth = $0 }
        .frame(minWidth: 400, minHeight: 250)
    }
}
```

## Further reading

See [Apple's documentation](https://developer.apple.com/documentation/swiftui/preferencekey) for more information about the PreferenceKey protocol.

The [SwiftUI Lab](https://swiftui-lab.com/communicating-with-the-view-tree-part-1/) and [Swift with Majid](https://swiftwithmajid.com/2020/01/15/the-magic-of-view-preferences-in-swiftui/) articles also discuss the PreferenceKey protocol.

