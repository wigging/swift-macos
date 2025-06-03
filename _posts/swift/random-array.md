---
title: Array of Random Numbers in Swift
date: May 29, 2025
---

Swift does not provide a feature to directly create an array of random numbers. Such an array must be built by generating a random number and assigning that number to an array element. The following sections demonstrate several methods to generate random numbers in Swift. Each method is benchmarked by filling a large array with random numbers.

## Swift random

Swift provides a static random method for different types such as `Double.random`. This uses the system's default random number generator which is cryptographically secure whenever possible. The code below uses `Double.random` to fill an array of 100,000,000 elements with random numbers that range from 0 to 1 (excluding 1).

```swift
// rand.swift

func main() {
    let n = 100_000_000

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = Double.random(in: 0..<1)
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

main()
```

## Accelerate drand48

The Accelerate framework provides a `drand48` function that returns a random double-precision value over a uniform distribution [0, 1). This function generates pseudo-random numbers using a linear congruential algorithm with 48-bit integer arithmetic. The code below is similar to the previous example except `drand48` generates the random numbers for the array elements.

```swift
// rand48.swift

import Accelerate

func main() {
    let n = 100_000_000

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = drand48()
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

main()
```

## LAPACK dlarnv

The Accelerate framework also provides access to LAPACK routines. The [LAPACK dlarnv](https://netlib.org/lapack/explore-html/d5/dd2/group__larnv_ga768743496c909a18850020a8ce0382b4.html) function creates an array of random numbers from a 0 to 1 uniform distribution when `idist` is 1.

```swift
// lapack.swift

import Accelerate

func main() {
    let n = 100_000_000

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        var idist: Int32 = 1
        var nn = Int32(n)

        var iseed: [Int32] = (0..<3).map { _ in Int32.random(in: 1..<4095) }
        iseed += [2 * (Int32.random(in: 1..<4095) / 2) + 1 ]

        dlarnv_(&idist, &iseed, &nn, buffer.baseAddress)

        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

main()
```

## WyRand random

The static random methods like `Double.random` accept a [RandomNumberGenerator](https://developer.apple.com/documentation/swift/randomnumbergenerator). The example below is a Swift implementation of the wyrand pseudorandom number generator which is associated with the [wyhash](https://github.com/wangyi-fudan/wyhash) function by Wang Yi. The generator is passed to the `Double.random` method to create the random number for the array element. There is also the [SwiftWyhash](https://github.com/lemire/SwiftWyhash) port by Daniel Lemire that is based on an older version of wyrand. Also see Daniel's 2019 [article](https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/) about fast random number generators.

```swift
// wyrand.swift

import Foundation

struct WyRand: RandomNumberGenerator {
    private var state : UInt64

    init(seed: UInt64 = mach_absolute_time()) {
        state = seed
    }

    mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }
}

func main() {
    let n = 100_000_000
    var rng = WyRand()

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = Double.random(in: 0..<1, using: &rng)
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

main()
```

## WyRand uniform

This example is similar to the WyRand code given above except `Double.random` is not used. Instead of passing the generator to `Double.random`, the integer returned from the generator is converted to a uniform distribution [0, 1) using the `wy2u01` function. The function shown here is based on the `wy2u01` C function given in the wyhash repo.

```swift
// wyuniform.swift

import Foundation

struct WyRand: RandomNumberGenerator {
    private var state : UInt64

    init(seed: UInt64 = mach_absolute_time()) {
        state = seed
    }

    mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }
}

func wy2u01(_ r: UInt64) -> Double {
    let norm = 1.0 / Double(1 << 52)
    return Double(r >> 12) * norm
}

func main() {
    let n = 100_000_000
    var rng = WyRand()

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            let r = rng.next()
            let uniform = wy2u01(r)
            buffer[i] = uniform
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

main()
```

## Benchmarks

The compiler and benchmark commands for each example are shown below. The [hyperfine](https://github.com/sharkdp/hyperfine) command-line tool is used to benchmark the compiled code.

```bash
# Compile the code
swiftc -Xcc -DACCELERATE_NEW_LAPACK -Ounchecked lapack.swift
swiftc -Ounchecked rand.swift
swiftc -Ounchecked rand48.swift
swiftc -Ounchecked wyrand.swift
swiftc -Ounchecked wyuniform.swift

# Run then benchmark
hyperfine --warmup 3 './lapack' './rand' './rand48' './wyrand' './wyuniform'
```

A summary of the benchmark results is shown in the table below. The Time column is the mean time in milliseconds. The Speedup column is how much faster WyRand uniform is compared to the other methods. The results were obtained on a 2025 M4 MacBook Air with 32 GB of unified memory and with Swift version 6.1.2. The WyRand uniform generator was 50x faster than the default random number generator in Swift when filling an array with 100,000,000 random numbers.

<table class="table table-dark table-hover">
<thead>
    <tr>
        <th scope="col">Method</th>
        <th scope="col">Filename</th>
        <th scope="col">Time (ms)</th>
        <th scope="col">Speedup</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>Swift random</td>
        <td>rand.swift</td>
        <td>3318</td>
        <td>50.5x</td>
    </tr>
    <tr>
        <td>LAPACK dlarnv</td>
        <td>lapack.swift</td>
        <td>407</td>
        <td>6.2x</td>
    </tr>
    <tr>
        <td>Accelerate drand48</td>
        <td>rand48.swift</td>
        <td>185</td>
        <td>2.8x</td>
    </tr>
    <tr>
        <td>WyRand random</td>
        <td>wyrand.swift</td>
        <td>81</td>
        <td>1.2x</td>
    </tr>
    <tr>
        <td>WyRand uniform</td>
        <td>wyuniform.swift</td>
        <td>65</td>
        <td>-</td>
    </tr>
</tbody>
</table>

Based on the benchmarks, using Swift's default random number generator is very slow compared to pseudorandom number generators such as wyrand. If you don't need cryptographically secure random numbers then consider using a custom random number generator for faster performance; especially when filling arrays with pseudorandom numbers.

This post is based on a [Swift Forums](https://forums.swift.org/t/creating-an-array-of-random-numbers-in-swift-is-slow/80022) discussion. Thank you to everyone on the forum post who offered advice and comments on this topic.