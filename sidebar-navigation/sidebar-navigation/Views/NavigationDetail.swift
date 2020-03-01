//
//  NavigationDetail.swift
//  sidebar-v1
//
//  Created by Gavin Wiggins on 2/29/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct NavigationDetail: View {
    
    @Binding var fruit: Fruit?

    var body: some View {
        
        switch fruit {
        case .apple:
            UserDefaults.standard.set(Fruit.apple.rawValue, forKey: "SelectedFruit")
            return AnyView(AppleView())
        case .coconut:
            UserDefaults.standard.set(Fruit.coconut.rawValue, forKey: "SelectedFruit")
            return AnyView(CoconutView())
        case .mango:
            UserDefaults.standard.set(Fruit.mango.rawValue, forKey: "SelectedFruit")
            return AnyView(MangoView())
        case .kiwi:
            UserDefaults.standard.set(Fruit.kiwi.rawValue, forKey: "SelectedFruit")
            return AnyView(KiwiView())
        case .none:
            return AnyView(Text("Default View").frame(width: 300, height: 200))
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetail(fruit: .constant(.mango))
    }
}
