---
title: Two column NavigationView
---

A two column `NavigationView` creates a sidebar with a list of items and a detail view. In the example shown below, selecting an item in the sidebar will change the detail view. An `@AppStorage` property is used to remember the selected item.

![two column navigation](/swift-macos/images/twocolnav.png)

```swift
import SwiftUI

struct ViewA: View {
    var body: some View {
        Text("View A 🍎").font(.title)
    }
}

struct ViewB: View {
    var body: some View {
        Text("View B 🥝").font(.title)
    }
}

struct ViewC: View {
    var body: some View {
        Text("View C 🍑").font(.title)
    }
}

struct ContentView: View {
    @AppStorage("savedSelection") private var savedSelection: String?

    var body: some View {
        NavigationView {
            List {
                NavigationLink("View A", tag: "A", selection: $savedSelection, destination: { ViewA() })
                NavigationLink("View B", tag: "B", selection: $savedSelection, destination: { ViewB() })
                NavigationLink("View C", tag: "C", selection: $savedSelection, destination: { ViewC() })
            }
            .frame(minWidth: 150)
            .listStyle(SidebarListStyle())
            Text("No sidebar item selected.")
        }
        .frame(width: 500, height: 300)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)
                } label: {
                    Image(systemName: "sidebar.left").help("Toggle sidebar")
                }
            }
        }
    }
}
```
