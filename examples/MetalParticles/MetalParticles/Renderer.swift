//
//  Renderer.swift
//  MetalParticles
//
//  Created by Gavin Wiggins on 5/20/22.
//

import MetalKit

struct Particle {
    var color: SIMD4<Float>
    var position: SIMD2<Float>
    var velocity: SIMD2<Float>
}

class Renderer: NSObject {
    
    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!
    
    var clearState: MTLComputePipelineState!
    var drawState: MTLComputePipelineState!
    
    var particleBuffer: MTLBuffer!
    var particleCount: Int = 5000
    
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
        let clearFunc = library?.makeFunction(name: "clearScreen")
        let drawFunc = library?.makeFunction(name: "drawParticles")
        
        do {
            clearState = try device.makeComputePipelineState(function: clearFunc!)
            drawState = try device.makeComputePipelineState(function: drawFunc!)
        } catch let error as NSError {
            print(error)
        }
        
        metalView.device = device
        metalView.framebufferOnly = false
        metalView.delegate = self
        
        initializeBuffers()
    }
    
    func initializeBuffers() {
        
        let side = 800
        var particles: [Particle] = []
        
        for _ in 0..<particleCount {
            
            let red = Float.random(in: 0...1)
            let green = Float.random(in: 0...1)
            let blue = Float.random(in: 0...1)
            
            let x = Float(arc4random() %  UInt32(side))
            let y = Float(arc4random() %  UInt32(side))

            let vx = (Float(arc4random() %  10) - 5) / 2
            let vy = (Float(arc4random() %  10) - 5) / 2
            
            let particle = Particle(
                color: SIMD4<Float>(red, green, blue, 1),
                position: SIMD2<Float>(x, y),
                velocity: SIMD2<Float>(vx, vy))
            particles.append(particle)
        }

        let size = MemoryLayout<Particle>.stride * particleCount
        particleBuffer = Renderer.device.makeBuffer(bytes: particles, length: size)
    }
}

extension Renderer: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else { return }
        
        let commandbuffer = Renderer.commandQueue.makeCommandBuffer()
        let commandEncoder = commandbuffer?.makeComputeCommandEncoder()
        
        commandEncoder?.setComputePipelineState(clearState)
        commandEncoder?.setTexture(drawable.texture, index: 0)
        
        let w = clearState.threadExecutionWidth
        let h = clearState.maxTotalThreadsPerThreadgroup / w
        
        var threadsPerThreadGroup = MTLSize(width: w, height: h, depth: 1)
        var threadsPerGrid = MTLSize(width: drawable.texture.width, height: drawable.texture.height, depth: 1)
        commandEncoder?.dispatchThreads(threadsPerGrid, threadsPerThreadgroup: threadsPerThreadGroup)
        
        commandEncoder?.setComputePipelineState(drawState)
        commandEncoder?.setBuffer(particleBuffer, offset: 0, index: 0)
        threadsPerGrid = MTLSize(width: particleCount, height: 1, depth: 1)
        threadsPerThreadGroup = MTLSize(width: w, height: 1, depth: 1)
        commandEncoder?.dispatchThreads(threadsPerGrid, threadsPerThreadgroup: threadsPerThreadGroup)
        
        commandEncoder?.endEncoding()
        commandbuffer?.present(drawable)
        commandbuffer?.commit()
    }
}
