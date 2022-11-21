//
//  ContentView.swift
//  WindowOpen
//
//  Created by Gavin Wiggins on 3/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Click button to open the window")
            Button("Open Info Window") {
                if let url = URL(string: "windowapp://infowindow") {
                    NSWorkspace.shared.open(url)
                }
            }
        }
        .padding()
        .frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
