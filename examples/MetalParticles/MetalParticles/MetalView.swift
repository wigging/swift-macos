//
//  MetalView.swift
//  MetalParticles
//
//  Created by Gavin Wiggins on 5/20/22.
//

import SwiftUI
import MetalKit

struct MetalView: View {
    
    @State private var metalView = MTKView()
    @State private var renderer: Renderer?
    @State private var count: Int = 5000

    var body: some View {
        VStack {
            MetalViewRepresentable(metalView: $metalView)
                .onAppear {
                    renderer = Renderer(metalView: metalView)
                }
            Stepper("Particle count: \(count)", value: $count, in: 5_000...55_000, step: 10_000)
                .onChange(of: count) { newValue in
                    renderer?.particleCount = newValue
                    renderer?.initializeBuffers()
                }
        }
    }
}

struct MetalViewRepresentable: NSViewRepresentable {
    
    @Binding var metalView: MTKView
    
    func makeNSView(context: Context) -> some NSView {
        metalView
    }
    
    func updateNSView(_ uiView: NSViewType, context: Context) { }
}

struct MetalView_Previews: PreviewProvider {
    static var previews: some View {
        MetalView()
    }
}
