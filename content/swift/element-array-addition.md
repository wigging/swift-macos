---
title: Element-wise array addition
date: January 16, 2023
---

There are several ways to perform element-wise array addition with Swift arrays. One approach is to use a for-loop, another approach is to use the Accelerate framework, and yet another approach is to use a Metal GPU compute kernel. An example of each approach is given below and an elapsed time comparison for adding two large arrays is given in the Summary section.

## Using Swift

Adding elements of two arrays using pure Swift is demonstrated below using a for-loop. This can be slow for large arrays.

```swift
let x: [Float] = [3, 4.5, 8]
let y: [Float] = [2, 1.2, 7.4]

var z = [Float](repeating: 0, count: x.count)

for i in 0..<x.count {
    z[i] = x[i] + y[i]
}

// This gives the following
// z is [5.0, 5.7, 15.4]
```

This function prints out the elapsed time of this approach and the first three results.

```swift
import Foundation

func addSwift(_ arr1: [Float], _ arr2: [Float]) {

    let tic = CFAbsoluteTimeGetCurrent()

    // Add two arrays and store results
    let count = arr1.count
    var result = [Float](repeating: 0.0, count: count)

    for i in 0..<count {
        result[i] = arr1[i] + arr2[i]
    }

    // Print out the elapsed time
    let toc = CFAbsoluteTimeGetCurrent()
    print("\nSwift elapsed time is \(toc - tic) s")

    // Print out some results
    for i in 0..<3 {
        let a1 = String(format: "%.4f", arr1[i])
        let a2 = String(format: "%.4f", arr2[i])
        let y = String(format: "%.4f", result[i])
        print("\(a1) + \(a2) = \(y)")
    }
}
```

## Using Accelerate

Element-wise array addition can be accomplished with the Accelerate vDSP.add function as shown below. This approach offers massive speed improvements for large arrays compared to adding the elements in a for-loop.

```swift
import Accelerate

let x: [Float] = [3, 4.5, 8]
let y: [Float] = [2, 1.2, 7.4]
let z = vDSP.add(x, y)

// where z is [5.0, 5.7, 15.4]
```

The Accelerate framework provides the vDSP.add function to add elements of two arrays. This approach provides a significant speed boost for adding large arrays.

```swift
import Accelerate

func addAccel(_ arr1: [Float], _ arr2: [Float]) {

    let tic = CFAbsoluteTimeGetCurrent()

    // Add two arrays and store results
    let y = vDSP.add(arr1, arr2)

    // Print out elapsed time
    let toc = CFAbsoluteTimeGetCurrent()
    print("\nAccelerate vDSP elapsed time is \(toc - tic) s")

    // Print out some results
    for i in 0..<3 {
        let a1 = String(format: "%.4f", arr1[i])
        let a2 = String(format: "%.4f", arr2[i])
        let y = String(format: "%.4f", y[i])
        print("\(a1) + \(a2) = \(y)")
    }
}
```

## Using Metal

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

``` { .swift .pre1000 }
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

The main Swift file for running this Metal example is shown below.

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

## Comparison

The main file for running the above examples is shown below. The table gives elapsed times from running the example code on a MacBook Pro with a 2.6 GHz 6-core Intel i7 CPU, 32 GB of RAM, and a 4 GB AMD Radeon Pro 5500m GPU. Before running the Xcode project, the GPU Frame Capture and API Validation were disabled for Metal. Based on the results, the Accelerate function is the fastest and the Swift for-loop is the slowest when adding two arrays with 5,000,000 elements.

```swift
import Foundation

// Size of each array
private let n = 5_000_000

// Create two random arrays of size n
private let array1 = (1...n).map{ _ in Float.random(in: 1...10) }
private let array2 = (1...n).map{ _ in Float.random(in: 1...10) }

// Add two arrays using Swift
addSwift(array1, array2)

// Add two arrays using Accelerate vDSP
addAccel(array1, array2)

// Add two arrays using Metal on the GPU
addMetal(array1, array2)
```

<table class="table table-dark table-hover">
    <thead>
        <tr>
            <th scope="col">Method</th>
            <th scope="col">Elapsed time (s)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Swift</td>
            <td>3.3896</td>
        </tr>
        <tr>
            <td>Accelerate</td>
            <td>0.006299</td>
        </tr>
        <tr>
            <td>Metal</td>
            <td>0.01030</td>
        </tr>
    </tbody>
</table>
