import Foundation

let myAge = 22
let yourAge = 28

if myAge > yourAge {
    print("I am older than you")
} else if myAge < yourAge {
    print("I am younger")
} else {
    print("We are same in age")
}

// There are 3 types of operators
// 1. Unary prefix -> working with 1 value
let toggle = !true

// 2. Unary postfix -> working with 1 value
let name = Optional("Tim")
let unaryPostfix = name!

// 3. Binary infix -> working with 2 values
let sum = yourAge + myAge

let someBoolean = true

someBoolean ? print("Yeah!") : print("Naah!!")



