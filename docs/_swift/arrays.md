---
title: Arrays
---

An array in Swift is an ordered collection of values. It is written as `Array<Element>` or in a shorthand form using square brackets `[Element]` where element is the type of values stored in the array.

```swift
// Create an immutable array

let x = Array([4, 5, 6, 7, 8])

// Create an immutable array using the shorthand form

let y = [3, 4, 5, 6, 7]

// Get the number of items (or length) of an array

let a = [5, 0.2, 7, 8, 9.4, 10, 11]
a.count     // returns 7

// Get the first and third items in the array

a[0]    // returns 5
a[2]    // returns 7

// Create an empty array and append integers

var b: [Int] = []
b.append(2)
b.append(5)
print(b)
// prints [2, 5]
```

First and last properties access an array's first and last items otherwise the properties are `nil` for an empty array.

```swift
// First and last items of an array

let x = [4, 5, 1, 9, 7]

if let firstItem = x.first {
    print("x first item is \(firstItem)")
}
// x first item is 4

if let lastItem = x.last {
    print("x last item is \(lastItem)")
}
// x last item is 7
```

The `for-in` loop will iterate over all the values in an array. To get the index associated with each value use the `enumerated()` method.

```swift
// Iterate through items in an array

let names = ["Homer", "Bart", "Marge", "Crusty", "Lisa"]

for n in names {
    print(n)
}
// Homer
// Bart
// Marge
// Crusty
// Lisa

for (i, n) in names.enumerated() {
    print("index \(i), name \(n)")
}
// index 0, name Homer
// index 1, name Bart
// index 2, name Marge
// index 3, name Crusty
// index 4, name Lisa
```
