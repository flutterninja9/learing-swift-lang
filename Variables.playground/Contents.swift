import Foundation


// No Re-assignment allowed, Even in the structure-types
// like list.append
let nameOne = "Some name"
let nameTwo = "Some another name"

// Re-assignment allowed, as it is a struct
// NOTE: Internal impl. of classes can change
var nameList = [
    nameOne,
    nameTwo,
]

nameList.append("Baz")


// Swift works with Value Types for struct, unlike Reference Type in Dart
// When a pre-asigned variabled is asigned to some another varible, copy of older variable
// is actually being assigned instead of the reference (as in Dart)
// NOTE: struct -> Value Type
// Note: class -> Referential type
let foo = "Foo"
var foo2 = foo
foo2 = "Foo2"
foo
foo2

// Some Objective-C Code 😢 (for curious people)
// This is a old Obj-C class, through which even if the variable type is "let"
// Internal impl. of list can be mutated
let oldStyledArray = NSMutableArray(
array: [
    1,
    2,
    3,
])

let newCopyArray = oldStyledArray
newCopyArray.add(4)
// As [NSMutableArray] is a class and they has referential equality
// Value would reflect in [oldStyledArray] as well
newCopyArray
oldStyledArray
