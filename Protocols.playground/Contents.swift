import Foundation

// Protocols define variables and methods which their
// extendors must have conform to

protocol CanBreath {
    func breath()
}

struct Animal: CanBreath {
    func breath() {
        print("Breathing!")
    }
}


let cat = Animal()
cat.breath()


// Creating a fallback impl for any method in a Protocol
// Trick is to use an extension

protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        print("Jumping")
    }
}

struct Cat: CanJump {
    
}

let cat2 = Cat()
// we can now use the fallback impl of jump method
// and easily override if we wanted to
cat2.jump()


// defining variables
protocol HasName {
    var name: String { get }
    var age: Int { get set }
}

struct Person: HasName {
    let name: String
    var age: Int
}


var person = Person(name: "Anirudh", age: 24)
person.age = 23
