---
title: Alerts
date: 2019-03-21
---

# Alerts

Alerts in macOS applications are created with the `NSAlert` object as a modal window or as a sheet displayed within a window. Use the `beginSheetModal()` function to display an alert sheet or use the `runModal()` function to display an alert window.

## Modal window alert

An example of a simple model alert is shown below.

```swift
let alert = NSAlert()
alert.addButton(withTitle: "OK")
alert.alertStyle = .critical
alert.informativeText = "Some text goes on this line."
alert.messageText = "The Modal Alert"
alert.runModal()
```

A more complicated model alert is shown below.

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
