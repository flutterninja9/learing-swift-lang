import Foundation

func funWithouArgs() {
    print("Nothing here")
}

func plusTwo(val: Int) {
    print(val+2)
}

// Function with arg labels
func getPlusTwo(val: Int) -> Int {
    val+2
}

// Function without arg labels
func customSum(
   _ lhs: Int,
   _ rhs: Int
) -> Int {
    lhs + rhs
}

// If a function returns a value and you
// dont or only-sometimes wanna consume its result
// then mark that function as @discardableResult
@discardableResult
func tempFunc() -> Int {
    return 898
}

// default args in functions
func nameTaker(
    firstName: String = "Foo",
    lastName: String = "Bar"
) {
    print("\(firstName) \(lastName)")
}

funWithouArgs()
plusTwo(val: 30)
let res = getPlusTwo(val: 40)
print(res)
let customSumRes = customSum(10, 20)
print(customSumRes)
nameTaker()
nameTaker(firstName: "Rajesh")
nameTaker(firstName: "Rajesh", lastName: "Lala")
