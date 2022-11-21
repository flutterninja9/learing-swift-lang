import Foundation

enum Animals {
    case dog
    case cat
    case rabbit
}

let animalOne = Animals.dog

switch animalOne {
case .dog:
    "This is a dog"
case .cat:
    "This is a cat"
case .rabbit:
    "This is a rabbit"
}


// enums with associated values
enum Failure: Equatable {
    case serverFailure(reason: String)
    case cacheFailure(reason: String, stack: Any)
    
    // In case of enums with associated values
    // We have to provide an equality override explicitly
    static func == (
        lhs: Failure,
        rhs: Failure
    ) -> Bool {
        switch (lhs, rhs) {
        case (.serverFailure(let reason), .serverFailure(let reasonOther)):
            return reason == reasonOther
        case (.cacheFailure(let reason, _), .cacheFailure(let reasonOther, _)):
            return reason == reasonOther
        default:
            return false
        }
    }
}

let serverFailure = Failure.serverFailure(reason: "Error 404")
let serverFailreOther = Failure.serverFailure(reason: "Error 404")

print(serverFailure == serverFailreOther)

switch serverFailure {
case .serverFailure(reason: let reason):
    print(reason)
case .cacheFailure(reason: let reason, stack: let stack):
    print(reason)
    print(stack)
}


// assigning raw values to enums
enum Family: String {
    case Father = "Dad"
    case Mother = "Mom"
    case Brother = "Bro"
    case Sister = "Sis"
}

// we now have an extra method named (rawValue)
let member = Family.Father
print(member.rawValue)


// allow all enum values to be iterable
enum Emoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
}

// we now have an extra method named (rawValue)
Emoji.allCases.map() {
    val in
    print(val.rawValue)
}

// Some advanced stuff
// Using enums recursively

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(operation: IntOperation? = nil) -> Int
    {
        switch operation ?? self {
        case .add(let a,let b):
            return a + b
        case .subtract(let a, let b):
            return a - b
        case .freeHand(let opr):
            return calculateResult(operation: opr)
        }
    }
}



let freeHand = IntOperation.freeHand(.add(10, 20))
print(freeHand.calculateResult())
