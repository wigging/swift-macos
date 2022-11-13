---
title: Absolute value
date: November 11, 2022
---

Get the absolute values of a vector using the vDSP.absolute function.

```swift
import Accelerate

let x = [-3.1, -0.08, 12.1, -9, 2.4]
let y = vDSP.absolute(x)

// where y is [3.1, 0.08, 12.1, 9.0, 2.4]
```
