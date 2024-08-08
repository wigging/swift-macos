/*
Flat index of N-dimensional array.
*/

/// Calculate the flat index of an element in an N-dimensional array.
///
/// The indices for each dimension are `indices = i1, i2, ... iN`.
/// The dimensions for each index are `shape = d1, d2, ... dN`.
/// The `flat index = i1 + i2 * d1 + i3 * d1 * d2 + ... + iN * d1 * d2 * ... * dN-1`.
///
/// - Parameters:
///   - indices: Indices of the element for each dimension.
///   - shape: Dimensions of the array.
/// - Returns: Index of the element corresponding to one-dimension.
func flatIndex(indices: [Int], shape: [Int]) -> Int {
    var index = 0
    var stride = 1
    
    for i in (0..<shape.count).reversed() {
        index += indices[i] * stride
        stride *= shape[i]
    }

    return index
}

/*
 Example using 1D array.
 */

func run1D() {
    let a = [1, 2, 3, 4, 5]
    let idx = flatIndex(indices: [1], shape: [a.count])

    print("Example 1D")
    print("1D index is [1]")
    print("Flat index is \(idx) which is value \(a[idx]) in the 1D array\n")
}

run1D()

/*
 Example using 2D array.
 */

func run2D() {
    let a = [1, 2, 3, 4,
             5, 6, 7, 8]

    let idx = flatIndex(indices: [1, 2], shape: [2, 4])

    print("Example 2D")
    print("2D indices are [1, 2]")
    print("Flat index is \(idx) which is value \(a[idx]) in the 2D array\n")
}

run2D()

/*
 Example using 3D array.
 */

func run3D() {
    let a = [1, 2, 3, 4,
             5, 6, 7, 8,

             9, 10, 11, 12,
             13, 14, 15, 16]

    let idx = flatIndex(indices: [1, 0, 2], shape: [2, 2, 4])

    print("Example 3D")
    print("3D indices are [1, 0, 2]")
    print("Flat index is \(idx) which is value \(a[idx]) in the 3D array\n")
}

run3D()

/*
 Example using 4D array.
 */

func run4D() {
    let a = [1, 2, 3, 4,
             5, 6, 7, 8,

             9, 10, 11, 12,
             13, 14, 15, 16,

             17, 18, 19, 20,
             21, 22, 23, 24,


             25, 26, 27, 28,
             29, 30, 31, 32,

             33, 34, 35, 36,
             37, 38, 39, 40,

             41, 42, 43, 44,
             45, 46, 47, 48]

    let idx = flatIndex(indices: [1, 2, 1, 3], shape: [2, 3, 2, 4])

    print("Example 4D")
    print("4D indices are [1, 2, 1, 3]")
    print("Flat index is \(idx) which is value \(a[idx]) in the 4D array\n")
}

run4D()
