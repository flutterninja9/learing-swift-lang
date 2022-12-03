import Foundation


class SomeClass {
    let fieldOne: String
    let fieldTwo: Int
    
    init(
        _ fieldOne: String,
        _ fieldTwo: Int
    ) {
        self.fieldOne = fieldOne
        self.fieldTwo = fieldTwo
    }
}

extension SomeClass {
    func sayHello() {
        print("Hello")
    }
        
    // As we are in extension, we get access to fields of class
    func printDetails() {
        print("Field one is \(fieldOne)")
        print("Field two is \(fieldTwo)")
    }
}

let object = SomeClass("Hello", 122)

// See how we are calling the extension methhods
print(object.sayHello())
print(object.printDetails())


/// By default if we wrie any init constructers of our own then the default constructer gets destroyed via swift
/// to prevent this we can make use of extension, and write other constructers inside extension


struct Person {
    let firstName: String
    let lastName: String
    
    // If we want to have a constructer which accepts fullName
    // we cannot directlt do it as previous constructer will be destroyed
//    init(fullName: String) {
//
//    }
}

// for preventing this we write it inside extension

extension Person {
    init(fullName: String) {
        let splittedNames = fullName.split(separator: " ")
        self.init(firstName: String(splittedNames[0]) , lastName: String(splittedNames[1]) )
    }
}


let person = Person(fullName: "Lala Boii")
let personTwo = Person(firstName: "Lala", lastName: "Boiii")
