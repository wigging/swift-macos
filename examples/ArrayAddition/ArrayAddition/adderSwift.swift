//
//  adderSwift.swift
//  ArrayAddition
//
//  Created by Gavin Wiggins on 4/18/22.
//

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
