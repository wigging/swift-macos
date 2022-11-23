//
//  ContentView.swift
//  TwoColNavSplitFill
//
//  Created by Gavin Wiggins on 11/22/22.
//

import SwiftUI

struct AppleView: View {
    var body: some View {
        VStack {
            Text("Apple View 🍎").font(.title)
            Button("Button") {}
        }
        .navigationTitle("Apple View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}

struct KiwiView: View {
    var body: some View {
        VStack {
            Text("Kiwi View").font(.title)
            Text("🥝").font(.title)
        }
        .navigationTitle("Kiwi View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.green)
    }
}

struct PeachView: View {
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("Peach View 🍑").font(.title)
            TextField("Enter text", text: $text).frame(width: 100)
            Text("Entered text is:\n\(text)")
        }
        .navigationTitle("Peach View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
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
        .frame(width: 500, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
