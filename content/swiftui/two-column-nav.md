---
title: Two column NavigationView
date: November 13, 2022
---

A two column NavigationView creates a sidebar with a list of items and a content view. In the example shown below, selecting an item in the sidebar will change the content view. An @AppStorage property is used to remember the selected item.

<p><img src="../img/two-column-nav1.png" style="max-width:400px;" alt="two column navigation"></p>

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

## Fill content view

To fill the entire content view, set the frame's max width and max height to infinity. This is demonstarated by the red and orange views shown below.

<p><img src="../img/two-column-nav2.png" style="max-width:400px;" alt="two column navigation"></p>

```swift
import SwiftUI

struct RedView: View {
    var body: some View {
        VStack {
            Text("Red View").font(.title)
            Text("🍎").font(.title)
        }
        .navigationTitle("Red View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}

struct OrangeView: View {
    var body: some View {
        VStack {
            Text("Orange View").font(.title)
            Text("🍊").font(.title)
        }
        .navigationTitle("Orange View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
    }
}

struct ContentView: View {
    @AppStorage("savedSelection") private var savedSelection: String?

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Red View", tag: "red", selection: $savedSelection, destination: { RedView() })
                NavigationLink("Orange View", tag: "orange", selection: $savedSelection, destination: { OrangeView() })
            }
            .frame(minWidth: 150)
            .listStyle(SidebarListStyle())

            Text("No sidebar item selected.")
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)
                } label: {
                    Image(systemName: "sidebar.left").help("Toggle sidebar")
                }
            }
        }
        .frame(width: 500, height: 300)
    }
}
```
