---
title: Sidebar navigation
tags: [NavigationView, List, ScrollView]
---

A navigation view contains a master and detail view. In this example, the master view displays a list of fruits in the sidebar. The detail view determines which view to display based on which item is selected in the sidebar.

![sidebar](/images/sidebar.png)

The content view of the window is a navigation view that contains the master and detail views. An enum defines the state of the sidebar list selection and is used to determine which view is displayed by the detail view. UserDefaults stores the selection so that the detail view displays the last viewed item when the app is relaunched.

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {

    @State private var selectedFruit: Fruit?

    var body: some View {
        NavigationView {
            NavigationMaster(selectedFruit: $selectedFruit)
            NavigationDetail(fruit: $selectedFruit)
        }
    }
}

// NavigationMaster.swift

struct NavigationMaster: View {

    @Binding var selectedFruit: Fruit?
    private let defaultFruit = Fruit(rawValue: UserDefaults.standard.object(forKey: "SelectedFruit") as? String ?? "🥭 Mango")

    var body: some View {
        List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
            Text("\(fruit.rawValue)")
        }
        .listStyle(SidebarListStyle())
        .onAppear {
            self.selectedFruit = self.defaultFruit
        }
    }
}

// NavigationDetail.swift

struct NavigationDetail: View {

    @Binding var fruit: Fruit?

    var body: some View {

        switch fruit {
        case .apple:
            UserDefaults.standard.set(Fruit.apple.rawValue, forKey: "SelectedFruit")
            return AnyView(AppleView())
        case .coconut:
            UserDefaults.standard.set(Fruit.coconut.rawValue, forKey: "SelectedFruit")
            return AnyView(CoconutView())
        case .mango:
            UserDefaults.standard.set(Fruit.mango.rawValue, forKey: "SelectedFruit")
            return AnyView(MangoView())
        case .kiwi:
            UserDefaults.standard.set(Fruit.kiwi.rawValue, forKey: "SelectedFruit")
            return AnyView(KiwiView())
        case .none:
            return AnyView(Text("Default View").frame(width: 300, height: 200))
        }
    }
}

// Fruit.swift

enum Fruit: String, CaseIterable {
    case apple = "🍎 Apple"
    case coconut = "🥥 Coconut"
    case mango = "🥭 Mango"
    case kiwi = "🥝 Kiwi"
}
```

To properly render the entire navigation view in the window, the frame is specified for each detail view. Note that each detail view is the same size. If the views are different sizes the window will try to adjust its size accordingly. Unfortunately, macOS windows animating size changes with SwiftUI is buggy so in this example I use a scroll view for large detail views.

```swift
// AppleView.swift

struct AppleView: View {
    var body: some View {
        VStack {
            Text("Apple View").font(.largeTitle)
            Text("🍎").font(.title)
        }
        .frame(width: 300, height: 200)
    }
}

// CoconutView.swift

struct CoconutView: View {
    var body: some View {
        VStack {
            Text("Coconut View").font(.largeTitle)
            Text("🥥").font(.title)
        }
        .frame(width: 300, height: 200)
    }
}

// Mango.swift

struct MangoView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Mango View").font(.largeTitle)
                Text("🥭").font(.largeTitle)
                ForEach(1..<20) {
                    Text("Mango \($0)")
                }
            }
            .frame(width: 300)
            .padding(.vertical)
        }
    }
}
```
