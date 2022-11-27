---
title: Element-wise array addition
date: November 27, 2022
---

Use a for-loop to add elements in arrays.

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
