//
//  ContentView.swift
//  webview-load-string
//
//  Created by Gavin Wiggins on 1/22/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geom in
                ScrollView {
                    WebView(content: htmlContent)
                        .frame(height: geom.size.height)
                }
            }
            Text("HTML content")
        }
        .padding()
        .frame(width: 480, height: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
