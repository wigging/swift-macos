//
//  adderAccel.swift
//  ArrayAddition
//
//  Created by Gavin Wiggins on 4/18/22.
//

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
