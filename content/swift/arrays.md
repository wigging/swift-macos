+++
title = "Arrays"
date = 2022-11-27
+++

An array in Swift is an ordered collection of values. It is written as `Array<Element>` or in a shorthand form using square brackets `[Element]` where element is the type of values stored in the array.

Below is a basic example of creating an immutable array, getting values from that array, and getting the number of items in the array. Notice that the first item in the array is at index 0.

```swift
let a = Array([4, 5, 8, 6, 10, 12, 17])

print("a is \(a)")
print("a[0] is \(a[0])")
print("a[2] is \(a[2])")
print("a.count is \(a.count)")

// Prints the following
// a is [4, 5, 8, 6, 10, 12, 17]
// a[0] is 4
// a[2] is 8
// a.count is 7
```

Here is a basic example of a creating a mutable array and changing the first item in the array.

```swift
var b = [4, 5, 6, 7, 8]
b[0] = 99

print("b is \(b)")

// Prints the following
// b is [99, 5, 6, 7, 8]
```

This example creates an empty array and appends integer values to the array.

```swift
var c: [Int] = []
c.append(2)
c.append(10)
c.append(19)

print("c is \(c)")

// Prints the following
// c is [2, 10, 19]
```

Creating an array filled with random numbers is shown below.

```swift
let z = (1...5).map { _ in Float.random(in: 1...10) }

print("z is \(z)")

// Prints the following
// z is [3.819302, 3.5558195, 3.3727653, 4.035131, 4.2416086]
```

A range of numbers can be used to create an array as shown below.

```swift
let zz = Array(1...10)

print("zz is \(zz)")

// Prints the following
// zz is [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Get the first and last items of an array as shown here.

```swift
let x = [4, 5, 1, 9, 7]

if let firstItem = x.first {
    print("x.first item is \(firstItem)")
}

if let lastItem = x.last {
    print("x.last item is \(lastItem)")
}

// Prints the following
// x.first item is 4
// x.last item is 7
```

The for-in loop will iterate over all the items in an array. To get the index associated with each value use the `enumerated()` method.

```swift
let names = ["Homer", "Bart", "Marge", "Crusty", "Lisa"]

for n in names {
    print("name is \(n)")
}

for (i, n) in names.enumerated() {
    print("index \(i), name \(n)")
}

// Prints the following from the first loop
// name is Homer
// name is Bart
// name is Marge
// name is Crusty
// name is Lisa

// Prints the following from the second loop
// index 0, name Homer
// index 1, name Bart
// index 2, name Marge
// index 3, name Crusty
// index 4, name Lisa
```

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

// Prints the following
// x is 1.0, y is 3.0
// x is 2.0, y is 4.5
// x is 3.0, y is 8.0
// x is 4.0, y is 7.0
// x is 5.0, y is 10.0
// x is 6.0, y is 2.2
```
