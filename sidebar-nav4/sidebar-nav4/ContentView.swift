//
//  ContentView.swift
//  sidebar-nav4
//
//  Created by Gavin on 9/20/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var selection: String
    
    var body: some View {
        containedView()
    }
    
    private func containedView() -> AnyView {
        switch selection {
        case "🍎 Apple":
            return AnyView(AppleView())
        case "🍊 Orange":
            return AnyView(OrangeView())
        case "🍋 Lemon":
            return AnyView(LemonView())
        default:
            return AnyView(Text("Some view here").frame(maxWidth: .infinity, maxHeight: .infinity))
        }
    }
}

struct SidebarView: View {
    
    let items = ["🍎 Apple", "🍊 Orange", "🍋 Lemon", "🍒 Cherry", "🥜 Peanut", "🍑 Peach", "🍅 Tomato", "🍞 Bread", "🍕 Pizza", "🥦 Broccoli", "🥝 Kiwi", "🧀 Cheese", "🍉 Watermelon"]
    
    var body: some View {
        List(items, id: \.self) { item in
            NavigationLink(destination: DetailView(selection: item)) {
                Text("\(item)")
            }
        }
        .listStyle(SidebarListStyle())
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
