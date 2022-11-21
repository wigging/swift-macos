//
//  ContentView.swift
//  ButtonStyles
//
//  Created by Gavin Wiggins on 2/20/21.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding()
            .background(Color.yellow.cornerRadius(12))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct BorderButtonStyle: ButtonStyle {

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

struct DoubleTapButtonStyle: PrimitiveButtonStyle {
    
    @State private var tapped = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(tapped ? .yellow : .white)
            .padding(10)
            .background(Color.red.cornerRadius(8))
            .onTapGesture(count: 2, perform: {
                tapped.toggle()
                configuration.trigger()
            })
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // Default style
            Button("Default Style") {}
            
            // Plain button style
            Button("Plain Style") {}.buttonStyle(PlainButtonStyle())
            
            // Link button style
            Button("Link Style") {}.buttonStyle(LinkButtonStyle())
                        
            // Borderless button style
            Button("Borderless Style") {}.buttonStyle(BorderlessButtonStyle())
            
            // Bordered button style
            Button("Bordered Style") {}.buttonStyle(BorderedButtonStyle())
            
            // Group button style
            VStack {
                Button("Button 1") {}
                Button("Button 2") {}
            }
            .buttonStyle(LinkButtonStyle())
            
            // Custom border button style
            Button("Custom Style") {}.buttonStyle(BorderButtonStyle())
            
            // Custom rounded button style
            Button("Rounded Style") {}.buttonStyle(RoundedButtonStyle())
            
            // Double tap button style
            Button("Double Tap Style") {}.buttonStyle(DoubleTapButtonStyle())
        }
        .frame(width: 400, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
