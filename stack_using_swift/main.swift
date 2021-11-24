//
//  main.swift
//  stack_using_swift
//
//  Created by joe george on 24/11/21.
//

import Foundation

class Node<T> {
    
    var data : T
    var next: Node<T>?
    
    init(_ val: T) {
        self.next = nil
        self.data = val
    }
    
    public func toString() -> String {
        if let safeNext = self.next {
            return "\(self.data) -> \(safeNext.toString())"
        } else {
            return "\(self.data)"
        }
    }
}

class Stack<T> {
    
    var topNode: Node<T>?
    var size = 0
    
    private func isEmpty() -> Bool {
         return self.size == 0
     }
    
    public func toString() -> String {
        if !isEmpty() {
            if let safeTop : Node<T> = self.topNode {
                return safeTop.toString()
        }
    }
    return "Stack is empty."
    }
    
    // o(1) -> appending a new node on top of the top node
    func push(_ val: T) {
        let newNode: Node<T> = Node(val)
        
        if let safeTopNode = self.topNode {
            newNode.next = safeTopNode
            self.topNode = newNode
        } else {
            self.topNode = newNode
        }
        self.size += 1
    }
    
    // o(1) -> removes the top node from stack
    func pop() {
        if let safeTopNode = self.topNode {
            let tempNode = safeTopNode
            self.topNode = tempNode.next
            tempNode.next = nil
            self.size -= 1
        } else {
            return
        }
    }
}


let backgroundStack: Stack = Stack<String>()

backgroundStack.push("chrome")
backgroundStack.push("mozilla")
backgroundStack.push("instgram")
backgroundStack.push("whatsapp")
backgroundStack.pop()

print(backgroundStack.toString())


