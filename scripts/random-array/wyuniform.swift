/*
Compile    -->  swiftc -Ounchecked wyuniform.swift
Run        -->  ./wyuniform
Benchmark  -->  hyperfine --warmup 3 './wyuniform'

If `x` is UInt64, use `(x >> 11) * 0x1.0p-53` to convert `x` to Double in range [0, 1)
which includes 0 but excludes 1. This is a uniform distribution over [0, 1).

References:
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
https://github.com/wangyi-fudan/wyhash
https://prng.di.unimi.it
https://forums.swift.org/t/creating-an-array-of-random-numbers-in-swift-is-slow/80022
*/

import Foundation

struct Wyrand: RandomNumberGenerator {
    private var state : UInt64

    init(seed: UInt64? = nil) {
        state = seed ?? mach_absolute_time()
    }

    mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }

    mutating func nextUniform() -> Double {
        Double(next() >> 11) * 0x1.0p-53
    }
}

func runCheck() {
    let n = 5
    var rng = Wyrand()

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = rng.nextUniform()
        }
        initCount = n
    }

    print(result)
}

func runBenchmark() {
    let n = 100_000_000
    var rng = Wyrand()

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = rng.nextUniform()
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

// runCheck()
runBenchmark()
