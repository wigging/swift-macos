/*
Compile    -->  swiftc -Ounchecked wyrand.swift
Run        -->  ./wyrand
Benchmark  -->  hyperfine --warmup 3 './wyrand'

Based on reference:
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
*/

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
    // --- Check ---
    // var rng = WyRand(seed: 3)
    // print(rng.next())
    // print(rng.next())

    // --- Check ---
    // let n = 5
    // var rng = WyRand()

    // let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
    //     for i in 0..<n {
    //         buffer[i] = Double.random(in: 0..<1, using: &rng)
    //     }
    //     initCount = n
    // }

    // print(result)

    // --- Benchmark ---
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
