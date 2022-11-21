//
//  ContentView.swift
//  TableSelection
//
//  Created by Gavin Wiggins on 12/19/21.
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
    Person(firstName: "Marge", lastName: "Simpson"),
    Person(firstName: "Chief", lastName: "Wiggum"),
    Person(firstName: "Itchy", lastName: "Scratchy")
]

struct ContentView: View {
    @State private var selectedPeople = Set<Person.ID>()
    
    var body: some View {
        VStack {
            Table(people, selection: $selectedPeople) {
                TableColumn("First Name", value: \.firstName)
                TableColumn("Last Name", value: \.lastName)
            }
            Text("\(selectedPeople.count) people selected")
                .padding()
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
