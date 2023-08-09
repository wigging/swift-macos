//
//  Renderer.swift
//  MetalColor
//
//  Created by Gavin Wiggins on 8/8/23.
//

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
