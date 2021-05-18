//
//  WebView.swift
//  WebViewLoadHtml
//
//  Created by Gavin Wiggins on 5/16/21.
//

import SwiftUI
import WebKit

// Don't forget to enable "Outgoing Connections" in the target's "App Sandbox".
// Otherwise the website will not display in the app.

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
