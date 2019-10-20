//
//  ContentView.swift
//  scroll-view
//
//  Created by Gavin on 8/3/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct NameRow: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(name)")
            Spacer()
            Divider()
        }.frame(width: 100, height: 40)
    }
}

struct ContentView: View {
    
    // Must remove .fullSizeContentView from AppDelegate NSWindow otherwise bottom
    // of scroll view will be clipped by window frame.
    
    let names = ["Homer", "Marge", "Lisa", "Bart", "Maggie", "Krusty", "Burns", "Nelson", "Otto"]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(names, id: \.self) { name in
                    NameRow(name: name)
                }
            }
        }.frame(width: 100, height: 160)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NameRow(name: "Name")
            ContentView()
        }
    }
}
#endif
