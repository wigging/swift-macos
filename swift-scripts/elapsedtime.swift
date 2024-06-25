/*
Below are two examples of measuring elapsed time in Swift. The sleep function
is used to delay the code execution for 4 seconds. Consequently, the elapsed
time for both examples is approximately 4 seconds.

Build and run this script using the following terminal commands:
swiftc elapsedtime.swift; ./elapsedtime

The print output should look similar to the following:
Elapsed time is 4 seconds
Elapsed time is 4.005115985870361 seconds
Elapsed time is 4.005129098892212 seconds
Elapsed time is 4.003226656 seconds
*/

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
