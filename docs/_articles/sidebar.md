---
title: Sidebar (Source List)
date: 2019-04-19
---

# Sidebar (Source List)

A sidebar (also known as a source list) occupies one side of a window and typically displays a list of items. The sidebar object is comprised of an outline view and table column. Each item can be selected to modify content in the window. To show this functionality, code is presented below for creating a sidebar that updates a label based on the selected item.

The first step is to drag a source list object into the main window. Don't forget to apply contraints on the source list so it renders properly in the window. 

<img src="assets/sidebar-1.png" class="img-small">

The column in the outline view has a default indentation value. For this example, set the value to zero so sidebar items will appear flush with the side of the view.

<img src="assets/sidebar-2.png" class="img-small">

Finally, connect the data source and delegate of the outline view to the view controller.

<img src="assets/sidebar-3.png" class="img-small">

Now it's time to write some code. In the view controller, add an array of strings and an outlet to the label in the main window. The array is used to populate the sidebar and assign text to each item.

```swift
class ViewController: NSViewController {
    
    private let names = ["Homer Simpson", "Chevy Chase", "Dan Aykroyd", "Bill Murray"]
    @IBOutlet weak var textLabel: NSTextField!
}
```

Data source methods from `NSOutlineViewDataSource` are used to retrieve data for the outline view.

```swift
extension ViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return names.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return names[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
}
```

Delegate methods from `NSOutlineViewDelegate` configure the table cells in the sidebar and handle selection events.

```swift
extension ViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        let id = NSUserInterfaceItemIdentifier(rawValue: "DataCell")
        
        guard let tableCellView = outlineView.makeView(withIdentifier: id, owner: self) as? NSTableCellView,
            let name = item as? String,
            let textField = tableCellView.textField,
            let imageView = tableCellView.imageView else {
                return nil
        }
        
        textField.stringValue = name
        imageView.image = NSImage(named: NSImage.addTemplateName)
        
        return tableCellView
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        
        guard let outlineView = notification.object as? NSOutlineView else { return }
        
        let index = outlineView.selectedRow
        
        if let item = outlineView.item(atRow: index) as? String {
            textLabel.stringValue = "Selected: \(item)"
        }
    }
}
```

The final project presents a sidebar in the window. When the user selects an item in the sidebar, the label in the main window view is updated.

<img src="assets/sidebar-4.png" class="img-small">

## Source Code

Example code for this article is available in the **sidebar** folder on [GitHub][]. Comments and other feedback can be submitted on the [Issues][] page.

[GitHub]: https://github.com/wigging/swift-macos
[Issues]: https://github.com/wigging/swift-macos/issues