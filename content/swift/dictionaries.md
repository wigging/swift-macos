+++
title = "Dictionaries"
date = 2022-11-12
+++

A dictionary in Swift is a list of key-value pairs separated by colons and surrounded by square brackets such as `[key: value]`. Values returned from a dictionary are optional because the key may not exist in the dictionary.

```swift
// A dictionary literal

let d = ["one": 1, "two": 2, "three": 3]

// An empty dictionary

var e: [String: Int] = [:]

// Get a value from a dictionary

var fruits = ["apples": 1, "oranges": 3]
print(fruits["oranges"])
// Prints an optional 3

// Add an item to a dictionary

fruits["berries": 8]
print(fruits)
// Prints a dictionary containing ["apples": 1, "oranges": 3, "berries": 8]
```
