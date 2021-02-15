//
//  WebView.swift
//  webview-load-file
//
//  Created by Gavin Wiggins on 1/22/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI
import WebKit

/**
 A view representing a WKWebView for displaying an HTML file.
 - Parameter file: Name of the HTML document.
 - Note: Don't forget to enable "Outgoing Connections" in the target's "App Sandbox". Otherwise the website will not display in the app.
*/

struct WebView: NSViewRepresentable {
    
    let file: String

    func makeNSView(context: Context) -> WKWebView {
        
        guard let url = Bundle.main.url(forResource: self.file, withExtension: "html") else {
            return WKWebView()
        }
                
        let webview = WKWebView()
        webview.loadFileURL(url, allowingReadAccessTo: url)
        
        return webview
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) { }
    
}
