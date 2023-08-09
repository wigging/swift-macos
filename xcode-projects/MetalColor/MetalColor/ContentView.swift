//
//  ContentView.swift
//  MetalColor
//
//  Created by Gavin Wiggins on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MetalView()
            Text("Adjust the sliders to change color")
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
