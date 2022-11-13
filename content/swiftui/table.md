---
title: Table
date: November 13, 2022
---

A Table presents rows and columns of data that can be selected and sorted. A basic example is shown below.

<img src="../images/tablebasic.png" style="max-width:400px;" alt="basic table">

```swift
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
```

To enable selectable rows in the table, use a selection variable. Select multiple rows by clicking rows while holding the command or shift key. Or click and drag the cursor across multiple rows.

<img src="../images/tableselection.png" style="max-width:400px;" alt="table selection">

```swift
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
    @State private var selectedPeople = Set&lt;Person.ID&gt;()

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
```

Sort a table by binding to an array of sort descriptors. Click the column header to sort the table based on that column's key path.

<img src="../images/tablesort.png" style="max-width:400px;" alt="table sort">

```swift
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
    @State private var sortOrder = [KeyPathComparator(\Person.firstName)]

    var body: some View {
        VStack {
            Table(people, sortOrder: $sortOrder) {
                TableColumn("First Name", value: \.firstName)
                TableColumn("Last Name", value: \.lastName)
            }
            .onChange(of: sortOrder) {
                people.sort(using: $0)
            }
            Text("Click table header to sort.")
                .padding()
        }
        .frame(width: 400, height: 300)
    }
}
```
