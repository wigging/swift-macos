//
//  ContentView.swift
//  text-view
//
//  Created by Gavin Wiggins on 11/13/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         VStack {
            Text("Hello World")
            Text("Hello World").bold()
            Text("Hello World").italic()
            Text("Hello World").foregroundColor(.red)
            Text("Hello World").fontWeight(.ultraLight)
            Text("Hello World").underline()
            Text("Hello World").underline(true, color: .red)
            Text("Hello World").strikethrough()
            Text("Hello World").strikethrough(true, color: .green)
            Text("Hello > ").foregroundColor(.green) + Text("World").foregroundColor(.blue)
         }
         .frame(width: 400, height: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
