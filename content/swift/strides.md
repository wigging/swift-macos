---
title: Strides
date: November 12, 2022
---

Use the stride function to step over values between two limits or boundaries. The stride functions can also be used to build arrays with a certain range of numbers.

```swift
// Step from start to end and exclude end value

for s in stride(from: 0, to: 10, by: 2) {
    print("s is \(s)")
}
// s is 0
// s is 2
// s is 4
// s is 6
// s is 8

// Step from start to end and include end value

for t in stride(from: 0, through: 10, by: 2) {
    print("t is \(t)")
}
// t is 0
// t is 2
// t is 4
// t is 6
// t is 8
// t is 10
```

```swift
// Create an array from a stride sequence

let w = Array(stride(from: 0, to: 10, by: 2))
print("w is \(w)")
// w is [0, 2, 4, 6, 8]

let y = Array(stride(from: 0, through: 10, by: 2))
print("y is \(y)")
// y is [0, 2, 4, 6, 8, 10]
```

```swift
// Create an array with specified number of steps using values from another array

let a = [3.4, 5, 2, 8.14, 10, 12]
let min = a.min() ?? 0.0
let max = a.max() ?? 1.0

let nSteps = 4.0
let step = (max - min) / nSteps

let z = Array(stride(from: min, through: max, by: step))
print("z is \(z)")
// z is [2.0, 4.5, 7.0, 9.5, 12.0]
```
