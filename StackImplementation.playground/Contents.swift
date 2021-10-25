// Written by Tapash Mollick.

import UIKit

///Normal way of implementing Stack specific to a data type string

struct Stack {
    var items: [Int] = []
    
    mutating func push(for element: Int) {
        items.append(element)
    }
    
    mutating func pop() -> Int? {
        guard items.count != 0 else {
            return nil
        }
        return items.removeLast()
    }
    
    func peek() -> Int? {
        guard items.count != 0 else {
            return nil
        }
        return items.last
    }
}

var stack = Stack()
stack.push(for: 1)
stack.push(for: 2)
stack.push(for: 3)
debugPrint(stack.peek() ?? 0)
stack.pop()
debugPrint(stack.peek() ?? 0)
stack.pop()
debugPrint(stack.peek() ?? 0)
stack.pop()
debugPrint(stack.peek() ?? 0)

///Generic way of implementing Stack specific to any data type

struct GenericStack<T> {
    var items: [T] = []
    
    mutating func push(for element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T? {
        guard items.count != 0 else {
            return nil
        }
        return items.removeLast()
    }
    
    func peek() -> T? {
        guard items.count != 0 else {
            return nil
        }
        return items.last
    }
}

var stringStack = GenericStack<String>()
stringStack.push(for: "iOS")
stringStack.push(for: "android")
debugPrint(stringStack.peek())
stringStack.pop()
debugPrint(stringStack.peek())

var intStack = GenericStack<Int>()
intStack.push(for: 100)
intStack.push(for: 200)
debugPrint(intStack.peek())
intStack.pop()
debugPrint(intStack.peek())

///Generic way of implementing Stack specific to any data type using protocol

protocol Stackable {
    
}
