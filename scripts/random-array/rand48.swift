/*
Compile    -->  swiftc -Ounchecked rand48.swift
Run        -->  ./rand48
Benchmark  -->  hyperfine --warmup 3 './rand48'
*/

import Accelerate


func main() {
    // --- Check ---
    // let n = 5

    // let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
    //     for i in 0..<n {
    //         buffer[i] = drand48()
    //     }
    //     initCount = n
    // }

    // print(result)

    // --- Benchmark ---
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
