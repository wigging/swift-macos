---
title: Compiler optimizations
date: February 24, 2024
---

The Swift compiler `swiftc` provides options such as `-O`, `-Osize`, and `-Ounchecked` to build code with optimizations turned on. Use optimizations such as `-Osize` to target small code size and the `-Ounchecked` to remove runtime safety checks.

The example below creates an array of size `n` that contains random numbers in the range from 1 to 10. The sum of the array is calculated then information about the result is printed to the screen.

```swift
// main.swift

let n = 2_000_000
let x = (1...n).map { _ in Float.random(in: 1...10) }
let s = x.reduce(0, +)

print("first item \(x[0])")
print("last item \(x[n-1])")
print("sum \(s)")
```

Compiling without optimizations and timing the code execution is shown below. The execution time is 1.84 seconds on a 2019 MacBook Pro with a 2.6 GHz Intel CPU and 32 GB of RAM.

```text
swiftc main.swift
time ./main
```

Compiling with optimizations and timing the code execution is shown below. The execution time is 0.26 seconds. The code executes about 7 times faster when it is compiled with optimizations.

```text
swiftc main.swift -Ounchecked -o main_opt
time ./main_opt
```
