---
title: AppStorage
---

The `@AppStorage` property wrapper reads and writes values from `UserDefaults`. The example below saves a fruit name (a string) to the "fruit" key in `UserDefaults`. When the app is relaunched, the saved fruit name will be displayed in the text label. Enter a fruit in the text field then click the "Save fruit" button to save a new fruit to the "fruit" key in `UserDefaults`.

![app storage property](/swift-macos/images/appstorage-property.png)

```swift
import SwiftUI

struct ContentView: View {

    @State private var thefruit = ""
    @AppStorage("fruit") var fruit = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter fruit", text: $thefruit)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 200)
            Button("Save fruit") {
                fruit = thefruit
            }
            Text("Saved fruit: \(fruit)")
        }
        .frame(width: 400, height: 100)
        .padding()
    }
}
```