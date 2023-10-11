//
//  Renderer.swift
//  MetalSampler
//
//  Created by Gavin Wiggins on 10/7/23.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {

    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!

    var computePipeline: MTLComputePipelineState!
    var renderPipeline: MTLRenderPipelineState!
    var texture: MTLTexture!

    init(metalView: MTKView) {
        super.init()

        // Setup the GPU and command queue
        guard let device = MTLCreateSystemDefaultDevice(),
              let commandQueue = device.makeCommandQueue()
        else {
            fatalError("GPU not available")
        }
        Renderer.device = device
        Renderer.commandQueue = commandQueue

        // Setup compute pipeline and the draw_noise shader function
        let library = device.makeDefaultLibrary()
        let drawNoise = library?.makeFunction(name: "draw_noise")

        do {
            computePipeline = try device.makeComputePipelineState(function: drawNoise!)
        } catch let error as NSError {
            print(error)
        }
        
        // Setup render pipeline along with vertex and fragment shader functions
        let vertexFunction = library?.makeFunction(name: "fullscreen_vertex")
        let fragmentFunction = library?.makeFunction(name: "fullscreen_fragment")
        
        let renderDescriptor = MTLRenderPipelineDescriptor()
        renderDescriptor.vertexFunction = vertexFunction
        renderDescriptor.fragmentFunction = fragmentFunction
        renderDescriptor.colorAttachments[0].pixelFormat = metalView.colorPixelFormat
        renderDescriptor.depthAttachmentPixelFormat = metalView.depthStencilPixelFormat
        
        do {
            renderPipeline = try device.makeRenderPipelineState(descriptor: renderDescriptor)
        } catch {
            fatalError("Could not create render pipeline state: \(error)")
        }

        // Setup the Metal view
        metalView.device = device
        metalView.clearColor = MTLClearColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        metalView.framebufferOnly = false
        metalView.delegate = self

        // Setup the texture
        let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(
            pixelFormat: metalView.colorPixelFormat,
            width: 400,
            height: 400,
            mipmapped: false)
        textureDescriptor.usage = [.shaderRead, .shaderWrite]
        texture = device.makeTexture(descriptor: textureDescriptor)
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else { return }

        // Command buffer
        let commandBuffer = Renderer.commandQueue.makeCommandBuffer()

        // Compute encoder and threads
        let computeEncoder = commandBuffer?.makeComputeCommandEncoder()
        computeEncoder?.setComputePipelineState(computePipeline)
        computeEncoder?.setTexture(texture, index: 0)

        let w = computePipeline.threadExecutionWidth
        let h = computePipeline.maxTotalThreadsPerThreadgroup / w
        let threadsPerThreadGroup = MTLSize(width: w, height: h, depth: 1)
        let threadsPerGrid = MTLSize(width: texture.width, height: texture.height, depth: 1)
        
        computeEncoder?.dispatchThreads(threadsPerGrid, threadsPerThreadgroup: threadsPerThreadGroup)
        computeEncoder?.endEncoding()

        // Render encoder
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: view.currentRenderPassDescriptor!)
        renderEncoder?.setRenderPipelineState(renderPipeline)
        renderEncoder?.setFragmentTexture(texture, index: 0)
        renderEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        renderEncoder?.endEncoding()

        // Commit the buffer
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
