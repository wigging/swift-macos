+++
title = "Button styles"
date = 2022-11-13
+++

Several built-in button styles are available for macOS such as the PlainButtonStyle, LinkButtonStyle, and BorderlessButtonStyle. The BorderedButtonStyle is also the default button style. To create a custom appearance for a button, use the ButtonStyle protocol. To fully customize the button's appearance and behavior, use the PrimitiveButtonStyle protocol.

<p><img src="/img/button-styles.png" style="max-width:400px;" alt="button styles"></p>

```swift
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
```
