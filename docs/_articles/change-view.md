---
title: Change View in a Window
date: 2019-04-12
---

# Change View in a Window

`NSViewController`, `xib`

Subviews can be added to a custom view to display contents from other view controllers inside a window. In this example, a subview is a xib file which acts as the view of an NSViewController object.

To get started, drag a Custom View to the window from the object library in Interface Builder. Don't forget to set the size and layout contraints of the view.

<img src="assets/change-view-1.png" class="img-small">

Next, create a view by adding a new file and selecting View in the User Interface section. This view appears in the Xcode project as a XIB file. After adding the view, create a view controller by adding a new Cocoa Class file to the project; it is a subclass of NSViewController.

<img src="assets/change-view-2.png" class="img-small">
<img src="assets/change-view-3.png" class="img-small">

Back in Interface Builder, select the File's Owner for the XIB and add the view controller as the Custom Class object. In the Connections Inspector for the File's Owner, make sure the view of the XIB is connected to the view controller along with other connections such as outlets and actions.

<img src="assets/change-view-4.png" class="img-small">
<img src="assets/change-view-5.png" class="img-small">

```swift
// ViewControllerA.swift

import Cocoa

class ViewControllerA: NSViewController {
    
    @IBOutlet weak var textField: NSTextField!

    @IBAction func showText(_ sender: NSTextField) {
        let x = sender.stringValue
        textField.stringValue = x
    }
    
}
```

Finally, in the main view controller (shown below) create properties to each subview view controller. The nibName is the name of the XIB file that represents the view associated with the view controller. Create an outlet to the custom view which contains the subviews. For this particular example, a button action adds the view to the custom view.

```swift
// ViewController.swift

import Cocoa

class ViewController: NSViewController {
    
    let vcA = ViewControllerA(nibName: "ViewA", bundle: nil)
    let vcB = ViewControllerB(nibName: "ViewB", bundle: nil)

    @IBOutlet weak var CustomView: NSView!
    
    @IBAction func showViewA(_ sender: NSButton) {
        CustomView.subviews.removeAll()
        CustomView.addSubview(vcA.view)
    }
    
    @IBAction func showViewB(_ sender: NSButton) {
        CustomView.subviews.removeAll()
        CustomView.addSubview(vcB.view)
    }
    
}
```

<img src="assets/change-view-6.png" class="img-small">

## Source code

Example code for this article is available in the **change-view** repository on [GitHub][]. Comments and other feedback can be submitted on the [Issues][] page.

[GitHub]: https://github.com/wigging/swift-macos
[Issues]: https://github.com/wigging/swift-macos/issues