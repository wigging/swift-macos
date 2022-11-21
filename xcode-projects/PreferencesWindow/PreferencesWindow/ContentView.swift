//
//  ContentView.swift
//  PreferencesWindow
//
//  Created by Szabolcs Tóth on 2021. 09. 13..
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("fontSize") private var fontSize = 12
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.system(size: CGFloat(fontSize)))
            Text("Font size of the text can be changed in the Preferences... ⌘,")
        }
        .frame(width: 420, height: 260)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
