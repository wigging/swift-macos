//
//  ContentView.swift
//  cursors
//
//  Created by Gavin Wiggins on 6/7/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Hover over each button to change cursor.")
            
            // i-beam cursor
            Button(" i-beam ") { }
            .onHover { hover in
                hover ? NSCursor.iBeam.push() : NSCursor.pop()
            }
            
            // crosshair cursor
            Button(" crosshair ") { }
            .onHover { hover in
                hover ? NSCursor.crosshair.push() : NSCursor.pop()
            }
            
            // close-hand cursor
            Button(" closed-hand ") { }
            .onHover { hover in
                hover ? NSCursor.closedHand.push() : NSCursor.pop()
            }
            
            // open-hand cursor
            Button(" open-hand ") { }
            .onHover { hover in
                hover ? NSCursor.openHand.push() : NSCursor.pop()
            }
            
            // pointing-hand cursor
            Button(" pointing-hand ") { }
            .onHover { hover in
                hover ? NSCursor.pointingHand.push() : NSCursor.pop()
            }
            
        }
        .frame(width: 400, height: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
