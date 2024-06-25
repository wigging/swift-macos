---
title: Elapsed time
date: June 24, 2024
example: swift-macos/swift-scripts/elapsedtime.swift
---

The functions shown below are examples of measuring elapsed time in Swift. The sleep function is used to delay the code execution for 4 seconds. Consequently, the elapsed time for each example is approximately 4 seconds.

```swift
import Foundation

func exampleOne() {
    let tic = DispatchTime.now().uptimeNanoseconds
    sleep(4)
    let toc = DispatchTime.now().uptimeNanoseconds

    print("Elapsed time is \((toc - tic) / 1_000_000_000) seconds")
}

func exampleTwo() {
    let tic = CFAbsoluteTimeGetCurrent()
    sleep(4)
    let toc = CFAbsoluteTimeGetCurrent()

    print("Elapsed time is \(toc - tic) seconds")
}

func exampleThree() {
    let tic = Date.now
    sleep(4)
    let toc = tic.timeIntervalSinceNow.magnitude

    print("Elapsed time is \(toc) seconds")
}

func exampleFour() {
    let clock = ContinuousClock()
    let result = clock.measure {
        sleep(4)
    }

    print("Elapsed time is \(result)")
}

exampleOne()
exampleTwo()
exampleThree()
exampleFour()
```

Running the above code in a file named `elapsedtime.swift` gives the following output:

```text
$ swiftc elapsedtime.swift; ./elapsedtime

Elapsed time is 4 seconds
Elapsed time is 4.005115985870361 seconds
Elapsed time is 4.005129098892212 seconds
Elapsed time is 4.003226656 seconds
```
