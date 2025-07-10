---
title: Command-line arguments
date: July 9, 2025
---

Use the `CommandLine` enumeration in Swift to get command-line arguments when executing a program. The arguments are obtained as an array of strings. The example below prints all the arguments passed to the program. The name of the executed program is the first argument. The second argument is expected to be an integer `n` and the third argument is a string `t`.

```swift
// main.swift

func main() {
    let args = CommandLine.arguments

    guard let n = Int(args[1]) else { return }

    let t = args[2]

    print("all args:", args)
    print("number:", n)
    print("text:", t)
}

main()
```

The output from the example is shown below. Notice the name of the Swift file is the first argument.

```text
$ swift main.swift 12 done
all args: ["main.swift", "12", "done"]
number: 12
text: done
```