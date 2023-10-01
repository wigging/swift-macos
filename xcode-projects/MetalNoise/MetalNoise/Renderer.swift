//
//  Renderer.swift
//  MetalNoise
//
//  Created by Gavin Wiggins on 9/21/23.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {
    
    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!
    
    var computePipeline: MTLComputePipelineState!

    init(metalView: MTKView) {
        super.init()
        
        // Setup the GPU device and command queue
        guard let device = MTLCreateSystemDefaultDevice(),
              let commandQueue = device.makeCommandQueue()
        else {
            fatalError("GPU not available")
        }
        Renderer.device = device
        Renderer.commandQueue = commandQueue
        
        // Setup shader function and compute pipeline
        let library = device.makeDefaultLibrary()
        let drawNoise = library?.makeFunction(name: "draw_noise")
        
        do {
            computePipeline = try device.makeComputePipelineState(function: drawNoise!)
        } catch let error as NSError {
            print(error)
        }
        
        // Setup the Metal view
        metalView.device = device
        metalView.clearColor = MTLClearColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        metalView.framebufferOnly = false
        metalView.delegate = self
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else { return }
                
        // Command buffer
        let commandBuffer = Renderer.commandQueue.makeCommandBuffer()
        
        // Command encoder
        let commandEncoder = commandBuffer?.makeComputeCommandEncoder()
        commandEncoder?.setComputePipelineState(computePipeline)
        commandEncoder?.setTexture(drawable.texture, index: 0)

        // Threads
        let w = computePipeline.threadExecutionWidth
        let h = computePipeline.maxTotalThreadsPerThreadgroup / w
        let threadsPerThreadGroup = MTLSize(width: w, height: h, depth: 1)
        let threadsPerGrid = MTLSize(width: drawable.texture.width, height: drawable.texture.height, depth: 1)
        commandEncoder?.dispatchThreads(threadsPerGrid, threadsPerThreadgroup: threadsPerThreadGroup)
        commandEncoder?.endEncoding()

        // Commit the buffer
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
