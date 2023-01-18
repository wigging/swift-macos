+++
title = "Picker control"
date = 2022-11-13
+++

The picker control selects an item from a set of values. The appearance of the picker can be changed by using different styles and modifiers.

<p><img src="/img/picker.png" style="max-width:400px;" alt="picker control"></p>

```swift
import SwiftUI

struct ContentView: View {

    let bands = ["Nirvana", "Pearl Jam", "NIN"]
    @State private var selectedBand = 0

    @State private var selectedName = 0

    var body: some View {
        VStack(spacing: 20) {

            Picker("Band", selection: $selectedBand) {
                ForEach(0..&lt;bands.count) {
                    Text(self.bands[$0])
                }
            }

            Picker("Band", selection: $selectedBand) {
                ForEach(0..&lt;bands.count) {
                    Text(self.bands[$0])
                }
            }
            .pickerStyle(RadioGroupPickerStyle())

            Picker("Band", selection: $selectedBand) {
                ForEach(0..&lt;bands.count) {
                    Text(self.bands[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Picker("Name", selection: $selectedName) {
                Text("Homer Simpson").tag(0)
                Text("Lisa Simpson").tag(1)
                Text("Bart Simpson").tag(2)
            }
            .fixedSize()

            Picker("Name", selection: $selectedName) {
                Text("Homer Simpson").tag(0)
                Text("Lisa Simpson").tag(1)
                Text("Bart Simpson").tag(2)
            }
            .labelsHidden()
            .fixedSize()

        }
        .padding()
        .frame(width: 400, height: 300)
    }
}
```
