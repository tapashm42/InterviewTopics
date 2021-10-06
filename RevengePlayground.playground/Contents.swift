import UIKit

///Copy on write

let array = [1, 2, 3, 4, 5]
var array2 = array

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

print(MemoryAddress(of: array))
print(MemoryAddress(of: array2))
///  Till now both the addresses are same.

array2.append(6) /// Copy on write now both the addresses are different. as the address of array2 gets changed here.
print(MemoryAddress(of: array))
print(MemoryAddress(of: array2))
/// Now both the addresses are  different.
