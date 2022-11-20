import Foundation

let subtract : (Int, Int) -> Int  = {
    (lhs: Int, rhs: Int) -> Int in
        lhs - rhs
}

let res = subtract(20, 10)
print(res)

// functional programming
func funcThatCallsSubtract(subtractFunc: (Int, Int) -> Int) {
    let x = 23
    let y = 22
    
    let res = subtractFunc(x, y)
    print(res)
}

funcThatCallsSubtract(subtractFunc: subtract)


// Syntax for trailing closure
func sayHello(
    _ name: String,
    using: (String) -> String
) {
    using(name)
}

sayHello("Anirudh") {
    (name: String) -> String in
    print(name)
    return name
}

// compact form 1
sayHello("Anirudh") {
    (name) in
    print(name)
    return name
}

// more-compact form 2
sayHello("Anirudh") {
    print($0)
    return $0
}


let tArray = [1,2,3,4]
let twoAdded = tArray.map() {
    (x) in
    x+2
}
