//
//  ContentView.swift
//  TextFont
//
//  Created by Gavin Wiggins on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
                                    
            Group {
                // Large title font
                Text("Large Title").font(.largeTitle)
                
                // Title font
                Text("Title").font(.title)

                // Title 2 font
                Text("Title 2").font(.title2)
                
                // Title 3 font
                Text("Title 3").font(.title3)
                
                // Headline font
                Text("Headline").font(.headline)
                
                // Subheadline font
                Text("Subheadline").font(.subheadline)
            }
            
            Group {
                // Body font
                Text("Body").font(.body)
                
                // Callout font
                Text("Callout").font(.callout)

                // Caption font
                Text("Caption").font(.caption)
                
                // Caption 2 font
                Text("Caption 2").font(.caption2)
                
                // Footnote font
                Text("Footnote").font(.footnote)
            }
        }.frame(width: 400, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
