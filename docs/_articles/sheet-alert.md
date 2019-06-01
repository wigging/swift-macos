---
title: Sheet Alert
date: 2019-06-01
---

# Sheet Alert

Alerts in macOS applications are created with the NSAlert class as a modal window or as a sheet displayed within a window. This article discusses a sheet alert which is displayed inside a window. Unlike the modal alert, which is displayed in a separate window. See the image shown below for a simple sheet alert along with its associated code.

<img src="assets/alert-sheet-1.png" class="img-small">

```swift
let alert = NSAlert()
alert.messageText = "Simple Alert"
alert.informativeText = "Informative text goes here."
alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
```

As with the model alert, features such as a custom icon, more buttons, and accessory views such as a text field can be added to the sheet. A completion handler provides responses to identify button clicks within the sheet. The image and code below demonstrate a more involved sheet alert.

<img src="assets/alert-sheet-2.png" class="img-small">

```swift
let alert = NSAlert()
alert.addButton(withTitle: "OK")
alert.addButton(withTitle: "Cancel")
alert.alertStyle = .informational
alert.icon = NSImage(named: "bell")
alert.informativeText = "Some informative text goes here."
alert.messageText = "The Sheet Alert"
alert.showsSuppressionButton = true

let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 25))
alert.accessoryView = textField

alert.beginSheetModal(for: self.view.window!) { response in
    if response == .alertFirstButtonReturn {
        print("first button selected: OK")
    } else if response == .alertSecondButtonReturn {
        print("second button selected: Cancel")
    }
}
```

## Source code

Example code for this article is available in the alert-sheet repository on [GitHub][]. Comments and other feedback can be submitted on the [Issues][] page.

[GitHub]: https://github.com/wigging/swift-macos
[Issues]: https://github.com/wigging/swift-macos/issues
