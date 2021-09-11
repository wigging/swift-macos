//
//  Sidebar.swift
//  SidebarDisclosureGroup
//
//  Created by Szabolcs Tóth on 2021. 09. 10..
//

import SwiftUI

struct Sidebar: View {
    
    @State private var isExpanded: Bool = true
    
    var body: some View {
        List {
            DisclosureGroup(isExpanded:$isExpanded) {
                Label("Books", systemImage: "book.closed")
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Video Tutorials", systemImage: "tv")
                Label("Contacts", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
            } label: {
                Label("All", systemImage: "list.bullet.rectangle")
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar, label: {
                Image(systemName: "sidebar.left").help("Toggle Sidebar")
            })
        }
        .frame(minWidth: 150)
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.contentViewController?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
