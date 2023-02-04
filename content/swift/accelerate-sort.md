---
title: Sort array values
date: November 11, 2022
---

Sort the values in an array by ascending or descending order. Values of the array must be Float or Double.

```swift
import Accelerate

var y: [Float] = [8, 3.5, 0, 7, 9, 2, 6, 1]
vDSP.sort(&y, sortOrder: .ascending)

// y becomes [0.0, 1.0, 2.0, 3.5, 6.0, 7.0, 8.0, 9.0]

vDSP.sort(&y, sortOrder: .descending)

// y becomes [9.0, 8.0, 7.0, 6.0, 3.5, 2.0, 1.0, 0.0]
```
