/*
Compile    -->  swiftc -Ounchecked wyuniform.swift
Run        -->  ./wyuniform
Benchmark  -->  hyperfine --warmup 3 './wyuniform'

Convert UInt64 to Double in range [0, 1) including 0 but excluding 1
This is done by UInt64 / (UInt64.max + 1)
UInt64.max is 18446744073709551615 so adding 1 is 18446744073709551616
This 18446744073709551616 is 2^64 as Double
Reciprocal 1 / 2^64 is 5.421010862427522e-20

References:
https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/
https://github.com/wangyi-fudan/wyhash
*/

import Foundation

struct WyRand: RandomNumberGenerator {
    private var state : UInt64

    init(seed: UInt64? = nil) {
        state = seed ?? mach_absolute_time()
    }

    mutating func next() -> UInt64 {
        state &+= 0x2d358dccaa6c78a5
        let mul = state.multipliedFullWidth(by: state ^ 0x8bb84b93962eacc9)
        return mul.low ^ mul.high
    }
}

// Convert 64-bit pseudo random numbers to uniform distribution [0, 1)
// This is Swift version of wy2u01 function from wyhash repo
func wy2u01(_ r: UInt64) -> Double {
    let norm = 1.0 / Double(1 << 52)
    return Double(r >> 12) * norm
}

func main() {
    // --- Check ---
    // let n = 5
    // var rng = WyRand()

    // let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
    //     for i in 0..<n {
    //         let r = rng.next()
    //         let uniform = wy2u01(r)
    //         buffer[i] = uniform
    //     }
    //     initCount = n
    // }

    // print(result)

    // --- Benchmark ---
    let n = 100_000_000
    var rng = WyRand()

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            let r = rng.next()
            let uniform = wy2u01(r)
            // let uniform = Double(r >> 11) * 0x1.0p-53
            buffer[i] = uniform
        }
        initCount = n
    }

    print(result[0])
    print(result[n - 1])
}

main()
