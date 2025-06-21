/*
Compile    -->  swiftc -Ounchecked wyrandom.swift
Run        -->  ./wyrandom
Benchmark  -->  hyperfine --warmup 3 './wyrandom'

Reference:
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
*/

import Foundation

struct Wyrand: RandomNumberGenerator {
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

func runCheck() {
    // var rng = Wyrand(seed: 3)
    // print(rng.next())
    // print(rng.next())

    let n = 5
    var rng = Wyrand()

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = Double.random(in: 0..<1, using: &rng)
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
            buffer[i] = Double.random(in: 0..<1, using: &rng)
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

// runCheck()
runBenchmark()
