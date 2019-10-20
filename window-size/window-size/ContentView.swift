//
//  ContentView.swift
//  window-size
//
//  Created by Gavin Wiggins on 10/20/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {

        VStack {
            Text("Window size is 500 by 300")
        }
        .frame(width: 500, height: 300)

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
