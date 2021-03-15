---
title: ProgressView
date: 2021-03-14
---

A `ProgressView` represents completion of a task or the occurance of an activity with an unknown completion time. A default value of 1.0 is used for the total value when tracking completion progress. As the example demonstrates below, different configurations of a progress view are possible.

![progress view](/swift-macos/images/progressview.png)

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            ProgressView()

            ProgressView("Loading...")

            ProgressView(value: 0.3)

            ProgressView(value: 40, total: 100)

            ProgressView(value: 0.55) {
                Label("Loading", systemImage: "bolt.fill")
            }

            ProgressView(value: 0.25, label: {
                Label("Loading", systemImage: "bolt.fill")
            }, currentValueLabel: {
                Text("0.25")
            })

            ProgressView(value: 10.0, total: 100.0, label: {
                Label("Download", systemImage: "icloud.and.arrow.down")
            }, currentValueLabel: {
                HStack {
                    Text("0")
                    Spacer()
                    Text("50")
                    Spacer()
                    Text("100")
                }
            })
        }
        .padding()
        .frame(width: 400, height: 500)
    }
}
```
