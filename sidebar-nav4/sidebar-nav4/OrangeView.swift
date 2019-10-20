//
//  OrangeView.swift
//  sidebar-nav4
//
//  Created by Gavin on 9/20/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct OrangeView: View {
    
    var body: some View {
        VStack {
            Text("The Orange")
            Text("🍊").font(.title)
            Button(action: {
                print("Clicked orange button")
            }) {
                Text("Click me")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}
