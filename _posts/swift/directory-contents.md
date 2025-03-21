---
title: Directory contents
date: April 18, 2023
---

This example uses the `FileManager` class to list the contents of a folder (directory) located on the Desktop. The printed output from running this example as `main.swift` is also given below.

``` { .swift .pre1000 }
import Foundation

let desktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
let fm = FileManager.default

do {
    let items = try fm.contentsOfDirectory(atPath: desktopPath + "/myfolder")

    for item in items {
        print(item)
    }
} catch {
    print("Directory not found.")
}
```

```text
$ cd ~/Desktop/myfolder
$ swift main.swift

logo-121023.png
fruit-logo.jpg
README.md
orange-icon.jpg
main.swift
```

The second example shown below lists only the JPG and PNG image files in the directory.

``` { .swift .pre1000 }
import Foundation

let desktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
let fm = FileManager.default

do {
    let items = try fm.contentsOfDirectory(atPath: desktopPath + "/myfolder")

    for item in items {
        if item.hasSuffix(".jpg") || item.hasSuffix(".png") {
            print("\(item) is JPG or PNG image")
        }
    }
} catch {
    print("Directory not found.")
}
```

```text
$ cd ~/Desktop/myfolder
$ swift main.swift

logo-121023.png is JPG or PNG image
fruit-logo.jpg is JPG or PNG image
orange-icon.jpg is JPG or PNG image
```

And yet another approach is to use `filter` to list only the JPG image files.

``` { .swift .pre1000 }
import Foundation

let desktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
let fm = FileManager.default

do {
    let items = try fm.contentsOfDirectory(atPath: desktopPath + "/myfolder")
    let jpgItems = items.filter { $0.hasSuffix(".jpg") }
    for item in jpgItems {
        print("\(item) is JPG image")
    }
} catch {
    print("Directory not found.")
}
```

```text
$ cd ~/Desktop/myfolder
$ swift main.swift

fruit-logo.jpg is JPG image
orange-icon.jpg is JPG image
```
