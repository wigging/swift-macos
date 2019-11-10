//
//  ContentView.swift
//  sidebar-navigation
//
//  Created by Gavin Wiggins on 11/10/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    
    @State private var selected = Set<String>()
    
    private let items = ["🍎 Apple", "🍌 Banana", "🥥 Coconut", "🍒 Cherry", "🥜 Peanut", "🍑 Peach", "🍅 Tomato", "🍞 Bread", "🍕 Pizza", "🥦 Broccoli", "🥝 Kiwi", "🧀 Cheese", "🍉 Watermelon"]
    
    var body: some View {
        List(items, id: \.self, selection: $selected) { item in
            NavigationLink(destination: DetailView(selection: item)) {
                Text("\(item)")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct DetailView: View {
    
    var selection: String
    
    var body: some View {
        switch selection {
        case "🍎 Apple":
            return AnyView(AppleView())
        case "🍌 Banana":
            return AnyView(BananaView())
        case "🥥 Coconut":
            return AnyView(CoconutView())
        default:
            return AnyView(
                Text("Some \(selection) view here")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            DetailView(selection: "🍎 Apple")
        }
        .frame(height: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
