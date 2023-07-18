import Accelerate

// Create random data

var data = [Float](repeating: 0, count: 10)

for i in 0..<data.count {
    data[i] = .random(in: 2...14)
}

print(data)

// Normalize the data to range 0 to 1 using formula
// f = (s - s_min) / (s_max - s_min)

let max = data.max()!
let min = data.min()!

let u = vDSP.add(min * -1, data)
let dataNorm = vDSP.divide(u, max - min)

print(dataNorm)
