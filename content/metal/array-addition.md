---
title: Element-wise array addition
date: November 12, 2022
---

There are several ways to perform element-wise array addition with Swift arrays. One approach is to use a for-loop, the other approach is to use the Accelerate framework or a Metal GPU compute kernel. The Metal approach is shown here.

The Metal compute kernal for adding the elements of two arrays is given below.

```cpp
#include <metal_stdlib>
using namespace metal;

kernel void adder(
                  constant float *array1 [[ buffer(0) ]],
                  constant float *array2 [[ buffer(1) ]],
                  device float *result [[ buffer(2) ]],
                  uint index [[ thread_position_in_grid ]])
{
    result[index] = array1[index] + array2[index];
}
```

Next, the adder kernel function is implemented in the Metal compute pipeline as shown below.

```{ .swift .pre1000 }
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
```

The main file for running this Metal example is shown below.

```swift
import Foundation

// Size of each array
private let n = 5_000_000

// Create two random arrays of size n
private let array1 = (1...n).map{ _ in Float.random(in: 1...10) }
private let array2 = (1...n).map{ _ in Float.random(in: 1...10) }

// Add two arrays using Metal on the GPU
addMetal(array1, array2)
```
