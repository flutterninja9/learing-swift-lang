import Foundation


// Generics ae used for avoiding writing ame code mulitple times

func perform(
    _ op: (Int, Int) -> Int,
    on lhs: Int,
    and rhs: Int
) -> Int {
    return op(lhs, rhs)
}

let x = 20
let y = 10

perform(+, on: x, and: y)
perform(-, on: x, and: y)
perform(*, on: x, and: y)
perform(/, on: x, and: y)

// Now consider a sitatution comes where
// you have to add support of Doubles as well to the above function
// Then you will probably copy-paste the function with Double in there
// But here comes the role [generics], See how

// This function will now work will any kind of numbers
func performGeneric<N: Numeric>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N {
    return op(lhs, rhs)
}

let a = 10.50
let b = 20.67

// working with int
performGeneric(+, on: x, and: y)
performGeneric(-, on: x, and: y)
performGeneric(*, on: x, and: y)
performGeneric(/, on: x, and: y)

// working with doubles
performGeneric(+, on: a, and: b)
performGeneric(-, on: a, and: b)
performGeneric(*, on: a, and: b)
performGeneric(/, on: a, and: b)

