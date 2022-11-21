//
//  ContentView.swift
//  TableBasic
//
//  Created by Gavin Wiggins on 12/18/21.
//

import SwiftUI

struct Person: Identifiable {
    let firstName: String
    let lastName: String
    let id = UUID()
}

private var people = [
    Person(firstName: "Homer", lastName: "Simpson"),
    Person(firstName: "Lisa", lastName: "Simpson"),
    Person(firstName: "Krusty", lastName: "Clown"),
    Person(firstName: "Marge", lastName: "Simpson")
]

struct ContentView: View {
    var body: some View {
        Table(people) {
            TableColumn("First Name", value: \.firstName)
            TableColumn("Last Name", value: \.lastName)
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
