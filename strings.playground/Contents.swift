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
