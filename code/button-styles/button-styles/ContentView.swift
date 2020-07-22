//
//  ContentView.swift
//  button-styles
//
//  Created by Gavin Wiggins on 6/6/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .blue : .red)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.purple, lineWidth: 3)
            )
            .onHover { hover in
                hover ? NSCursor.pointingHand.push() : NSCursor.pop()
            }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            
            // Default button style
            Button("Default Style") {
                print("clicked default")
            }
            
            // Plain button style
            Button("Plain Style") {
                print("clicked plain")
            }
            .buttonStyle(PlainButtonStyle())
            
            // Link button style
            Button("Link Style") {
                print("clicked link")
            }
            .buttonStyle(LinkButtonStyle())
            
            // Bordered button style
            Button("Bordered Style") {
                print("clicked bordered")
            }
            .buttonStyle(BorderedButtonStyle())
            
            // Borderless button style
            Button("Borderless Style") {
                print("clicked borderless")
            }
            .buttonStyle(BorderlessButtonStyle())
            
            // Custom button style
            Button("Custom Style") {
                print("clicked custom")
            }
            .buttonStyle(CustomButtonStyle())
            
        }
        .frame(width: 400, height: 400)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
