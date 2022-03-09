import UIKit

class Stack {
    fileprivate var array: [Any] = []
    
    func push(_ element: Any) {
        array.append(element)
    }
    
    func pop() {
        array.popLast()
    }
    
    func peek() -> Any {
        return array.last ?? "This stack is empty =("
    }
}


var myStackOfBooks = Stack()

print(myStackOfBooks.peek())

myStackOfBooks.push("Book 1")
myStackOfBooks.push("Book 2")
myStackOfBooks.push("Book 3")
myStackOfBooks.push("Book 4")

print(myStackOfBooks.peek())

myStackOfBooks.pop()
myStackOfBooks.pop()

print(myStackOfBooks.peek())

myStackOfBooks.pop()
myStackOfBooks.pop()

print(myStackOfBooks.peek())
