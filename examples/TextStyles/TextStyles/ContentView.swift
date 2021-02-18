//
//  ContentView.swift
//  TextStyles
//
//  Created by Gavin Wiggins on 2/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Bold text").bold()
            Text("Italic text").italic()
            Text("Title text").font(.title)
            Text("Ultralight text").fontWeight(.ultraLight)
            Text("Strikethrough text").strikethrough()
            Text("Strikethrough blue").strikethrough(color: .blue)
            Text("Underline text").underline()
            Text("Underline green").underline(color: .green)
            Text("Color red text").foregroundColor(.red)
            Text("Purple and ").foregroundColor(.purple) + Text("Blue").foregroundColor(.blue)
        }
        .frame(width: 300, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
