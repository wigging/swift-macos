//
//  LemonView.swift
//  sidebar-nav4
//
//  Created by Gavin on 9/21/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct LemonView: View {
    
    var body: some View {
        HStack {
            Text("🍋").font(.title)
            Text("Lemon View").font(.title)
        }
        .frame(width: 580, height: 300)
    }
}

struct LemonView_Previews: PreviewProvider {
    static var previews: some View {
        LemonView()
    }
}
