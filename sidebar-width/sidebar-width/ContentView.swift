//
//  ContentView.swift
//  sidebar-width
//
//  Created by Gavin Wiggins on 4/28/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

private let fruits = ["🍎 Apple", "🥥 Coconut", "🥭 Mango", "🥝 Kiwi"]

struct SidebarView: View {
    
    @Binding var selectedFruit: String?
    
    var body: some View {
        List(fruits, id: \.self, selection: $selectedFruit) { fruit in
            Text("\(fruit)")
        }
        //.listStyle(SidebarListStyle())
        //.frame(minWidth: 180, idealWidth: 200, maxWidth: 300)
        .frame(minWidth: 100, idealWidth: 150, maxWidth: 200)
    }
}

struct DetailView: View {
    
    @Binding var fruit: String?
    
    var body: some View {
        Text("\(fruit ?? "Default Fruit")")
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView: View {
    
    @State private var selectedFruit: String?
    
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
