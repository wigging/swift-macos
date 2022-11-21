//
//  ContentView.swift
//  TwoColumnNav2
//
//  Created by Gavin Wiggins on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("savedSelection") private var savedSelection: String?

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Red View", tag: "red", selection: $savedSelection, destination: { RedView() })
                NavigationLink("Orange View", tag: "orange", selection: $savedSelection, destination: { OrangeView() })
            }
            .frame(minWidth: 150)
            .listStyle(SidebarListStyle())
            
            Text("No sidebar item selected.")
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)
                } label: {
                    Image(systemName: "sidebar.left").help("Toggle sidebar")
                }
            }
        }
        .frame(width: 500, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
