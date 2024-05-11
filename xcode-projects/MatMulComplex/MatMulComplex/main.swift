//
//  main.swift
//  MatMulComplex
//
//  Created by Gavin Wiggins on 5/11/24.
//

import Accelerate

struct Complex {
    let real: Float
    let imag: Float
}

// Example using new BLAS and LAPACK interfece
// Requires ACCELERATE_NEW_LAPACK=1 and ACCELERATE_LAPACK_ILP64=1
// Add these to Project > Build Settings > Apple Clang Preprocessing > Preprocessor Macros > Debug and Release

func runNewLapack() {
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

    print(y)

    for val in y {
        if val.imag.sign == .plus {
            print("\(val.real) + \(val.imag)i")
        } else {
            print("\(val.real) - \(-val.imag)i")
        }
    }
}

runNewLapack()

// Example using new BLAS and LAPACK interface with a function wrapper
// This is based on a suggestion from the Swift Forums
// https://forums.swift.org/t/opaquepointer-errors-with-complex-functions-in-accelerate/71628/4

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

func runNewLapack2() {
    let a = [Complex(real: -1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0),
             Complex(real: -5.0, imag: 6.0), Complex(real: 7.0, imag: -8.0)]

    let x = [Complex(real: -1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0)]

    let m = 2                                    // rows in matrix A
    let n = 2                                    // columns in matrix A
    let alpha = [Complex(real: 1.0, imag: 0.0)]  // scale factor for αAX
    let beta = [Complex(real: 1.0, imag: 0.0)]   // scale factor for βY

    let y = [Complex](repeating: Complex(real: 0.0, imag: 0.0), count: m)

    cblas_cgemv_wrapper(CblasRowMajor, CblasNoTrans, m, n, alpha, a, m, x, 1, beta, y, 1)

    print(y)

    for val in y {
        if val.imag.sign == .plus {
            print("\(val.real) + \(val.imag)i")
        } else {
            print("\(val.real) - \(-val.imag)i")
        }
    }
}

runNewLapack2()

// Example using old BLAS and LAPACK interface
// This does not use ACCELERATE_NEW_LAPACK=1 and ACCELERATE_LAPACK_ILP64=1

//func runOldLapack() {
//    let a = [Complex(real: 1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0),
//             Complex(real: 5.0, imag: 6.0), Complex(real: 7.0, imag: 8.0)]
//
//    let x = [Complex(real: 1.0, imag: 2.0), Complex(real: 3.0, imag: 4.0)]
//
//    let m: Int32 = 2                             // rows in matrix A
//    let n: Int32 = 2                             // columns in matrix A
//    let alpha = [Complex(real: 1.0, imag: 0.0)]  // scale factor for αAX
//    let beta = [Complex(real: 1.0, imag: 0.0)]   // scale factor for βY
//
//    var y = [Complex](repeating: Complex(real: 0.0, imag: 0.0), count: Int(m))
//
//    // calculate Y ← αAX + βY
//    cblas_cgemv(CblasRowMajor, CblasNoTrans, m, n, alpha, a, m, x, 1, beta, &y, 1)
//
//    print(y)
//}
//
//runOldLapack()
