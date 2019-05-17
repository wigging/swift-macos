---
title: Strings
date: 2019-05-12
---

# Strings

`String`

A string in Swift is a series of characters surrounded by quotation marks such as "hello" or "awesome". See the code snippets below for examples of working with the String type in Swift.

```swift
// Initialize an empty string
// -------------------------------------------------------

var empty = ""
var initString = String()

// String literal
// -------------------------------------------------------

let theString = "some string"

// Multiline string as two lines
// -------------------------------------------------------

let multiString = """
line one here
next line here
"""

// Multiline text as one line
// -------------------------------------------------------

let multiOneString = """
line one here \
but this line also first line
"""

// Append to a string
// -------------------------------------------------------

var animals = "horse, dog"
animals += ", cat, gorilla"

// Combine two strings
// -------------------------------------------------------

let first = "Harry"
let last = "Anderson"
let fullName = first + " " + last

// Interpolated string
// -------------------------------------------------------

let number = 3.7
let answer = "the answer is \(number)"

// Compare two strings
// -------------------------------------------------------

let stringA = "apple"
let stringB = "apple"
let stringC = "google"

if stringA == stringB {
    print("yes")
}

if stringA == stringC {
    print("yes")
} else {
    print("no")
}

// Count characters in a string
// -------------------------------------------------------

let company = "Apple Computer"
company.count

// Convert a string to int, float, or double
// Note that these return an optional
// -------------------------------------------------------

let intString = "37"
let intNumber = Int(intString)

let floatString = "94.3"
let floatNumber = Float(floatString)

let doubleString = "78.12"
let doubleNumber = Double(doubleString)

let notDoubleString = "apple"
let notDoubleNumber = Double(notDoubleString)
```

## Source Code

The **strings.playground** on [GitHub][] provides executable code of the examples shown above. Comments and other feedback can be submitted on the [Issues][] page.

[GitHub]: https://github.com/wigging/swift-macos
[Issues]: https://github.com/wigging/swift-macos/issues  
