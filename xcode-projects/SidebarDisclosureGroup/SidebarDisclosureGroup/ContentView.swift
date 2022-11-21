//
//  ContentView.swift
//  SidebarDisclosureGroup
//
//  Created by Szabolcs Tóth on 2021. 09. 10..
//

import SwiftUI

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
