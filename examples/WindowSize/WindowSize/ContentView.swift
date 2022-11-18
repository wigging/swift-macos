//
//  ContentView.swift
//  WindowSize
//
//  Created by Gavin Wiggins on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe").imageScale(.large)
            Text("Hello, world!").fontWeight(.bold)
        }
        //.frame(width: 300, height: 200)
        //.background(.orange)
        .frame(minWidth: 200, maxWidth: 500, minHeight: 200, maxHeight: 400)
        .background(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
