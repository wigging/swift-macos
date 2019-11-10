//
//  AppleView.swift
//  sidebar-navigation
//
//  Created by Gavin Wiggins on 11/10/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct AppleView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello from")
                .font(.title)
            Text("🍎 Apple View")
                .font(.largeTitle)
        }
        .frame(width: 480, height: 300)
    }
}

struct AppleView_Previews: PreviewProvider {
    static var previews: some View {
        AppleView()
    }
}
