---
title: Reverse array elements using Accelerate
date: November 11, 2022
---

Reverse the order of elements in an array using the vDSP.reverse function. Values in the array must be Float or Double.

```swift
import Accelerate

var x: [Float] = [8, 7, 6, 5, 4, 3, 2, 1, 0]
vDSP.reverse(&x)

// x becomes [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
```
