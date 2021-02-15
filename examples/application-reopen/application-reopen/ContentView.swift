//
//  ContentView.swift
//  application-reopen
//
//  Created by Gavin Wiggins on 6/16/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("1. Close this main window.").padding(.bottom)
            Text("2. Reopen the window by clicking the app's Dock icon.")
        }
        .padding()
        .frame(width: 400, height: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
