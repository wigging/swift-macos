//
//  CoconutView.swift
//  sidebar-navigation
//
//  Created by Gavin Wiggins on 10/20/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct CoconutView: View {
    var body: some View {
        HStack {
            Text("🥥").font(.title)
            Text("Coconut View").font(.title)
        }
        .frame(width: 580, height: 300)
    }
}

struct CoconutView_Previews: PreviewProvider {
    static var previews: some View {
        CoconutView()
    }
}
