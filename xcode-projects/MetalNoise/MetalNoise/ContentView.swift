//
//  ContentView.swift
//  MetalNoise
//
//  Created by Gavin Wiggins on 9/21/23.
//

import SwiftUI
import MetalKit

struct ContentView: View {
    
    @State private var mtkView = MTKView()
    @State private var renderer: Renderer?

    var body: some View {
        VStack {
            MetalView(mtkView: mtkView).onAppear {
                renderer = Renderer(metalView: mtkView)
            }
            
            Text("Metal noise example")
        }
        .padding()
        .frame(minWidth: 400, minHeight: 300)
    }
}

#Preview {
    ContentView()
}
