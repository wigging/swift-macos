//
//  ContentView.swift
//  SidebarToggle
//
//  Created by Gavin Wiggins on 5/13/21.
//

import SwiftUI

struct Sidebar: View {
    
    var body: some View {
        List {
            Label("Books", systemImage: "book.closed")
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Video Tutorials", systemImage: "tv")
            Label("Contacts", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
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

private func toggleSidebar() {
    NSApp.keyWindow?.contentViewController?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Sidebar()
            Text("Use button to toggle sidebar.")
                .frame(minWidth: 200)
        }
        .frame(width: 500, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
