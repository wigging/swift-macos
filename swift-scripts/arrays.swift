// Arrays

// Basic example of an immutable array
// ---------------------------------------------------------------------------

let a = Array([4, 5, 8, 6, 10, 12, 17])

print("a is \(a)")
print("a[0] is \(a[0])")
print("a[2] is \(a[2])")
print("a.count is \(a.count)")

// Basic example of a mutable array
// ---------------------------------------------------------------------------

var b = [4, 5, 6, 7, 8]
b[0] = 99

print("b is \(b)")

// Create empty array and append integers
// ---------------------------------------------------------------------------

var c: [Int] = []
c.append(2)
c.append(10)
c.append(19)
print("c is \(c)")

// Create array of random numbers
// ---------------------------------------------------------------------------

let z = (1...5).map { _ in Float.random(in: 1...10) }

print("z is \(z)")

// Create array from a range of numbers
// ---------------------------------------------------------------------------

let zz = Array(1...10)

print("zz is \(zz)")

// Get the first and last items of an array
// ---------------------------------------------------------------------------

let x = [4, 5, 1, 9, 7]

if let firstItem = x.first {
    print("x.first item is \(firstItem)")
}

if let lastItem = x.last {
    print("x.last item is \(lastItem)")
}

// Iterate through items of an array
// ---------------------------------------------------------------------------

let names = ["Homer", "Bart", "Marge", "Crusty", "Lisa"]

for n in names {
    print("name is \(n)")
}

for (i, n) in names.enumerated() {
    print("index \(i), name \(n)")
}

// Map arrays to structs
// ---------------------------------------------------------------------------

let xpts: [Float] = [1, 2, 3, 4, 5, 6]
let ypts: [Float] = [3, 4.5, 8, 7, 10, 2.2]

struct Point {
    let x: Float
    let y: Float
}

let points = zip(xpts, ypts).map { Point(x: $0, y: $1) }

for pt in points {
    print("x is \(pt.x), y is \(pt.y)")
}
