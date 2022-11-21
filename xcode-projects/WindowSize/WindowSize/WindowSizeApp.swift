//
//  WindowSizeApp.swift
//  WindowSize
//
//  Created by Gavin Wiggins on 11/13/22.
//

import SwiftUI

@main
struct WindowSizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
    }
}
