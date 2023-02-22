//
//  WindowResizabilityApp.swift
//  WindowResizability
//
//  Created by Gavin Wiggins on 2/21/23.
//

import SwiftUI

@main
struct WindowResizabilityApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Uncomment these two lines to have a fixed window size
                //.frame(width: 300, height: 200)
                //.background(.orange)
                
                // Uncomment these two lines to have a window with a 200x200 min size
                // and a 500x400 max size, the window size is adjustable within this range
                .frame(minWidth: 200, maxWidth: 500, minHeight: 200, maxHeight: 400)
                .background(.purple)
        }
        .windowResizability(.contentSize)
    }
}
