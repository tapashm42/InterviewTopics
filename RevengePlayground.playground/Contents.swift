import UIKit

struct MemoryAddress<T>: CustomStringConvertible {
    let intValue: Int
    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }
    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

//**********************************Copy on write

let array = [1, 2, 3, 4, 5]
var array2 = array



print(MemoryAddress(of: array))
print(MemoryAddress(of: array2))
///  Till now both the addresses are same.

array2.append(6) /// Copy on write now both the addresses are different. as the address of array2 gets changed here.
print(MemoryAddress(of: array))
print(MemoryAddress(of: array2))
/// Now both the addresses are  different.


//*******************************************************************************//
/// Passing the array as an argument to multiple methods
var array3 = [6, 2, 3, 4, 5]

func update(_ array: inout [Int]) {
    print("\(MemoryAddress(of: array)) for \(#function)")
}

func update2(_ array: inout [Int]) {
    print("\(MemoryAddress(of: array)) for \(#function)")
}

func update3(_ array: inout [Int]) {
    print("\(MemoryAddress(of: array)) for \(#function)")
}

/// Before updating the array content
debugPrint("******************Before updating the array content****************")
print(MemoryAddress(of: array3))
update(&array3)
update2(&array3)
update3(&array3)


/// After updating the array content
debugPrint("******************After updating the array content****************")
print(MemoryAddress(of: array3))
update(&array3)
update2(&array3)
update3(&array3)
func update4(_ array: inout [Int]) {
    array.append(9)
    print("\(MemoryAddress(of: array)) for \(#function)")
}
update4(&array3)







