//
//  WebView.swift
//  WebViewLoadString
//
//  Created by Gavin Wiggins on 5/16/21.
//

import SwiftUI
import WebKit

// Don't forget to enable "Outgoing Connections" in the target's "App Sandbox".
// Otherwise the website will not display in the app.

struct WebView: NSViewRepresentable {
    
    let content: String

    func makeNSView(context: Context) -> WKWebView {
        
        let webview = WKWebView()
        webview.loadHTMLString(self.content, baseURL: nil)
        return webview
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) { }
}
