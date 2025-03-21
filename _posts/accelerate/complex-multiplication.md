---
title: Complex multiplication
date: May 11, 2024
example: swift-macos/xcode-projects/MatMulComplex
---

Use the `cblas_cgemv` function in Accelerate to multiply a matrix and vector with single-precision complex values. For this example, a structure named `Complex` with `real` and `imag` properties is utilized but `DSPComplex` can also be used.

```swift
import Accelerate

struct Complex {
    let real: Float
    let imag: Float
}

let a = [Complex(real: -1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0),
         Complex(real: -5.0, imag: 6.0), Complex(real: 7.0, imag: -8.0)]

let x = [Complex(real: -1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0)]

let m = 2                                    // rows in matrix A
let n = 2                                    // columns in matrix A
let alpha = [Complex(real: 1.0, imag: 0.0)]  // scale factor α for αAX
let beta = [Complex(real: 1.0, imag: 0.0)]   // scale factor β for βY

var y = [Complex](repeating: Complex(real: 0.0, imag: 0.0), count: m)

// calculate Y ← αAX + βY
alpha.withUnsafeBufferPointer { alphaPtr in
    a.withUnsafeBufferPointer { aPtr in
        x.withUnsafeBufferPointer { xPtr in
            beta.withUnsafeBufferPointer { betaPtr in
                y.withUnsafeMutableBufferPointer { yPtr in
                    cblas_cgemv(
                        CblasRowMajor,                        // matrix layout
                        CblasNoTrans,                         // transpose for matrix A
                        m,                                    // number of rows in matrix A
                        n,                                    // number of columns in matrix A
                        OpaquePointer(alphaPtr.baseAddress!), // scale factor α for αAX
                        OpaquePointer(aPtr.baseAddress!),     // matrix A
                        m,                                    // size of first dimension of matrix A
                        OpaquePointer(xPtr.baseAddress!),     // vector X
                        1,                                    // stride for vector X
                        OpaquePointer(betaPtr.baseAddress!),  // scale factor β for βY
                        OpaquePointer(yPtr.baseAddress!),     // vector Y
                        1                                     // stride for vector Y
                    )
                }
            }
        }
    }
}

for val in y {
    if val.imag.sign == .plus {
        print("\(val.real) + \(val.imag)i")
    } else {
        print("\(val.real) - \(-val.imag)i")
    }
}
```

Before running this code in an Xcode project, add `ACCELERATE_NEW_LAPACK=1` and `ACCELERATE_LAPACK_ILP64=1` as preprocessor macros. Add the macros to the Debug and Release fields at Project > Build Settings > Apple Clang Preprocessing > Preprocessor Macros > Debug and Release. This will enable the new BLAS and LAPACK interfaces for Accelerate. Running the example should print the output shown below.

```text
-10.0 + 20.0i
46.0 - 12.0i
```

To avoid the pyramid of doom with unsafe pointers, a wrapper function for `cblas_cgemv` can be used to convert the inputs to the appropriate types as demonstrated here. This will calculate the same result as the previous example.

```swift
import Accelerate

struct Complex {
    let real: Float
    let imag: Float
}

func cblas_cgemv_wrapper(
    _ order: CBLAS_ORDER,
    _ transpose: CBLAS_TRANSPOSE,
    _ m: Int,
    _ n: Int,
    _ alpha: UnsafeRawPointer,
    _ a: UnsafeRawPointer,
    _ lda: Int,
    _ x: UnsafeRawPointer,
    _ incX: Int,
    _ beta: UnsafeRawPointer,
    _ y: UnsafeRawPointer,
    _ incY: Int
) {
    cblas_cgemv(order, transpose, m, n, .init(alpha), .init(a), lda, .init(x), incX, .init(beta), .init(y), incY)
}

let a = [Complex(real: -1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0),
         Complex(real: -5.0, imag: 6.0), Complex(real: 7.0, imag: -8.0)]

let x = [Complex(real: -1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0)]

let m = 2                                    // rows in matrix A
let n = 2                                    // columns in matrix A
let alpha = [Complex(real: 1.0, imag: 0.0)]  // scale factor for αAX
let beta = [Complex(real: 1.0, imag: 0.0)]   // scale factor for βY

let y = [Complex](repeating: Complex(real: 0.0, imag: 0.0), count: m)

cblas_cgemv_wrapper(CblasRowMajor, CblasNoTrans, m, n, alpha, a, m, x, 1, beta, y, 1)

for val in y {
    if val.imag.sign == .plus {
        print("\(val.real) + \(val.imag)i")
    } else {
        print("\(val.real) - \(-val.imag)i")
    }
}
```
