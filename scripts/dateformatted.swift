/*
Date formatting.
Examples of creating a formatted date string.
*/

import Foundation

// Create a date variable for the current date and time
let date = Date()

// Example 1

let d1 = date.formatted()
print(d1)

// Example 2

let d2 = date.formatted(date: .abbreviated, time: .shortened)
print(d2)

// Example 3

let d3 = date.formatted(date: .numeric, time: .omitted)
print(d3)

// Example 4

let d4 = date.formatted(
    .dateTime
    .day(.twoDigits)
    .weekday(.short)
    .month(.abbreviated))

print(d4)
