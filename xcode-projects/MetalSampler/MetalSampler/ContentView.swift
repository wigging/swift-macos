//
//  ContentView.swift
//  MetalSampler
//
//  Created by Gavin Wiggins on 10/7/23.
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
            .frame(minWidth: 200, minHeight: 200)
            .padding()
            
            Text("Resize window to resample texture")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
