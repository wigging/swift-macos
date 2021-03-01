//
//  ContentView.swift
//  Credits
//
//  Created by Gavin Wiggins on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("To view the Credits in the About window, go to the menu bar, select Credits, then click About Credits.")
            .padding()
            .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
