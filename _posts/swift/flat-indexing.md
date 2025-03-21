---
title: Flat indexing an N-dimensional array
date: August 7, 2024
example: swift-macos/swift-scripts/flat-indexing.swift
---

An N-dimensional or multi-dimensional array is a data structure with one or more dimensions. An index for each dimension must be provided to access a particular element's value. Since the array's data is stored in one-dimensional memory, the indices must be converted to a flat index (one-dimension) to access the corresponding memory location.

The following function calculates the flat index of an element in an N-dimensional array. It is applicable for row-major order and zero-based indexing. The `indices` input parameter is the index for each dimension and the `shape` input parameter is the size of the corresponding dimensions. For example, a 2D array may have `indices: [1, 3]` which is the element in the second row and fourth column. Also, a 2D array with `shape: [4, 8]` describes the array as having four rows and eight columns.

```swift
func flatIndex(indices: [Int], shape: [Int]) -> Int {
    var index = 0
    var stride = 1

    for i in (0..<shape.count).reversed() {
        index += indices[i] * stride
        stride *= shape[i]
    }

    return index
}
```

The function is based on the formula shown below where indices are \\(i_1, i_2, ..., i_N\\) and dimensions are \\(d_1, d_2, ..., d_N\\).

$$
\text{flat index} = i_1 + (i_2 \times d_1) + (i_3 \times d_1 \times d_2) + ... + (i_N \times d_1 \times d_2 \times ... \times d_{N-1})
$$

The example below calculates the flat index for a 2D array.

```swift
let a = [1, 2, 3, 4,
         5, 6, 7, 8]

let idx = flatIndex(indices: [1, 2], shape: [2, 4])

print("Flat index is \(idx) which is value \(a[idx]) in the 2D array")
// This prints:
// Flat index is 6 which is value 7 in the 2D array
```

This example calculates the flat index for a 3D array.

```swift
let a = [1, 2, 3, 4,
         5, 6, 7, 8,

         9, 10, 11, 12,
         13, 14, 15, 16]

let idx = flatIndex(indices: [1, 0, 2], shape: [2, 2, 4])

print("Flat index is \(idx) which is value \(a[idx]) in the 3D array\n")
// This prints:
// Flat index is 10 which is value 11 in the 3D array
```

This example is for a 4D array.

```swift
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

print("Flat index is \(idx) which is value \(a[idx]) in the 4D array\n")
// This prints:
// Flat index is 47 which is value 48 in the 4D array
```

The `flatIndex` function also works with a 1D array as shown here.

```swift
let a = [1, 2, 3, 4, 5]
let idx = flatIndex(indices: [1], shape: [a.count])

print("Flat index is \(idx) which is value \(a[idx]) in the 1D array\n")
// This prints:
// Flat index is 1 which is value 2 in the 1D array
```
