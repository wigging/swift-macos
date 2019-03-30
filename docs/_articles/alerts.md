---
title: Alerts
date: 2019-03-21
---

# Alerts

Alerts in macOS applications are created with the `NSAlert` object as a modal window or as a sheet displayed within a window. Use the `beginSheetModal()` function to display an alert sheet or use the `runModal()` function to display a modal alert window.

## Modal window alert

A modal alert appears in front of the main window and becomes the active window; thus, disabling the main window but keeping it visible. An example of a simple modal alert along with its associated code is given below.

<img src="assets/alert-modal-1.png" class="img-fluid" style="max-width: 400px">

```swift
let alert = NSAlert()
alert.addButton(withTitle: "OK")
alert.alertStyle = .critical
alert.informativeText = "Some text goes on this line."
alert.messageText = "The Modal Alert"
alert.runModal()
```

Features such as a custom icon, buttons, and text fields can be added to the alert window. Responses are available to identify which button was clicked.

<img src="assets/alert-modal-2.png" class="img-fluid" style="max-width: 400px">

```swift
let alert = NSAlert()
alert.addButton(withTitle: "OK")
alert.addButton(withTitle: "Cancel")
alert.alertStyle = .informational
alert.icon = NSImage(named: "bell")
alert.informativeText = "Some text goes on this line.\nNext line goes here."
alert.messageText = "The Modal Alert"
alert.showsSuppressionButton = true

let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 25))
alert.accessoryView = textField

let response = alert.runModal()
if response == .alertFirstButtonReturn {
    print("first button selected: OK")
    print("text is: \(textField.stringValue)")
} else if response == .alertSecondButtonReturn {
    print("second button selected: Cancel")
    print("text is: \(textField.stringValue)")
}
```

## Sheet alert

Here.

Example code for this article is available in the **alert-modal** and **alert-sheet** repositories on [GitHub][]. Comments and other feedback can be submitted on the [Issues][] page.

[GitHub]: https://github.com/wigging/swift-macos
[Issues]: https://github.com/wigging/swift-macos/issues
