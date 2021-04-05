//
//  ContentView.swift
//  TextStyles
//
//  Created by Gavin Wiggins on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text("Bold text").bold()
                Text("Italic text").italic()
                Text("Ultralight text").fontWeight(.ultraLight)
                Text("Strikethrough text").strikethrough()
                Text("Strikethrough blue").strikethrough(color: .blue)
                Text("Underline text").underline()
                Text("Underline green").underline(color: .green)
            }
            Group {
                Text("Upper case").textCase(.uppercase)
                Text("Lower case").textCase(.lowercase)
                Text("Color red text").foregroundColor(.red)
                Text("Purple and ").foregroundColor(.purple) + Text("Blue").foregroundColor(.blue)
            }
        }
        .frame(width:400, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
