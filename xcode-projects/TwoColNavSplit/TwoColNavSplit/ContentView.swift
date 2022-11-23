//
//  ContentView.swift
//  TwoColNavSplit
//
//  Created by Gavin Wiggins on 11/22/22.
//

import SwiftUI

struct AppleView: View {
    var body: some View {
        Text("Apple View 🍎").font(.title)
    }
}

struct KiwiView: View {
    var body: some View {
        Text("Kiwi View 🥝").font(.title)
    }
}

struct PeachView: View {
    var body: some View {
        Text("Peach View 🍑").font(.title)
    }
}

enum Fruit: String, CaseIterable {
    case apple = "Apple"
    case kiwi = "Kiwi"
    case peach = "Peach"
}

struct DetailView: View {
    
    @Binding var selectedItem: Fruit
    
    var body: some View {
        switch selectedItem {
        case .apple:
            AppleView()
        case .kiwi:
            KiwiView()
        case .peach:
            PeachView()
        }
    }
}

// Basic example
// ---------------------------------------------------------------------------

struct ContentView: View {

    @State private var selectedFruit: Fruit = .apple

    var body: some View {
        NavigationSplitView {
            List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
                Text(fruit.rawValue)
            }
        } detail: {
            DetailView(selectedItem: $selectedFruit)
        }
        .frame(minWidth: 500, minHeight: 300)
    }
}

// Example using AppStorage to store selected sidebar item
// ---------------------------------------------------------------------------

//struct ContentView: View {
//
//    @AppStorage("selectedFruit") private var selectedFruit: Fruit = .apple
//
//    var body: some View {
//        NavigationSplitView {
//            List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
//                Text(fruit.rawValue)
//            }
//        } detail: {
//            DetailView(selectedItem: $selectedFruit)
//        }
//        .frame(minWidth: 500, minHeight: 300)
//    }
//}

// Example of setting a fixed sidebar width
// ---------------------------------------------------------------------------

//struct ContentView: View {
//
//    @State private var selectedFruit: Fruit = .apple
//
//    var body: some View {
//        NavigationSplitView {
//            List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
//                Text(fruit.rawValue)
//            }
//            .navigationSplitViewColumnWidth(200)
//        } detail: {
//            DetailView(selectedItem: $selectedFruit)
//        }
//        .frame(minWidth: 500, minHeight: 300)
//    }
//}

// Example of setting a flexible sidebar width
// ---------------------------------------------------------------------------

//struct ContentView: View {
//
//    @State private var selectedFruit: Fruit = .apple
//
//    var body: some View {
//        NavigationSplitView {
//            List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
//                Text(fruit.rawValue)
//            }
//            .navigationSplitViewColumnWidth(min: 150, ideal: 180, max: 200)
//        } detail: {
//            DetailView(selectedItem: $selectedFruit)
//        }
//        .frame(minWidth: 500, minHeight: 300)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
