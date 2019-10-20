//
//  AppleView.swift
//  sidebar-nav4
//
//  Created by Gavin on 9/20/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct AppleView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello from").font(.title)
            Text("🍎 Apple View").font(.largeTitle)
        }
        .frame(width: 480, height: 300)
    }
}

struct AppleView_Previews: PreviewProvider {
    static var previews: some View {
        AppleView()
    }
}
