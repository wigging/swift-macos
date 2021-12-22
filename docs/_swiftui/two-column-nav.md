---
title: Two column NavigationView
---

A two column `NavigationView` creates a sidebar with a list of items and a detail view. In the example shown below, selecting an item in the sidebar will change the detail view. An `AppStorage` property is used to remember the selected item.

![two column navigation](/swift-macos/images/twocolnav.png)

```swift
import SwiftUI

enum Fruit: String, CaseIterable, Identifiable {
    case apple
    case orange
    case mango
    case lemon
    var id: String { rawValue }
}

struct Sidebar: View {

    @Binding var selection: Fruit?

    var body: some View {
        List(Fruit.allCases, id: \.self, selection: $selection) { fruit in
            Text(fruit.rawValue)
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar, label: {
                Image(systemName: "sidebar.left").help("Toggle Sidebar")
            })
        }
        .frame(minWidth: 150)
    }
}

struct DetailView: View {

    var selection: Fruit

    var body: some View {
        switch selection {
        case .apple:
            Text("🍎 \(selection.rawValue)").font(.title).frame(minWidth: 200)
        case .orange:
            Text("🍊 \(selection.rawValue)").font(.title).frame(minWidth: 200)
        case .mango:
            Text("🥭 \(selection.rawValue)").font(.title).frame(minWidth: 200)
        case .lemon:
            Text("🍋 \(selection.rawValue)").font(.title).frame(minWidth: 200)
        }
    }
}

private func toggleSidebar() {
    NSApp.keyWindow?.contentViewController?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct ContentView: View {

    @AppStorage("selection") private var selection: Fruit = .apple

    var body: some View {
        NavigationView {
            Sidebar(selection: Binding($selection))
            DetailView(selection: selection)
        }
        .frame(width: 500, height: 300)
    }
}
```
