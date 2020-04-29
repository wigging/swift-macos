//
//  ContentView.swift
//  sidebar-width
//
//  Created by Gavin Wiggins on 4/28/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

enum Fruit: String, CaseIterable {
    case apple = "🍎 Apple"
    case coconut = "🥥 Coconut"
    case mango = "🥭 Mango"
    case kiwi = "🥝 Kiwi"
}

struct SidebarView: View {
    
    @Binding var selectedFruit: Fruit?
    
    var body: some View {
        List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
            Text("\(fruit.rawValue)")
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 200, maxWidth: 300)
    }
}

struct DetailView: View {
    
    @Binding var fruit: Fruit?
    
    var body: some View {
        Text("\(fruit?.rawValue ?? "Default Fruit")")
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView: View {
    
    @State private var selectedFruit: Fruit?
    
    var body: some View {
        NavigationView {
            SidebarView(selectedFruit: $selectedFruit)
            DetailView(fruit: $selectedFruit)
        }
        .frame(width: 500, height: 400)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
