//
//  ContentView.swift
//  preferences-window
//
//  Created by Gavin Wiggins on 11/14/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Example Here")
                .font(.headline)
            
            Button("My Button") {
                print("Clicked button")
            }
        }
        .padding()
        .frame(width: 300, height: 200)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
