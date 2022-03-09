import UIKit

class Stack<T> {
    fileprivate var array: [T] = []
    
    func push(_ element: T) {
        self.array.append(element)
    }
    
    func pop() {
        self.array.popLast()
    }
    
    func peek() -> T {
        return self.array.last ?? "This stack is empty =(" as! T
    }
}


var myStackOfBooks = Stack<String>()

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
