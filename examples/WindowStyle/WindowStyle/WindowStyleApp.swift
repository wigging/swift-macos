//
//  WindowStyleApp.swift
//  WindowStyle
//
//  Created by Gavin Wiggins on 2/6/22.
//

import SwiftUI

@main
struct WindowStyleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //.windowStyle(.automatic)
        .windowStyle(.hiddenTitleBar)
        //.windowStyle(.titleBar)

        //.windowToolbarStyle(.automatic)
        //.windowToolbarStyle(.expanded)
        //.windowToolbarStyle(.unified)
        .windowToolbarStyle(.unifiedCompact)
        //.windowToolbarStyle(.unified(showsTitle: true))
        //.windowToolbarStyle(.unified(showsTitle: false))
        //.windowToolbarStyle(.unifiedCompact(showsTitle: true))
        //.windowToolbarStyle(.unifiedCompact(showsTitle: false))
    }
}
