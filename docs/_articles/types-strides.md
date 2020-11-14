---
title: Strides
date: 2020-08-18
---

Use stride to step over values between two limits or boundaries. The stride functions can also be used to build Arrays with a certain range of numbers.

## Example 1

Step from start to end and exclude end value.

```swift
for s in stride(from: 0, to: 10, by: 2) {
    print("s = \(s)")
}
```

## Example 2

Step from start to end and include end value.

```swift
for t in stride(from: 0, through: 10, by: 2) {
    print("t = \(t)")
}
```

## Example 3

Create an array from a stride sequence.

```swift
let y = Array(stride(from: 0, to: 10, by: 2))
```

## Example 4

Create an array with specified number of steps using values from another array.

```swift
let a = [3.4, 5, 2, 8.14, 10, 12]
let min = a.min() ?? 0.0
let max = a.max() ?? 1.0

let nSteps = 4.0
let step = (max - min) / nSteps

let z = Array(stride(from: min, through: max, by: step))
```

## Further reading

See Apple's documentation for more information about the [stride(from:to:by:)](https://developer.apple.com/documentation/swift/1641347-stride) and [stride(from:through:by:)](https://developer.apple.com/documentation/swift/1641185-stride) functions.
