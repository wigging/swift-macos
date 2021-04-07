//
//  ContentView.swift
//  Image
//
//  Created by Gavin Wiggins on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("homer")
                .resizable()
                .aspectRatio(contentMode: .fit)
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
