//
//  WebView.swift
//  WebViewLoadUrl
//
//  Created by Gavin Wiggins on 5/16/21.
//

import SwiftUI
import WebKit

// Don't forget to enable "Outgoing Connections" in the target's "App Sandbox".
// Otherwise the website will not display in the app.

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
