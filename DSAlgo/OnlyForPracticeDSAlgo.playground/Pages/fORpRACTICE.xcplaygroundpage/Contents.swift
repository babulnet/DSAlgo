//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func mergeSort(arrray: [Int]) -> [Int] {
    guard arrray.count > 1 else {return arrray}
    
    let middle = arrray.count/2
    
    let left = mergeSort(arrray: Array(arrray[0..<middle]))
    let right = mergeSort(arrray: Array(arrray[middle...]))
    
    return merge(leftArray: left, rightArray: right)
}

func merge(leftArray: [Int],rightArray: [Int]) -> [Int] {
    
    var leftIndex = 0
    var rightqIndex = 0
    var result: [Int] = []
    
    while leftIndex < leftArray.count, rightqIndex<rightArray.count {
        if leftArray[leftIndex] < rightArray[rightqIndex] {
            result.append(leftArray[leftIndex])
            leftIndex += 1
        } else if rightArray[rightqIndex] < leftArray[leftIndex] {
            result.append(rightArray[rightqIndex])
            rightqIndex += 1
        } else {
            result.append(leftArray[leftIndex])
            result.append(rightArray[rightqIndex])
            leftIndex += 1
            rightqIndex += 1
        }
    }
    
    if leftIndex < leftArray.count {
        result.append(contentsOf: leftArray[leftIndex...])
    }
    
    if rightqIndex < rightArray.count {
        result.append(contentsOf: rightArray[rightqIndex...])
    }
    
    return result
}


mergeSort(arrray: [9,8,7,6,5,4,3,2,1])


class Heap {
    private var array: [Int] = []
   
    private func getChilderen(index: Int) -> (left: Int, right: Int) {
        let left = (2*index) + 1
        let right = (2*index) + 2
        
        return (left,right)
    }
   
    init(array: [Int]) {
        self.array = array
        for i in stride(from: (array.count/2)-1, through: 0, by: -1) {
            hepaify(index: i)
        }
    }
    
    func hepaify(index: Int, upto: Int? = nil) {
        var parent = index
        let upTo = upto ?? array.count
        
        while true {
            var potentialParent: Int? = nil
            let  leftIndex = getChilderen(index: parent).left
            let rightIndex = getChilderen(index: parent).right
             
            
            if ((leftIndex < upTo) && (array[parent] < array[leftIndex])) {
                potentialParent = leftIndex
            }
            
            if ((rightIndex < upTo) && (array[potentialParent ?? parent] < array[rightIndex])) {
                potentialParent = rightIndex
            }
            
            if let newParent = potentialParent {
                self.array.swapAt(parent, newParent)
                parent = newParent
            } else {
                return
            }
        }
    }
    
    func heapSort() {
        for i in array.indices {
            array.swapAt(0, (array.count - 1) - i)
            hepaify(index: 0, upto: (array.count - 1) - i)
        }
    }
}

let heap = Heap(array: [9,2,7,3,6,1,10,55,87,23,95,103,67])
heap.heapSort()


class LinkedListNode: CustomStringConvertible {
    var description: String {
        return ("\(self.value) -> \(String(describing: next?.description ?? ""))")
    }
    
    var value:Int
    var next: LinkedListNode?
    
    init(value: Int, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList11: CustomStringConvertible {
    var description: String {
        return self.head?.description ?? ""
    }
    
    var head: LinkedListNode?
    var tail: LinkedListNode?
    
    init(array: [Int]) {
        var prev: LinkedListNode?
        
        for item in array {
            if let _ = self.head {
                let new = LinkedListNode(value: item)
                prev?.next = new
                prev = new
            } else {
                let head = LinkedListNode(value: item)
                self.head = head
                prev = self.head
            }
        }
        
        self.tail = prev
    }
    
    
    
    func reverseLL() {
        var current = head
        var prev: LinkedListNode? = nil
      
        while current !== nil {
            let temp = current?.next
            current?.next = prev
            prev = current
            current = temp
        }
        
        self.head = prev
    }
}

let ll11 = LinkedList11(array: [1,2,3,4,5,6])
ll11.description
ll11.tail
ll11.head

ll11.reverseLL()
ll11.description



class TreeNode1: CustomStringConvertible {
    var value: Int
    var leftNode: TreeNode1?
    var rightNode: TreeNode1?
    
    init(value: Int, left: TreeNode1? = nil, right: TreeNode1? = nil) {
        self.value = value
        self.leftNode = left
        self.rightNode = right
    }
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: TreeNode1?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftNode == nil && node.rightNode == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightNode,
                       top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftNode,
                      bottom + "│ ", bottom + "└──", bottom + " ")
    }
}


class Tree1: CustomStringConvertible {
    var description: String {
        return self.head.description
    }
    
    var level = -1
    var head: TreeNode1
    
    init() {
        let zero = TreeNode1(value: 0)
        let one = TreeNode1(value: 1)
        let two = TreeNode1(value: 2)
        let three = TreeNode1(value: 3)
        let four = TreeNode1(value: 4)
        let five = TreeNode1(value: 5)
        let six = TreeNode1(value: 6)
        let seven = TreeNode1(value: 7)
        let eight = TreeNode1(value: 8)
        let nine = TreeNode1(value: 9)
        let ten = TreeNode1(value: 10)
        let eleven = TreeNode1(value: 11)
        let twelve = TreeNode1(value: 12)
        
        zero.leftNode = one
        zero.rightNode = two
        
        one.leftNode = three
        one.rightNode = four
        
        two.leftNode = five
        two.rightNode = six
        
        //three.leftNode = seven
        three.rightNode = eight
        
        four.leftNode = nine
        four.rightNode = ten
        
        five.leftNode = eleven
        
        eight.rightNode = twelve
        
        self.head = zero
    }
    
    func leftView(node: TreeNode1?, levelIn: Int = 0) {
        guard let node = node else {return}
       
        if self.level < levelIn {
            print(node.value)
            self.level = self.level + 1
        }
       
        leftView(node: node.leftNode, levelIn: levelIn+1)
        leftView(node: node.rightNode, levelIn: levelIn+1)
    }
    
    func heightOfTree(node: TreeNode1?) -> Int {
        guard let node = node else { return -1}
        
        return max(heightOfTree(node: node.leftNode)+1, heightOfTree(node: node.rightNode)+1)
    }
}


let treeee = Tree1()
treeee.head.description
print(treeee.head.description)
treeee.leftView(node: treeee.head)
treeee.heightOfTree(node: treeee.head)


