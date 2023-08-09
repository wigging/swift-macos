//
//  MetalView.swift
//  MetalColor
//
//  Created by Gavin Wiggins on 8/8/23.
//

import SwiftUI
import MetalKit

struct MetalView: View {
    
    @State private var metalView = MTKView()
    @State private var renderer: Renderer?
    @State private var color = SIMD4<Float>(0.8, 0.2, 0.7, 1)
    
    var body: some View {
        VStack {
            MetalViewRepresentable(metalView: $metalView)
                .onAppear {
                    renderer = Renderer(metalView: metalView)
                    renderer?.color = color
                    renderer?.initializeBuffer()
                }

            Slider(value: $color.x, in: 0...1) {
                Text("Red \(color.x, specifier: "%.2f")")
            }
            .onChange(of: color.x) { newValue in
                renderer?.color.x = newValue
                renderer?.initializeBuffer()
            }
            
            Slider(value: $color.y, in: 0...1) {
                Text("Green \(color.y, specifier: "%.2f")")
            }
            .onChange(of: color.y) { newValue in
                renderer?.color.y = newValue
                renderer?.initializeBuffer()
            }
            
            Slider(value: $color.z, in: 0...1) {
                Text("Blue \(color.z, specifier: "%.2f")")
            }
            .onChange(of: color.z) { newValue in
                renderer?.color.z = newValue
                renderer?.initializeBuffer()
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
