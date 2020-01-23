//
//  WebView.swift
//  webview-load-string
//
//  Created by Gavin Wiggins on 1/22/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI
import WebKit

/**
 A view representing a WKWebView for displaying HTML content.
 - Parameter content: HTML content to display in the view.
 - Note: Don't forget to enable "Outgoing Connections" in the target's "App Sandbox". Otherwise the website will not display in the app.
*/

struct WebView: NSViewRepresentable {
    
    let content: String

    func makeNSView(context: Context) -> WKWebView {
        
        let webview = WKWebView()
        webview.loadHTMLString(self.content, baseURL: nil)
        return webview
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) { }
    
}
