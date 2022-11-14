//
//  ContentView.swift
//  LabeledContentExample
//
//  Created by Gavin Wiggins on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Below are labeled content examples.")
            
            LabeledContent("Favorites") {
                Image(systemName: "star.fill")
            }
            
            LabeledContent("Wireless") {
                Image(systemName: "wifi")
            }
        }
        .frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
