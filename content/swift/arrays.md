---
title: Arrays
date: July 14, 2023
---

An array in Swift is an ordered collection of values. It is written as `Array<Element>` or in a shorthand form using square brackets `[Element]` where element is the type of values stored in the array.

## Immutable array

Below is a basic example of creating an immutable array, getting values from that array, and getting the number of items in the array. Notice that the first item in the array is at index 0.

```swift
let a = Array([4, 5, 8, 6, 10, 12, 17])

print("a is \(a)")
print("a[0] is \(a[0])")
print("a[2] is \(a[2])")
print("a.count is \(a.count)")
// a is [4, 5, 8, 6, 10, 12, 17]
// a[0] is 4
// a[2] is 8
// a.count is 7
```

## Mutable array

Here is a basic example of a creating a mutable array and changing the first item in the array.

```swift
var b = [4, 5, 6, 7, 8]
b[0] = 99

print("b is \(b)")
// b is [99, 5, 6, 7, 8]
```

## Empty array

This example creates an empty array and appends integer values to the array.

```swift
var c: [Int] = []
c.append(2)
c.append(10)
c.append(19)

print("c is \(c)")
// c is [2, 10, 19]
```

## Random array

There are several approaches to creating an array of random numbers in Swift. This example creates an array filled with zeros, then assigns a random number to each element in the array. Notice the random number is within a range of values which is from 0 to 1 in this example.

```swift
var x = [Float](repeating: 0, count: 5)

for i in 0..<x.count {
    x[i] = .random(in: 0...1)
}

// x is [0.8209822, 0.85707325, 0.10973239, 0.119954765, 0.19724935]
```

Another approach is to map a random number to each array element as shown in the following example. The size of the array is determined by the range that is mapped.

```swift
let x = (0..<5).map { _ in Float.random(in: 0...1) }

// x is [0.4514997, 0.41597754, 0.04589182, 0.07227373, 0.9754954]

let z = (1...6).map { _ in Float.random(in: 1...10) }

// z is [2.7215362, 3.2972493, 2.9972453, 7.1019344, 8.892759, 3.715058]
```

However, the fastest approach for very large arrays is to use functions from the Accelerate framework. In this example, arc4random is used to assign random integers to the array. The integers are converted to Double then multiplied by a scaling factor such that the range of values are from 0 to 1.

```swift
import Accelerate

let n = 5
var x = [UInt32](repeating: 0, count: n)
arc4random_buf(&x, n * MemoryLayout<UInt32>.size)

var y = vDSP.integerToFloatingPoint(x, floatingPointType: Double.self)
cblas_dscal(Int32(n), 1 / Double(UInt32.max), &y, 1)

// y is [0.8341360464305934, 0.24041946028369002, 0.04481290514692965, 0.6746670607651274, 0.7728101240407699]
```

And yet another approach is to use the vDSP multiply function as shown below.

```swift
import Accelerate

let n = 5
var x = [UInt32](repeating: 0, count: n)
arc4random_buf(&x, n * MemoryLayout<UInt32>.size)

let y = vDSP.integerToFloatingPoint(x, floatingPointType: Double.self)
let c = 1 / Double(UInt32.max)
let z = vDSP.multiply(c, y)

// z is [0.7841595014986023, 0.12211232844789334, 0.6589130530271011, 0.4871890585606892, 0.2029429211288092]
```

The table below compares the approaches discussed above for creating a large array that contains 1,000,000 random numbers where each random number has a value from 0 to 1. The elapsed time in seconds to create the array is given in the second column. Notice how the Accelerate examples are about 30x faster than the Swift for-loop and map examples.

<table class="table table-dark table-hover">
    <thead>
        <tr>
            <th scope="col">Random array example</th>
            <th scope="col">Elapsed time (s)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Swift for-loop</td>
            <td>1.1609</td>
        </tr>
        <tr>
            <td>Swift map</td>
            <td>1.0556</td>
        </tr>
        <tr>
            <td>Accelerate BLAS Double</td>
            <td>0.0364</td>
        </tr>
        <tr>
            <td>Accelerate BLAS Float</td>
            <td>0.0374</td>
        </tr>
        <tr>
            <td>Accelerate vDSP Double</td>
            <td>0.0396</td>
        </tr>
        <tr>
            <td>Accelerate vDSP Float</td>
            <td>0.0345</td>
        </tr>
    </tbody>
</table>

## Range array

A range of numbers can be used to create an array as shown below.

```swift
let zz = Array(1...10)

print("zz is \(zz)")
// zz is [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

## First and last items

Get the first and last items of an array as shown here.

```swift
let x = [4, 5, 1, 9, 7]

if let firstItem = x.first {
    print("x.first item is \(firstItem)")
}
// x.first item is 4

if let lastItem = x.last {
    print("x.last item is \(lastItem)")
}
// x.last item is 7
```

## Iteration

The for-in loop will iterate over all the items in an array. To get the index associated with each value use the `enumerated()` method.

```swift
let names = ["Homer", "Bart", "Marge", "Crusty", "Lisa"]

for n in names {
    print("name is \(n)")
}
// name is Homer
// name is Bart
// name is Marge
// name is Crusty
// name is Lisa

for (i, n) in names.enumerated() {
    print("index \(i), name \(n)")
}
// index 0, name Homer
// index 1, name Bart
// index 2, name Marge
// index 3, name Crusty
// index 4, name Lisa
```

## Structs array

Create an array of structs where properties of the structs are mapped to array values.

```swift
let xpts: [Float] = [1, 2, 3, 4, 5, 6]
let ypts: [Float] = [3, 4.5, 8, 7, 10, 2.2]

struct Point {
    let x: Float
    let y: Float
}

let points = zip(xpts, ypts).map { Point(x: $0, y: $1) }

for pt in points {
    print("x is \(pt.x), y is \(pt.y)")
}
// x is 1.0, y is 3.0
// x is 2.0, y is 4.5
// x is 3.0, y is 8.0
// x is 4.0, y is 7.0
// x is 5.0, y is 10.0
// x is 6.0, y is 2.2
```
