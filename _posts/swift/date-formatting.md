---
title: Date formatting
date: November 12, 2022
---

Examples of creating a formatted date string are shown below. The output of each print function is given as a comment below the function.

```swift
import Foundation

// Create a date variable for the current date and time
let date = Date()

// Example 1

let d1 = date.formatted()
print(d1)
// 7/12/2022, 9:18 PM

// Example 2

let d2 = date.formatted(date: .abbreviated, time: .shortened)
print(d2)
// Jul 12, 2022, 9:18 PM

// Example 3

let d3 = date.formatted(date: .numeric, time: .omitted)
print(d3)
// 7/12/2022

// Example 4

let d4 = date.formatted(
    .dateTime
    .day(.twoDigits)
    .weekday(.short)
    .month(.abbreviated))

print(d4)
// Tu, Jul 12
```
