+++
title = "Range"
date = 2022-11-12
+++

Check if a value is within a given range using the contains method.

```swift
// This prints "yes" because x is in the given range

let x = 212.5

if (200...300).contains(x) {
    print("yes")
} else {
    print("nope")
}

// This prints "nope" because y is not in the range

let y = 105

if (200...300).contains(y) {
    print("yes")
} else {
    print("nope")
}
```

This can also be accomplished with the `~=` operator.

```swift
if 200...300 ~= y {
    print("yes")
} else {
    print("nope")
}
```
