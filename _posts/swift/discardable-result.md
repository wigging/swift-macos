---
title: Discardable result
date: October 7, 2024
---

Functions marked with `@discardableResult` allow you to ignore the return value.

For example, the log function shown below prints a log message and also returns a string. You must assign the result to an underscore if you don't want to use the returned string value.

```swift
func log(_ message: String) -> String {
    let logInfo = "[INFO] \(message)"
    print(logInfo)
    return logInfo
}

let _ = log("Hello there")
```

Alternatively, you can mark the log function with `@discardableResult` to ignore the returned string as shown below. This doesn't require the use of an underscore to ignore the returned value; however, the returned value can still be captured.

```swift
@discardableResult
func log(_ message: String) -> String {
    let logInfo = "[INFO] \(message)"
    print(logInfo)
    return logInfo
}

// Ignore the returned string value
log("Hello there")

// Use the returned string to print another log message
let s = log("Hello there again")
print("Log message is: \(s)")
```
