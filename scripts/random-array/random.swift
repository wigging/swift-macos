/*
Compile    -->  swiftc -Ounchecked random.swift
Run        -->  ./random
Benchmark  -->  hyperfine --warmup 3 './random'
*/

func runCheck() {
    let n = 5

    let result = Array<Double>(unsafeUninitializedCapacity: n) { buffer, initCount in
        for i in 0..<n {
            buffer[i] = Double.random(in: 0..<1)
        }
        initCount = n
    }

    print(result)
}

func runBenchmark() {
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

// runCheck()
runBenchmark()
