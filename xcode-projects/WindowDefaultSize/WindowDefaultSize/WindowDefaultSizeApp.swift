//
//  WindowDefaultSizeApp.swift
//  WindowDefaultSize
//
//  Created by Gavin Wiggins on 2/19/23.
//

import SwiftUI

@main
struct WindowDefaultSizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 400, height: 200)
    }
}
