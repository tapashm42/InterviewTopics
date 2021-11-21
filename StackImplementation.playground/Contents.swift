// Written by Tapash Mollick.

import UIKit

///Normal way of implementing Stack specific to a data type string
struct Stack {
    var elements: [Int] = []
    
    mutating func push(for element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int? {
        guard elements.count != 0 else { return nil }
        return elements.popLast()
    }
    
    func peek() -> Int? {
        guard elements.count != 0 else { return nil }
        return elements.last
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
    var elements: [T] = []
    
    mutating func push(for element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count != 0 else {
            return nil
        }
        return elements.removeLast()
    }
    
    func peek() -> T? {
        guard elements.count != 0 else {
            return nil
        }
        return elements.last
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
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
}

struct ProtocolStack<T>: Stackable {
    typealias Element = T
    var elements = [T]()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count != 0 else { return nil }
        return elements.popLast()
    }
    
    func peek() -> T? {
        guard elements.count != 0 else { return nil }
        return elements.last
    }
}

var charStatck = ProtocolStack<Character>()
charStatck.push("a")
charStatck.push("b")
charStatck.pop()
charStatck.pop()

