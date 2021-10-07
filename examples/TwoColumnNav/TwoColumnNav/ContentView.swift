//
//  ContentView.swift
//  TwoColumnNav
//
//  Created by Gavin Wiggins on 10/6/21.
//

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
