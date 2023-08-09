---
title: Metal color
date: August 8, 2023
example: swift-macos/xcode-projects/MetalColor
---

Here is a basic example of using Metal to change the color of a view. The sliders change the RGB color values.

<img src="../img/metal-color.png" style="max-width:400px;" alt="metal color">

The main view is shown below and contains the `MetalView()` where the color is drawn.

```swift
// ContentView.swift

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
```

The `MetalView` represents a `MTKView` as shown below.

```swift
// MetalView.swift

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
```

The `Renderer` object sets up the Metal device, pipeline, and buffers for drawing to the view.

```swift
// Renderer.swift

import MetalKit

class Renderer: NSObject {

    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!

    var colorState: MTLComputePipelineState!
    var colorBuffer: MTLBuffer!

    var color = SIMD4<Float>()

    init(metalView: MTKView) {

        super.init()

        guard let device = MTLCreateSystemDefaultDevice(),
              let commandQueue = device.makeCommandQueue()
        else {
            fatalError("GPU not available")
        }

        Renderer.device = device
        Renderer.commandQueue = commandQueue

        let library = device.makeDefaultLibrary()
        let colorScreen = library?.makeFunction(name: "colorScreen")

        do {
            colorState = try device.makeComputePipelineState(function: colorScreen!)
        } catch let error as NSError {
            print(error)
        }

        metalView.device = device
        metalView.framebufferOnly = false
        metalView.delegate = self

        initializeBuffer()
    }

    func initializeBuffer() {
        let size = MemoryLayout<SIMD4<Float>>.size
        colorBuffer = Renderer.device.makeBuffer(bytes: &color, length: size)
    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else { return }

        // Command buffer
        let commandBuffer = Renderer.commandQueue.makeCommandBuffer()

        // Command encoder
        let commandEncoder = commandBuffer?.makeComputeCommandEncoder()
        commandEncoder?.setComputePipelineState(colorState)
        commandEncoder?.setTexture(drawable.texture, index: 0)
        commandEncoder?.setBuffer(colorBuffer, offset: 0, index: 0)

        // Threads
        let w = colorState.threadExecutionWidth
        let h = colorState.maxTotalThreadsPerThreadgroup / w
        let threadsPerThreadGroup = MTLSize(width: w, height: h, depth: 1)
        let threadsPerGrid = MTLSize(width: drawable.texture.width, height: drawable.texture.height, depth: 1)
        commandEncoder?.dispatchThreads(threadsPerGrid, threadsPerThreadgroup: threadsPerThreadGroup)

        // Complete encoding
        commandEncoder?.endEncoding()

        // Commit buffer
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
```

Lastly, the shader function outputs the color for each pixel in the view.

```cpp
// Shader.metal

#include <metal_stdlib>
using namespace metal;

kernel void colorScreen (texture2d<half, access::write> output [[texture(0)]],
                         device float4 *color [[buffer(0)]],
                         uint2 id [[thread_position_in_grid]])
{
    output.write(half4(*color), id);
}
```
