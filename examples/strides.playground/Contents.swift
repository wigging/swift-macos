import Cocoa

// Use stride to step over values between two limits or boundaries.

// --- Example 1 ---
// Step from start to end. Excludes end value.

for s in stride(from: 0, to: 10, by: 2) {
    print("s = \(s)")
}

// --- Example 2 ---
// Step from start to end. Includes end value.

for t in stride(from: 0, through: 10, by: 2) {
    print("t = \(t)")
}

// --- Example 3 ---
// Create an array from a stride sequence.

let y = Array(stride(from: 0, to: 10, by: 2))
print("y = \(y)")
print("y[2] = \(y[2])")

// --- Example 4 ---
// Create an array with specified number of steps using values from another array.

let a = [3.4, 5, 2, 8.14, 10, 12]
let min = a.min() ?? 0.0
let max = a.max() ?? 1.0

let nSteps = 4.0
let step = (max - min) / nSteps

let z = Array(stride(from: min, through: max, by: step))

print("nSteps = \(nSteps)")
print("z = \(z)")
