// initialize an empty array
// -------------------------------------------------------

var floatsArray = [Float]()
var stringsArray = [String]()

var doubleArray: [Double] = []
var namesArray: [String] = []

// append to an array then empty ii
// -------------------------------------------------------

var intsArray = [Int]()     // create an empty array

intsArray.append(3)         // append single item
intsArray + [9, 8, 7, 6]    // add multiple items to the array

intsArray = []              // remove all items in the array

// create array of certain size with default values
// -------------------------------------------------------

var theArray = [Int](repeating: 3, count: 5)

// add two arrays together
// -------------------------------------------------------

let itemsA = [1, 2, 3]
let itemsB = [4, 5, 6]

let sum = itemsA + itemsB

// array literal
// -------------------------------------------------------

let foods: [String] = ["eggs", "bacon"]         // specify type
let fruits = ["apple", "orange", "watermelon"]  // infer type

// iterate over items in array
// -------------------------------------------------------

let plants = ["flower", "mint", "bush", "tree"]

for p in plants {
    print("plant item is \(p)")
}

// enumerate over an array
// -------------------------------------------------------

let months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July"]

for (id, m) in months.enumerated() {
    print("index \(id) for month \(m)")
}

// even and odd items in array

for (id, m) in months.enumerated() {
    
    if id % 2 == 0 {
        print("even id is \(id) for month \(m)")
    }
    
}

for (id, m) in months.enumerated() {
    
    if id % 2 != 0 {
        print("odd id is \(id) for month \(m)")
    }
    
}

// access and modify items in an array
// -------------------------------------------------------

var names = ["Bill", "Ted", "Homer", "Marge", "Beavis"]

names.count             // number of items in array

names.isEmpty           // if array is empty (true) or not (false)

names.append("Harry")   // append item to array

names + ["Gump"]        // append item to array

let aName = names[0]    // returm item from array

names[1] = "Sally"      // replace item at index 1
names

names[0...1] = ["Field", "Fields"]  // replace first and second items
names

names.insert("Daniel", at: 0)  // insert an item at index 0

names.remove(at: 0)      // remove item at index 0
names

names.removeLast()          // remove last item in array
names
