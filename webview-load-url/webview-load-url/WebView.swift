//
//  WebView.swift
//  webview-load-url
//
//  Created by Gavin Wiggins on 1/22/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI
import WebKit

/**
 A view representing a WKWebView for displaying a webpage.
 - Parameter url: Address of the website that will be displayed in the view.
 - Note: Don't forget to enable "Outgoing Connections" in the target's "App Sandbox". Otherwise the website will not display in the app.
*/

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
