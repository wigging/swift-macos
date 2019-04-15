// Empty string and initialize a string
// -------------------------------------------------------

var empty = ""
var initString = String()

// String literal
// -------------------------------------------------------

let theString = "some string"

// Modify a string
// -------------------------------------------------------

var animals = "horse, dog"
animals += ", cat, gorilla"

// Add strings together
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
// note that these return an optional
// -------------------------------------------------------

let intString = "37"
let intNumber = Int(intString)

let floatString = "94.3"
let floatNumber = Float(floatString)

let doubleString = "78.12"
let doubleNumber = Double(doubleString)

let notDoubleString = "apple"
let notDoubleNumber = Double(notDoubleString)
