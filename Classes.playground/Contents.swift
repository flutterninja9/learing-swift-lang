import Foundation

class Person: Equatable {
    // using var here means the variable can be changed
    // internally as well as extrnally
    var name: String
    var age: Int
    
    init(
        _ name: String,
        _ age: Int
    ) {
        self.name = name
        self.age = age
    }
    
    func getDetails() -> String {
        return "Hey I am \(name) and I am \(age) years old!"
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        if(lhs.getDetails() == rhs.getDetails()) {
            return true
        }
        
        return false
    }
}


let person = Person("Anirudh", 24)
let person2 = person

print(person.getDetails())
print(person2.getDetails())
print(person == person2)

// Classes work on refrential equality in swift
// so whenever any instantiation is done to other variable
// old object's direct ref is pass
// unlike in structs

// Even if the variables are let
// They can change internally unlike structs
person2.name = "Raka Don"
print(person.getDetails())
print(person2.getDetails())

// Returns true if both instances point to same address in memory
print(person === person2)


/// Subclassing

class Vehicle {
    func goVroom() {
        print("Vroom Vroom!")
    }
}

class Car: Vehicle {}
class Bike: Vehicle {}

let car = Car()
let bike = Bike()

car.goVroom()
bike.goVroom()


/// protecting variables to get changed
///
class WeatherController {
    private var weather: Int
    
    init(
        _ weather: Int
    ) {
        self.weather = weather
    }
    
    func updateWeather() {
        weather += 10
    }
    
    func details() {
        print("Weather is \(weather) degress")
    }
}

let controller = WeatherController(18)

// Now we cannot set the value of weather directly from outside of class
// controller.weather += 10 -> this wont work now
controller.details()
controller.updateWeather()
controller.details()

// Initializers
// designated init -> Controls the normal init logic (mom @ the kitchen)
// convinience initializer -> Delegates request to designated init. after processing some of the logic (you at the door helping her)

class Tesla {
    private var model = "X"
    private var year: Int
    
    init(
        _ year: Int
    ) {
        self.year = year
    }
    
    init(
        _ model: String,
        _ year: Int
    ) {
        self.year = year
        self.model = model
    }
    
    // NOTE: You cannot call this from its subclasses
    convenience init(
        _ model: String
    ) {
        // here we are already setting the year to 2023
        // then delegating other logical part to our designated init.
        self.init(model, 2023)
    }
    
    func details() {
        print("Model: \(model)\nYear: \(year)")
    }
}


let modelZ = Tesla("Z")
modelZ.details()


class Temp {
    init() {
        print("Init")
    }
    
    deinit {
        print("De-Init")
    }
}


let someClosure: () -> Any? = {
    let t = Temp()
    return nil;
}

someClosure()
