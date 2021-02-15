//
//  ContentView.swift
//  window-open
//
//  Created by Gavin Wiggins on 4/3/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Click the button to open a window.")
                .padding(.bottom)
            
            Button("Open Window") {
                let windowView = WindowView()
                
                let window = NSWindow(contentRect: NSRect(), styleMask: [.titled, .closable], backing: .buffered, defer: false)
                window.center()
                window.isReleasedWhenClosed = false
                window.title = "My Window"
                
                window.contentView = NSHostingView(rootView: windowView)
                window.makeKeyAndOrderFront(self)
            }
        }
        .frame(width: 400, height: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
