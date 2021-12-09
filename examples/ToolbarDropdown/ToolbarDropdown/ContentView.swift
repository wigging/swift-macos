//
//  ContentView.swift
//  ToolbarDropdown
//
//  Created by Gavin Wiggins on 12/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Click the toolbar item to see a dropdown menu.")
        }
        .toolbar {
            ToolbarItem {
                Menu {
                    Button("Open in Preview", action: {})
                    Button("Save as PDF", action: {})
                } label: {
                    Label("Star", systemImage: "star.fill")
                }
            }
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
