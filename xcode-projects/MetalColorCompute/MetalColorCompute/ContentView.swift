//
//  ContentView.swift
//  MetalColorCompute
//
//  Created by Gavin Wiggins on 9/8/23.
//

import SwiftUI
import MetalKit

struct ContentView: View {

    @State private var mtkView = MTKView()
    @State private var renderer: Renderer?
    @State private var color = SIMD4<Float>(0.8, 0.2, 0.7, 1)

    var body: some View {
        VStack {
            MetalView(mtkView: mtkView)
                .onAppear {
                    renderer = Renderer(metalView: mtkView)
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
