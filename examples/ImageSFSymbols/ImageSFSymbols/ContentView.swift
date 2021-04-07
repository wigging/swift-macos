//
//  ContentView.swift
//  ImageSFSymbols
//
//  Created by Gavin Wiggins on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Images as SF Symbols")
            
            Image(systemName: "trash")
            
            Image(systemName: "trash.fill")
                        
            Image(systemName: "gear")
                .font(.system(size: 32, weight: .bold))
            
            Image(systemName: "gear")
                .imageScale(.large)
            
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.original).font(.largeTitle)
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
