//
//  GeneralSettingsView.swift
//  PreferencesWindow
//
//  Created by Szabolcs Tóth on 2021. 09. 13..
//

import SwiftUI

struct GeneralSettingsView: View {
    
    @AppStorage("fontSize") private var fontSize = 12.0
    
    var body: some View {
        VStack {
            Slider(value: $fontSize, in: 9...82) {
                Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
            }
        }
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
