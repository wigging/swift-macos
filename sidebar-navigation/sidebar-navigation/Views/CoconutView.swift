//
//  CoconutView.swift
//  sidebar-v1
//
//  Created by Gavin Wiggins on 2/29/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct CoconutView: View {
    var body: some View {
        VStack {
            Text("Coconut View").font(.largeTitle)
            Text("🥥").font(.title)
        }
        .frame(width: 300, height: 200)
    }
}

struct CoconutView_Previews: PreviewProvider {
    static var previews: some View {
        CoconutView()
    }
}
