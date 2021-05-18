//
//  ContentView.swift
//  WebViewLoadHtml
//
//  Created by Gavin Wiggins on 5/16/21.
//

import SwiftUI

// Don't forget to enable "Outgoing Connections" in the target's "App Sandbox".
// Otherwise the website will not display in the app.

struct ContentView: View {
    var body: some View {
        WebView(htmlFile: "page")
            .padding()
            .frame(width: 480, height: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
