//
//  Data.swift
//  ImageColormap
//
//  Created by Gavin Wiggins on 7/20/23.
//

import Accelerate

enum DataType {
    case linear
    case random
    case none
}

func linearData(width: Int, height: Int) -> [Float] {
    let data = vDSP.ramp(in: Float.zero...1, count: width * height)
    return data
}

func randomData(width: Int, height: Int) -> [Float] {
    
    // Create random data
    let n = width * height
    var x = [UInt32](repeating: 0, count: n)
    arc4random_buf(&x, n * MemoryLayout<UInt32>.size)
    
    // Normalize the data to range 0 to 1 using formula
    // f = (s - s_min) / (s_max - s_min)
    let data = vDSP.integerToFloatingPoint(x, floatingPointType: Float.self)
    let max = data.max()!
    let min = data.min()!
    let u = vDSP.add(min * -1, data)
    let dataNorm = vDSP.divide(u, max - min)
    
    return dataNorm
}
