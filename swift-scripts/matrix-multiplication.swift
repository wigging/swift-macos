// Compile and run with
// swiftc -framework CoreGraphics -Ounchecked metal-multiplication.swift
// ./metal-multiplication

import MetalPerformanceShaders

// Arrays that represent 2D matrices, rows and columns are defined for each array
// Note that if matrix A is m x n then matrix B must be n x p thus matrix C is m x p

let a: [Float] = [5, 2, 3,
                  4, 5, 6,
                  7, 8, 9]

let b: [Float] = [1, 2, 3, 4,
                  4, 5, 6, 7,
                  1, 3, 2, 1]

let rowsA = 3
let columnsA = 3

let rowsB = columnsA
let columnsB = 4

let rowsC = rowsA
let columnsC = columnsB

// Setup the Metal matrices

guard let device = MTLCreateSystemDefaultDevice() else {
    fatalError("Failed to get GPU (Metal device)")
}

let rowBytesA = columnsA * MemoryLayout<Float>.stride
let rowBytesB = columnsB * MemoryLayout<Float>.stride
let rowBytesC = columnsC * MemoryLayout<Float>.stride

let bufferA = device.makeBuffer(bytes: a, length: rowsA * rowBytesA, options: .storageModeShared)!
let bufferB = device.makeBuffer(bytes: b, length: rowsB * rowBytesB, options: .storageModeShared)!
let bufferC = device.makeBuffer(length: rowsC * rowBytesC, options: .storageModeShared)!

let descA = MPSMatrixDescriptor(dimensions: rowsA, columns: columnsA, rowBytes: rowBytesA, dataType: .float32)
let descB = MPSMatrixDescriptor(dimensions: rowsB, columns: columnsB, rowBytes: rowBytesB, dataType: .float32)
let descC = MPSMatrixDescriptor(dimensions: rowsC, columns: columnsC, rowBytes: rowBytesC, dataType: .float32)

let matrixA = MPSMatrix(buffer: bufferA, descriptor: descA)
let matrixB = MPSMatrix(buffer: bufferB, descriptor: descB)
let matrixC = MPSMatrix(buffer: bufferC, descriptor: descC)

// Perform matrix multiplication using Metal

let commandBuffer = device.makeCommandQueue()!.makeCommandBuffer()!

let mul = MPSMatrixMultiplication(device: device, resultRows: rowsC, resultColumns: columnsC, interiorColumns: columnsA)
mul.encode(commandBuffer: commandBuffer, leftMatrix: matrixA, rightMatrix: matrixB, resultMatrix: matrixC)

commandBuffer.commit()
commandBuffer.waitUntilCompleted()

// Print result

let rawPointer = matrixC.data.contents()
let floatPointer = rawPointer.bindMemory(to: Float.self, capacity: rowsC * columnsC)
let bufferPointer = UnsafeBufferPointer(start: floatPointer, count: rowsC * columnsC)
let arrayC = Array(bufferPointer)

for i in 0..<matrixC.rows {
    for j in 0..<matrixC.columns {
        print(arrayC[i * matrixC.columns + j], terminator: "  ")
    }
    print("")
}
