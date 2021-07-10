---
---

## WebView

A `WKWebView` from the WebKit framework is used to display web content in a window. The web view can be wrapped with `NSViewRepresentable` to make it usable with SwiftUI. Content for the web view can be loaded from an HTML file, from a string containing HTML, or from a URL representing a website address. Don't forget to enable "Outgoing Connections" in the target's "App Sandbox"; otherwise, the website will not display in the app.

## Load an HTML file

```html
<!-- page.html -->

<html>
<head>
<meta charset="utf-8">
<style>
    :root { color-scheme: light dark; }
</style>
</head>
<body>
    <h1>Hello again friend 😁</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Done.</p>
</body>
</html>
```

```swift
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {

    let htmlFile: String

    func makeNSView(context: Context) -> WKWebView {

        guard let url = Bundle.main.url(forResource: self.htmlFile, withExtension: "html") else {
            return WKWebView()
        }

        let webview = WKWebView()
        webview.loadFileURL(url, allowingReadAccessTo: url)

        return webview
    }

    func updateNSView(_ nsView: WKWebView, context: Context) { }
}
```

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(htmlFile: "page")
            .padding()
            .frame(width: 480, height: 600)
    }
}
```

## Load a string containing HTML

```swift
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {

    let content: String

    func makeNSView(context: Context) -> WKWebView {

        let webview = WKWebView()
        webview.loadHTMLString(self.content, baseURL: nil)
        return webview
    }

    func updateNSView(_ nsView: WKWebView, context: Context) { }
}
```

```swift
import SwiftUI

let htmlContent = """
<html>
<head>
<style>
    :root { color-scheme: light dark; }
</style>
</head>
<body>
    <h1>Hello friend!</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Done.</p>
</body>
</html>
"""

struct ContentView: View {
    var body: some View {
        WebView(content: htmlContent)
            .padding()
            .frame(width: 480, height: 600)
    }
}
```

## Load from a URL

```swift
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {

    let url: String

    func makeNSView(context: Context) -> WKWebView {

        guard let url = URL(string: self.url) else {
            return WKWebView()
        }

        let webview = WKWebView()
        let request = URLRequest(url: url)
        webview.load(request)

        return webview
    }

    func updateNSView(_ nsView: WKWebView, context: Context) { }
}
```

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: "https://www.apple.com")
            .padding()
            .frame(width: 480, height: 600)
    }
}
```
