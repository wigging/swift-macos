//
//  NavigationMaster.swift
//  sidebar-v1
//
//  Created by Gavin Wiggins on 2/29/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct NavigationMaster: View {
    
    @Binding var selectedFruit: Fruit?
    private let defaultFruit = Fruit(rawValue: UserDefaults.standard.object(forKey: "SelectedFruit") as? String ?? "🥭 Mango")

    var body: some View {
        List(Fruit.allCases, id: \.self, selection: $selectedFruit) { fruit in
            Text("\(fruit.rawValue)")
        }
        .listStyle(SidebarListStyle())
        .onAppear {
            self.selectedFruit = self.defaultFruit
        }
    }
}

struct NavigationMaster_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMaster(selectedFruit: .constant(.coconut))
    }
}
