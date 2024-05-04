---
title: Matrix multiplication
date: May 4, 2024
example: swift-macos/swift-scripts/matmul-accel.swift
---

Accelerate provides two functions for performing matrix multiplication. The first is the `vDSP_mmulD` function which is demonstrated below.

```swift
// Arrays represent 2D matrices, rows and columns are defined for each array
// Note that if matrix A is m x p then matrix B must be p x n thus matrix C is m x n

let a: [Double] = [5, 2, 3,
                   4, 5, 6,
                   7, 8, 9]

let b: [Double] = [1, 2, 3, 4,
                   4, 5, 6, 7,
                   1, 3, 2, 1]

let m: vDSP_Length = 3 // rows in matrices A and C
let n: vDSP_Length = 4 // columns in matrices B and C
let p: vDSP_Length = 3 // columns in matrix A, rows in matrix B
let stride: vDSP_Stride = 1

var c = [Double](repeating: 0, count: Int(m * n))
vDSP_mmulD(a, stride, b, stride, &c, stride, m, n, p)

// Print result

for i in 0..<m {
    for j in 0..<n {
        let idx = Int(i * n + j)
        print(c[idx], terminator: "  ")
    }
    print("")
}
```

Compile and run the example using the commands shown here. Notice you must compile with the new LAPACK headers to avoid deprecation warnings.

```text
swiftc -Xcc -DACCELERATE_NEW_LAPACK -Ounchecked matmul-accel.swift
./matmul-accel
```

The result is:

```text
16.0  29.0  33.0  37.0
30.0  51.0  54.0  57.0
48.0  81.0  87.0  93.0
```

Accelerate also provides the `cblas_dgemm` function for matrix multiplication which is demonstrated here. This example is compiled the same way as the previous example and provides the same result.

```swift
// Arrays represent 2D matrices, rows and columns are defined for each array
// Note that if matrix A is m x k then matrix B must be k x n thus matrix C is m x n

var a: [Double] = [5, 2, 3,
                   4, 5, 6,
                   7, 8, 9]

var b: [Double] = [1, 2, 3, 4,
                   4, 5, 6, 7,
                   1, 3, 2, 1]

let m: Int32 = 3 // rows in matrices A and C
let n: Int32 = 4 // columns in matrices B and C
let k: Int32 = 3 // columns in matrix A, rows in matrix B
let alpha = 1.0
let beta = 0.0

var c = [Double](repeating: 0, count: Int(m * n))

cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, &a, k, &b, n, beta, &c, n)

// Print result

for i in 0..<m {
    for j in 0..<n {
        let idx = Int(i * n + j)
        print(c[idx], terminator: "  ")
    }
    print("")
}
```
