---
title: Element-wise array addition
date: November 11, 2022
---

Element-wise array addition can be accomplished with the Accelerate vDSP.add function as shown below. This approach offers massive speed improvements for large arrays compared to adding the elements in a for-loop.

```swift
import Accelerate

let x: [Float] = [3, 4.5, 8]
let y: [Float] = [2, 1.2, 7.4]
let z = vDSP.add(x, y)

// where z is [5.0, 5.7, 15.4]
```
