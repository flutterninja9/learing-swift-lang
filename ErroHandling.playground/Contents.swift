import Foundation



struct Person {
    let firstName: String?
    let lastName: String?
    
    // Any error object (like Enum here) must conform to [Error]
    // for becoming a throwable
    enum Errors: Error {
        case bothNameAreNil
        case firstNameIsNil
        case lastNameIsNil
    }
    
    // Just denote a function with [throws] if it is going to throw any error
    func fullName() throws -> String {
        switch(firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNameAreNil
        case(.some, .none):
            throw Errors.lastNameIsNil
        case(.none, .some):
            throw Errors.firstNameIsNil
        case let(.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let person = Person(firstName: "Radhey Mohan", lastName: nil)

// proper handling of errors is like this
// do -> try -> catch
do {
    let fullName = try person.fullName()
}
catch {
    print("Error: \(error)")
}



// Only catching errors of a specific type
do {
    let fullName = try person.fullName()
}
catch is Person.Errors {
    print("Got an error")
}




// Checking type more deeper
do {
    let fullName = try person.fullName()
}
catch Person.Errors.firstNameIsNil {
    print("Got an error")
}
catch Person.Errors.lastNameIsNil {
    print("Got an error")
}
catch Person.Errors.bothNameAreNil {
    print("Got an error")
}


// throwing in initializers of structs and classes
struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(_ manfufacturer: String) throws {
        if(manfufacturer.isEmpty) {
            throw Errors.invalidManufacturer
        } else {
            self.manufacturer = manfufacturer
        }
    }
}


do {
    let car = try Car("")
} catch Car.Errors.invalidManufacturer{
    print("Inavalid manufacturer")
}





// If a function invokes another function that throws something
// then we can user [rethrows] on main function instead of [throws]
// NOTE: For this the main/parent function must have the child function as as argument and marked with [throws]

func parent(
    _ argA: String?,
    _ argB: String?,
      child: (String?, String?) throws -> String?
) rethrows -> String? {
         try child(argA,
            argB
         )
}

enum NameErrors : Error {
    case firstNameInvalid
    case lastNameInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws ->  String? {
    // [ guard ] statements are used for "making-sure" a certain condition is valid
    
    // this can be translated to
    // "Make sure firstName is present and it is not empty else execute the else-block"
    guard let firstName,
            !firstName.isEmpty else{
        throw NameErrors.firstNameInvalid
    }
    
    guard let lastName,
            !lastName.isEmpty else{
        throw NameErrors.lastNameInvalid
    }
    
    return "\(firstName) \(lastName)"
}


do {
    let fullName = try parent(
        "",
        "",
        child: +
    )
    
    fullName
}
catch {
    print(error)
}
