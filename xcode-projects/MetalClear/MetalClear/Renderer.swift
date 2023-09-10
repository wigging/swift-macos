//
//  Renderer.swift
//  MetalClear
//
//  Created by Gavin Wiggins on 9/4/23.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {

    static var commandQueue: MTLCommandQueue!
    
    init(metalView: MTKView) {
        super.init()
        
        // Setup command queue
        guard let device = MTLCreateSystemDefaultDevice(),
              let commandQueue = device.makeCommandQueue()
        else {
            fatalError("GPU not available")
        }
        Renderer.commandQueue = commandQueue
        
        // Setup the Metal view and its clear color
        metalView.device = device
        metalView.clearColor = MTLClearColor(red: 0, green: 0, blue: 1, alpha: 1)
        metalView.delegate = self
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
    
    func draw(in view: MTKView) {
        
        // Get the view's drawable and descriptor
        guard let drawable = view.currentDrawable,
              let descriptor = view.currentRenderPassDescriptor
        else { return }
        
        // Make the command buffer and encoder
        let commandBuffer = Renderer.commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        
        // End encoding, present the drawable view, and commit the buffer
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
