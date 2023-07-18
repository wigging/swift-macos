---
title: Normalize array values
date: July 17, 2023
example: swift-macos/xcode-playgrounds/NormalizeArray.playground
---

In this example, values in an array are normalized to be in the range 0 to 1. The normalized values are calculated using the maximum and minimum values from the original array.

```swift
import Accelerate

// Create random data

var data = [Float](repeating: 0, count: 10)

for i in 0..<data.count {
    data[i] = .random(in: 2...14)
}

print(data)

// Normalize the data to range 0 to 1 using formula
// f = (s - s_min) / (s_max - s_min)

let max = data.max()!
let min = data.min()!

let u = vDSP.add(min * -1, data)
let dataNorm = vDSP.divide(u, max - min)

print(dataNorm)
```

This prints the following for the original `data` array:

```text
[6.4362693, 4.47931, 9.550757, 7.8200455, 13.466277, 3.6958234, 8.916201, 13.379278, 13.523174, 5.611622]
```

This prints the following for the normalized `dataNorm` array:

```text
[0.27885908, 0.07972511, 0.5957795, 0.41966772, 0.9942103, 0.0, 0.531209, 0.9853576, 1.0, 0.19494557]
```
