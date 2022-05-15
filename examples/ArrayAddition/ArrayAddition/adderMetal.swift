//
//  adderMetal.swift
//  ArrayAddition
//
//  Created by Gavin Wiggins on 4/18/22.
//

import MetalKit

private func setupMetal(arr1: [Float], arr2: [Float]) -> (MTLCommandBuffer?, MTLBuffer?) {
    
    // Get the Metal GPU device
    let device = MTLCreateSystemDefaultDevice()
    
    // Queue for sending commands to the GPU
    let commandQueue = device?.makeCommandQueue()
    
    // Get our Metal GPU function
    let gpuFunctionLibrary = device?.makeDefaultLibrary()
    let adderGpuFunction = gpuFunctionLibrary?.makeFunction(name: "adder")
    
    var pipelineState: MTLComputePipelineState!
    do {
        pipelineState = try device?.makeComputePipelineState(function: adderGpuFunction!)
    } catch {
      print(error)
    }
    
    // Create the buffers to be sent to the GPU from our arrays
    let count = arr1.count

    let arr1Buff = device?.makeBuffer(bytes: arr1,
                                      length: MemoryLayout<Float>.size * count,
                                      options: .storageModeShared)
    
    let arr2Buff = device?.makeBuffer(bytes: arr2,
                                      length: MemoryLayout<Float>.size * count,
                                      options: .storageModeShared)

    let resultBuff = device?.makeBuffer(length: MemoryLayout<Float>.size * count,
                                        options: .storageModeShared)
    
    // Create a buffer to be sent to the command queue
    let commandBuffer = commandQueue?.makeCommandBuffer()
    
    // Create an encoder to set values on the compute function
    let commandEncoder = commandBuffer?.makeComputeCommandEncoder()
    commandEncoder?.setComputePipelineState(pipelineState)
    
    // Set the parameters of our GPU function
    commandEncoder?.setBuffer(arr1Buff, offset: 0, index: 0)
    commandEncoder?.setBuffer(arr2Buff, offset: 0, index: 1)
    commandEncoder?.setBuffer(resultBuff, offset: 0, index: 2)
    
    // Figure out how many threads we need to use for our operation
    let threadsPerGrid = MTLSize(width: count, height: 1, depth: 1)
    let maxThreadsPerThreadgroup = pipelineState.maxTotalThreadsPerThreadgroup
    let threadsPerThreadgroup = MTLSize(width: maxThreadsPerThreadgroup, height: 1, depth: 1)
    commandEncoder?.dispatchThreads(threadsPerGrid, threadsPerThreadgroup: threadsPerThreadgroup)
    
    // Tell the encoder that it is done encoding. Now we can send this off to the GPU.
    commandEncoder?.endEncoding()
    
    return (commandBuffer, resultBuff)
}

func addMetal(_ arr1: [Float], _ arr2: [Float]) {
    
    let (commandBuffer, resultBuff) = setupMetal(arr1: arr1, arr2: arr2)
    let tic = CFAbsoluteTimeGetCurrent()

    // Push this command to the command queue for processing
    commandBuffer?.commit()
    
    // Wait until the GPU function completes before working with any of the data
    commandBuffer?.waitUntilCompleted()
    
    // Get the pointer to the beginning of our data
    let count = arr1.count
    var resultBufferPointer = resultBuff?.contents().bindMemory(to: Float.self, capacity: count)
    
    // Print out elapsed time
    let toc = CFAbsoluteTimeGetCurrent()
    print("\nMetal GPU elapsed time is \(toc - tic) s")
    
    // Print out the results
    for i in 0..<3 {
        let a1 = String(format: "%.4f", arr1[i])
        let a2 = String(format: "%.4f", arr2[i])
        let y = String(format: "%.4f", Float(resultBufferPointer!.pointee))
        print("\(a1) + \(a2) = \(y)")
        resultBufferPointer = resultBufferPointer?.advanced(by: 1)
    }
}
