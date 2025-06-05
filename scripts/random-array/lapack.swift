/*
Compile    -->  swiftc -Xcc -DACCELERATE_NEW_LAPACK -Ounchecked lapack.swift
Run        -->  ./lapack
Benchmark  -->  hyperfine --warmup 3 './lapack'

LAPACK documentation for dlarnv
https://netlib.org/lapack/explore-html/d5/dd2/group__larnv_ga768743496c909a18850020a8ce0382b4.html
*/

import Accelerate

func main() {
    // --- Check ---
    // let n = 5

    // let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
    //     var idist: Int32 = 1
    //     var nn = Int32(n)

    //     var iseed: [Int32] = (0..<3).map { _ in Int32.random(in: 1..<4095) }
    //     iseed += [2 * (Int32.random(in: 1..<4095) / 2) + 1 ]

    //     dlarnv_(&idist, &iseed, &nn, buffer.baseAddress)
    //     initCount = n
    // }

    // print(result)

    // --- Benchmark ---
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
