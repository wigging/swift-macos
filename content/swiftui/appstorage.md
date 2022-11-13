---
title: AppStorage
date: November 13, 2022
---

The `@AppStorage` property wrapper reads and writes values from user defaults. The example below saves a fruit name (a string) to the fruit key in user defaults. When the app is relaunched, the saved fruit name will be displayed in the text label. Enter a fruit in the text field then click the save fruit button to save a new fruit to the fruit key in user defaults.

<img src="../images/appstorage-property.png" style="max-width:400px;" alt="app storage property">

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
