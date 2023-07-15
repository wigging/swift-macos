//
//  main.swift
//  RandomArray
//
//  Created by Gavin Wiggins on 7/13/23.
//

import Accelerate

func runForLoop(_ n: Int) -> (xSlice: ArraySlice<Float>, et: String) {
    let tic = CFAbsoluteTimeGetCurrent()
    
    var x = [Float](repeating: 0, count: n)

    for i in 0..<x.count {
        x[i] = .random(in: 0...1)
    }

    let toc = CFAbsoluteTimeGetCurrent()
    let et = String(format: "%.4f", toc - tic)
    return (x[0..<8], et)
}

func runMap(_ n: Int) -> (xSlice: ArraySlice<Float>, et: String) {
    let tic = CFAbsoluteTimeGetCurrent()

    let x = (0..<n).map { _ in Float.random(in: 0...1) }

    let toc = CFAbsoluteTimeGetCurrent()
    let et = String(format: "%.4f", toc - tic)
    return (x[0..<8], et)
}

func runBlasDouble(_ n: Int) -> (xSlice: ArraySlice<Double>, et: String) {
    let tic = CFAbsoluteTimeGetCurrent()

    var x = [UInt32](repeating: 0, count: n)
    arc4random_buf(&x, n * MemoryLayout<UInt32>.size)
    
    var y = vDSP.integerToFloatingPoint(x, floatingPointType: Double.self)
    let c = 1 / Double(UInt32.max)
    cblas_dscal(Int32(n), c, &y, 1)

    let toc = CFAbsoluteTimeGetCurrent()
    let et = String(format: "%.4f", toc - tic)
    return (y[0..<8], et)
}

func runBlasFloat(_ n: Int) -> (xSlice: ArraySlice<Float>, et: String) {
    let tic = CFAbsoluteTimeGetCurrent()

    var x = [UInt32](repeating: 0, count: n)
    arc4random_buf(&x, n * MemoryLayout<UInt32>.size)
    
    var y = vDSP.integerToFloatingPoint(x, floatingPointType: Float.self)
    let c = 1 / Float(UInt32.max)
    cblas_sscal(Int32(n), c, &y, 1)

    let toc = CFAbsoluteTimeGetCurrent()
    let et = String(format: "%.4f", toc - tic)
    return (y[0..<8], et)
}

func runDspDouble(_ n: Int) -> (xSlice: ArraySlice<Double>, et: String) {
    let tic = CFAbsoluteTimeGetCurrent()

    var x = [UInt32](repeating: 0, count: n)
    arc4random_buf(&x, n * MemoryLayout<UInt32>.size)
    
    let y = vDSP.integerToFloatingPoint(x, floatingPointType: Double.self)
    let c = 1 / Double(UInt32.max)
    let z = vDSP.multiply(c, y)

    let toc = CFAbsoluteTimeGetCurrent()
    let et = String(format: "%.4f", toc - tic)
    return (z[0..<8], et)
}

func runDspFloat(_ n: Int) -> (xSlice: ArraySlice<Float>, et: String) {
    let tic = CFAbsoluteTimeGetCurrent()

    var x = [UInt32](repeating: 0, count: n)

    arc4random_buf(&x, n * MemoryLayout<UInt32>.size)
    let y = vDSP.integerToFloatingPoint(x, floatingPointType: Float.self)
    let c = 1 / Float(UInt32.max)
    let z = vDSP.multiply(c, y)

    let toc = CFAbsoluteTimeGetCurrent()
    let et = String(format: "%.4f", toc - tic)
    return (z[0..<8], et)
}

let n = 1_000_000

let (xForLoop, etForLoop) = runForLoop(n)
let (xMap, etMap) = runMap(n)
let (xBlasDouble, etBlasDouble) = runBlasDouble(n)
let (xBlasFloat, etBlasFloat) = runBlasFloat(n)
let (xDspDouble, etDspDouble) = runDspDouble(n)
let (xDspFloat, etDspFloat) = runDspFloat(n)

print("\n--- Slice of first items in result ---\n")
print("for-loop     \(xForLoop)")
print("map          \(xMap)")
print("blas double  \(xBlasDouble)")
print("blas float   \(xBlasFloat)")
print("dsp double   \(xDspDouble)")
print("dsp float    \(xDspFloat)")

print("\n--- Elapsed time in seconds ---\n")
print("for-loop     \(etForLoop) s")
print("map          \(etMap) s")
print("blas double  \(etBlasDouble) s")
print("blas float   \(etBlasFloat) s")
print("dsp double   \(etDspDouble) s")
print("dsp float    \(etDspFloat) s")
print("")
