---
title: Suppress Print Output in Swift
date: April 29, 2025
---

Suppressing print output is useful for functions that accept a block of code as input. An example
would be a benchmark function that accepts a block of code for profiling. The code may contain
print statements that would print to the screen during each benchmark iteration. By suppressing the
print output, the benchmark does not pollute the screen with unnecessary output.

The Foundation framework provides access to C functions such as `dup`, `dup2`, and `fflush` that can
be used to suppress print output in Swift. In the example below, the `suppressPrint` function
accepts a block of code as a closure and uses the C functions to redirect the print output to
`/dev/null`. Running the example will only print `Hello Marge` to the screen.

```swift
import Foundation

func suppressPrint(_ block: () -> ()) {
    let originalStdout = dup(fileno(stdout)) // Save original stdout
    let devNull = fopen("/dev/null", "w")    // Open /dev/null
    dup2(fileno(devNull), fileno(stdout))    // Redirect stdout to /dev/null

    block()

    fflush(stdout)                           // Flush output buffer
    dup2(originalStdout, fileno(stdout))     // Restore stdout
    close(originalStdout)                    // Close duplicate file descriptor
    fclose(devNull)                          // Close file stream
}

func sayHello(to: String) {
    print("Hello", to)
}

func main() {
    suppressPrint {
        sayHello(to: "Homer")
    }

    sayHello(to: "Marge")
}

main()
```

In the next example, the System framework provides a `FileDescriptor` struct that replaces the use
of `dup`, `fopen`, `dup2`, and `fclose`. This provides a more Swift-like solution; but, there
doesn't appear to be a Swift interface for `fflush` so Foundation is still needed.

```swift
import Foundation
import System

func suppressPrint(_ block: () -> Void) {
    do {
        let stdoutFD = try FileDescriptor.standardOutput.duplicate()
        let nullFD = try FileDescriptor.open("/dev/null", .writeOnly)
        _ = try nullFD.duplicate(as: .standardOutput)

        block()

        fflush(stdout)
        _ = try stdoutFD.duplicate(as: .standardOutput)
        try stdoutFD.close()
        try nullFD.close()
    } catch {
        print("Suppression failed:", error)
    }
}

func sayHello(to: String) {
    print("Hello", to)
}

func main() {
    suppressPrint {
        sayHello(to: "Homer")
        print("Done")
    }

    sayHello(to: "Marge")
}

main()
```

See the [System framework documentation](https://developer.apple.com/documentation/system) for more
information about the file descriptor and other low-level file operations in Swift.
