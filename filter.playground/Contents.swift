import Foundation

// Example 1

let fruits = ["apple", "orange", "banana", "melon"]
let filteredFruits = fruits.filter { $0.contains("an") }
print(filteredFruits)

// Example 2

struct Group {
    let name: String
    let tags: [String]
}

let groups = [
    Group(name: "Bears", tags: ["fury", "brown", "big"]),
    Group(name: "Dogs", tags: ["small", "fury", "nice"]),
    Group(name: "Fish", tags: ["tiny", "water", "scales"])
]

//let filteredNames = groups.filter { $0.name.lowercased().contains(text) }
let filteredTags = groups.filter { $0.tags.joined().contains("ur") }

for tag in filteredTags {
    print(tag)
}

let arr = ["one", "two", "three"]
arr.joined(separator: " ").contains("on")
