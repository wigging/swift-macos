---
title: Elapsed time
date: November 12, 2022
---

Below are two examples of measuring elapsed time in Swift. The sleep function is used to delay the code execution for 4 seconds. Consequently, the elapsed time for both examples is approximately 4 seconds.

```swift
import Foundation

// Example 1
// ---------------------------------------------------------------------------

let tic = DispatchTime.now().uptimeNanoseconds

sleep(4)

let toc = DispatchTime.now().uptimeNanoseconds

print("Elapsed time is \((toc - tic) / 1_000_000_000) seconds")

// Example 2
// ---------------------------------------------------------------------------

let tic2 = CFAbsoluteTimeGetCurrent()

sleep(4)

let toc2 = CFAbsoluteTimeGetCurrent()

print("Elapsed time is \(toc2 - tic2) seconds")
```

Running the above examples in a file named `elapsedtime.swift` gives the following output:

```bash
$ swift elapsedtime.swift
Elapsed time is 4 seconds
Elapsed time is 4.000399947166443 seconds
```
