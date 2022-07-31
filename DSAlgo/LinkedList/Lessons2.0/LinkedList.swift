//
//  LinkedList.swift
//  Lessons2.0
//
//  Created by Babul Raj on 23/03/22.
//

import Foundation
class LinkedListObservable: ObservableObject {
    @Published var linkedList: LinkedList<Int>?
    
    init() {
        getLL()
    }
    
    func getLL() {
        linkedList = LinkedList<Int>()
        linkedList?.append(value: 10)
        linkedList?.append(value: 11)
        linkedList?.append(value: 12)
        linkedList?.append(value: 13)
        linkedList?.append(value: 14)
        linkedList?.append(value: 15)
        linkedList?.append(value: 16)
        //linkedList?.reverseLL()
        linkedList?.append(value: 17)
        let node1 = self.linkedList?.getNode(at: 1)
        let node2 = self.linkedList?.getNode(at: 7)
        //linkedList?.swap(node1: node1, node2: node2)
       // linkedList?.swap(11, 17)
        linkedList?.reverseLL()
        
    }
}

public class LinkedList<Value:Comparable> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public  func push(_ value: Value) {
        head = Node(value: value,next: head)
        
        if tail == nil {
            tail = head
        }
        
    }
    
    public  func append(value: Value) {
        guard let _ = head else  {
            self.head = Node(value: value, next: nil)
            tail = self.head
            
            return
        }
       
        tail?.next = Node(value: value, next: nil)
        tail = tail?.next
    }
    
    public  func insert(value: Value, after: Node<Value>?) {
        guard let _ = head else {
            head = Node(value: value, next: nil)
            tail  = head
            return
        }
       
        guard  after !== self.tail else {
            append(value: value)
            return
        }
        after?.next = Node(value: value, next: after?.next)
    }
    
    func getNodeWith(value: Value) -> Node<Value>? {
        var start = head
        while start?.value != nil {
            guard let valueLoc = start?.value else {return nil}
           
            if (valueLoc == value) {
                break
            }
            
            start = start?.next
        }
        
        return start
    }
    
    public func swap(_ item1: Value, _ item2: Value) {
        guard let node1 = getNodeWith(value: item1), let node2 = getNodeWith(value: item2) else {return}
        
        var currentNode1 = head
        var currentNode2 = head
        
        while currentNode1?.next !== node1 {
            currentNode1 = currentNode1?.next
        }
        
        while currentNode2?.next !== node2 {
            currentNode2 = currentNode2?.next
        }
        print("swap Node1 = \(node1)")
        print("swap Node2 = \(node2)")
        print("currentNode2 = \(currentNode2)")
        print("currentNode1 = \(currentNode1)")
        print("currentNode2 = \(currentNode2)")
        
        currentNode1?.next = node2
        currentNode2?.next = node1
        let backup = node1.next
        node1.next = node2.next
        node2.next = backup
    }
    
    
    
    public  func swap(node1: Node<Value>?, node2: Node<Value>?) {
        var prevNode1: Node<Value>?
        var prevNode2: Node<Value>?
        
        guard let node1 = node1, let node2 = node2 else {
            
            return
        }
       
        guard node1 !== node2 else {return}
        
        var currentNode1 = head
       
        while (currentNode1 !== node1) {
            prevNode1 = currentNode1
            currentNode1 = currentNode1?.next
        }
        
        var currentNode2 = head
       
        while (currentNode2 !== node2) {
            prevNode2 = currentNode2
            currentNode2 = currentNode2?.next
        }
        
        prevNode1?.next = node2
        prevNode2?.next = node1
        
        let temp = node1.next
        node1.next = node2.next
        node2.next = temp
    }
    
     func getNode(at index: Int) -> Node<Value>? {
        var node = head
        var count = 0
        
        while count < index, node?.next != nil {
            node = node?.next
            count += 1
        }
        
        return node
    }
    
    func reverseLL() {
        var current =  head
        var prev: Node<Value>? = nil
        var next: Node<Value>?

        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        head = prev
    }
    
//    func reverseLL() {
//        var current = head
//        var prev: Node<Value>? = nil
//
//        while current !== nil {
//            let temp = current?.next
//            current?.next = prev
//            prev = current
//            current = temp
//        }
//
//        head = prev
//    }
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }

    return String(describing: head)
  }
}

func createLL1() {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    list.push(4)
    
    print(list.description)
}


public class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

func createLL() {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
}


// Tree

class TreeNode<Element> {
    var leftChild: TreeNode<Element>?
    var rightChild: TreeNode<Element>?
    var value: Element
   
    init(_ value: Element) {
        self.value = value
    }
    
    var hasVisited = false
    
   private var leavelDic: [Int:Bool] = [:]
    
    func treeTraverse1() {
        if !hasVisited {
            print(value)
        }
        hasVisited = true
        self.leftChild?.treeTraverse1()
        self.rightChild?.treeTraverse1()
    }
}


extension TreeNode: CustomStringConvertible {
    //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: TreeNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild,
                      bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
