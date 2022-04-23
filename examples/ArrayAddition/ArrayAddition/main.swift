//
//  main.swift
//  ArrayAddition
//
//  Created by Gavin Wiggins on 4/18/22.
//

import Foundation

// Before running this code, disable the following in Xcode:
// Product > Scheme > Edit Scheme > Options > GPU Frame Capture > Disabled
// Product > Scheme > Edit Scheme > Diagnostics > Metal > API Validation (uncheck)

// Size of each array
private let n = 5_000_000

// Create two random arrays of size n
private var array1 = (1...n).map{ _ in Float.random(in: 1...10) }
private var array2 = (1...n).map{ _ in Float.random(in: 1...10) }

// Add two arrays using Swift
addSwift(array1, array2)

// Add two arrays using Accelerate vDSP
addAccel(array1, array2)

// Add two arrays using Metal on the GPU
addMetal(array1, array2)
