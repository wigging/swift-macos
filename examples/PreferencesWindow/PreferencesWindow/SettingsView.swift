//
//  SettingsView.swift
//  PreferencesWindow
//
//  Created by Szabolcs Tóth on 2021. 09. 13..
//

import SwiftUI

struct SettingsView: View {
    
    private enum Tabs: Hashable {
        case general
    }
    
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
