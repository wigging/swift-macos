+++
title = "Strings"
date = 2022-11-12
+++

A string in Swift is represented by characters wrapped with double quotation marks `" "`. Multiline strings are wrapped with three double quotation marks `""" """`. Use a backslash `\` to ignore a line break in a multiline string.

```swift
// A string literal

let a = "This is a string"

// Multiline string

let multi = """
This is an example
of a multiline
string
"""
// Prints the following:
// This is an example
// of a multiline
// string


// Multiline string with indentation

let indented = """
The next line
  is indented from the left.
"""
// Prints the following:
// The next line
//   is indented from the left.

// Ignore line breaks in a multiline string

let ignored = """
This is the first line \
which doesn't break.
And this is the second line.
"""
// Prints the following:
// This is the first line which doesn't break.
// And this is the second line.
```
