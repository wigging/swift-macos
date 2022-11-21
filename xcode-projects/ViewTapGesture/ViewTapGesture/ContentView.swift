//
//  ContentView.swift
//  ViewTapGesture
//
//  Created by Gavin Wiggins on 5/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var onetap = 0
    @State private var twotaps = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.cyan)
                .frame(width: 200, height: 200)
                .onTapGesture(count: 2) {
                    twotaps += 1
                }
                .onTapGesture {
                    onetap += 1
                }
            Text("Tap or click inside the blue square")
            Text("One tap = \(onetap)")
            Text("Two taps = \(twotaps)")
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
