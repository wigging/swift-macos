//
//  ContentView.swift
//  sidebar-nav3
//
//  Created by Gavin on 8/8/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

private struct RowItem {
    let icon: String
    let name: String
}

private func selectView(from name: String) -> AnyView {
    switch name {
    case "One":
        return AnyView(DetailOneView())
    case "Two":
        return AnyView(DetailTwoView())
    case "Three":
        return AnyView(DetailThreeView())
    default:
        return AnyView(DetailOneView())
    }
}

struct SidebarView: View {
    @Binding var selection: String?
    private let rowItems = [RowItem(icon: "😀", name: "One"), RowItem(icon: "😎", name: "Two"), RowItem(icon: "😜", name: "Three")]
    
    var body: some View {
        List(selection: $selection) {
            Section(header: Text("The Views")) {
                ForEach(rowItems, id: \.name) { rowItem in
                    HStack {
                        Text(rowItem.icon)
                        Text(rowItem.name)
                    }
                }
            }
        }.listStyle(SidebarListStyle())
    }
}

struct ContentView: View {
    @State private var selection: String? = nil

    var body: some View {
        HStack(spacing: 0) {
            SidebarView(selection: $selection)
            Divider()
            selectView(from: selection ?? "Name")
        }
        .frame(width: 600, height: 300)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
