//
//  PreferencesWindowApp.swift
//  PreferencesWindow
//
//  Created by Szabolcs Tóth on 2021. 09. 13..
//

import SwiftUI

@main
struct PreferencesWindowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        Settings {
            SettingsView()
        }
    }
}
