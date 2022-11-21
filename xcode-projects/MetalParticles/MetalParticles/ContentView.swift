//
//  ContentView.swift
//  MetalParticles
//
//  Created by Gavin Wiggins on 5/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MetalView()
            Text("Metal particles 🤘")
        }
        .padding()
        .frame(minWidth: 400, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
