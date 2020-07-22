//
//  ContentView.swift
//  text-vertical
//
//  Created by Gavin Wiggins on 3/7/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            Text("Vertical text")
                .rotationEffect(.degrees(-90))
                .fixedSize()
                .frame(width: 20, height: 180)
            Circle()
                .frame(width: 200)
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
