---
title: Array
date: 2020-11-15
---

An array in Swift is an ordered collection of values. It is written as `Array<Element>` or in a shorthand form using square brackets `[Element]` where element is the type of values stored in the array.

```swift
// create an immutable array
let x = Array([4, 5, 6, 7, 8])

// create an immutable array using the shorthand form
let y = [3, 4, 5, 6, 7]
```

The `for-in` loop will iterate over all the values in an array. To get the index associated with each value use the `enumerated()` method.

```swift
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