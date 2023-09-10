//
//  ContentView.swift
//  MetalClear
//
//  Created by Gavin Wiggins on 9/4/23.
//

import SwiftUI
import MetalKit

struct ContentView: View {
    
    @State private var mtkView = MTKView()
    @State private var renderer: Renderer?
    
    var body: some View {
        VStack {
            MetalView(mtkView: mtkView)
                .onAppear {
                   renderer = Renderer(metalView: mtkView)
                }
            Text("Use blue as the clear color of the Metal view")
        }
        .padding()
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
