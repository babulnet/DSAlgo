import UIKit

var greeting = "Hello, playground"


public class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
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

func basicSort(array:inout  [Int]) -> [Int] {
    for i in 0..<(array.count)  {
        print("i is \(i) \n")
        for j in 0..<(array.count - 1) - i {
            print("j is \(j) \n")
            if array[j] < array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
    
    return array
}

func basicSort1(array:inout  [Int]) -> [Int] {
    for i in 0..<(array.count)  {
        print("i is \(i) \n")
        var lowest = 0
        for j in 0..<(array.count - 1) - i {
            print("j is \(j) \n")
            if array[j] < array[lowest] {
                lowest = j
            }
        }
        
        print("lowest is \(lowest)")
        //if (lowest != array.count - i) {
            print("swapping between \(lowest) & \((array.count - 1) - i) \n")
            array.swapAt(lowest, ((array.count - 1) - i))
            print("\(array)\n")
       // }

    }
    
    return array
}


var arr = [1,2,3,4,5,6]
//let ans = basicSort1(array: &arr)
//ans

class BinaryNode {
    var value: Int
    var leftChild: BinaryNode?
    var rightChild : BinaryNode?
    
    init(value: Int) {
        self.value = value
    }
   
    func traverseInOrder() {
        print(self.value)
        self.leftChild?.traverseInOrder()
        self.rightChild?.traverseInOrder()
    }
}


var testingTree:BinaryNode = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let two = BinaryNode(value: 2)
    let three = BinaryNode(value: 3)
    let four = BinaryNode(value: 4)
    let five = BinaryNode(value: 5)
    let six = BinaryNode(value: 6)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    let ten = BinaryNode(value: 10)
    let eleven = BinaryNode(value: 11)
    let twelve = BinaryNode(value: 12)
    let thirteen = BinaryNode(value: 13)
    let fourteen = BinaryNode(value: 14)
    
    zero.leftChild = one
    zero.rightChild = two
    
    one.leftChild = three
    one.rightChild = four
    
    two.leftChild = five
    two.rightChild = six
    
    three.leftChild = seven
    three.rightChild = eight
    
    four.leftChild = nine
    four.rightChild = ten
    
    five.leftChild = eleven
    five.rightChild = twelve
    
    six.leftChild = thirteen
    six.rightChild = fourteen
    
    return zero
}()

//testingTree.traverseInOrder()


func binarySearch(array: [Int], searchItem: Int) -> Int {
    let middle = array.count/2
    print(middle)
    if searchItem == array[middle] {
        return array[middle]
    } else if searchItem < array[middle] {
        return binarySearch(array: Array(array[0..<middle]), searchItem: searchItem)
    } else {
        return binarySearch(array: Array(array[middle..<array.count]), searchItem: searchItem)
    }
}

let index = binarySearch(array: [1,2,3,4,5,6,7], searchItem: 5)
index


extension Array where Element: Comparable {
    mutating func heapSort() -> [Element] {
        for count in self.indices.reversed() {
            
            print("count is \(count)")
            if count < 1 {
                return self
            }
            
            self.swapAt(count, 0)
            heapify(parentIndex: 0, upto: count)
        }
        
        return self
    }
    
    mutating func heapify() {
        
        let n = (self.count/2) - 1
        
        for index in stride(from: n, through: 0, by: -1) {
            self.heapify(parentIndex: index)
        }
    }
    
    mutating func heapify(parentIndex: Int, upto: Int? = nil) {
        var parentIndex = parentIndex
        
        while true {
            
            let parent = self[parentIndex]
            print("lol parent\(parent)\n")
            let leftIndex = (2*parentIndex) + 1
            let rightIndex = (2*parentIndex) + 2
            var newParentIndex: Int?
            var bigger: Element?
            
            if leftIndex < upto ?? self.count {
                let leftChild = self[leftIndex]
                
                if leftChild > parent {
                    bigger = leftChild
                    newParentIndex = leftIndex
                }
            }
            
            if rightIndex < upto ?? self.count {
                let rightChild = self[rightIndex]
                
                if rightChild > bigger ?? parent {
                    bigger = rightChild
                    newParentIndex = rightIndex
                }
            }
            
            if let _ = bigger, let newIndex = newParentIndex {
                self.swapAt(parentIndex, newIndex)
                print("lol swapping between \(self[parentIndex]) & \(self[newIndex]) \n")
                parentIndex = newIndex
            } else {
                return
            }
        }
    }
}


var arr1 = [3,2,5,4,9,6]
//arr1.heapify()
arr1



class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        
        guard !(trust.isEmpty) else { return n == 1 ? 1 : -1 }
        
        var map: [Int:Set<Int>] = [:] // trust hash
        var nojudges: Set<Int> = []
        var judge = -1
        
        for arr in trust {
            map[arr[1], default: []].insert(arr[0])
            print("\(map) - map\n")
            nojudges.insert(arr[0])
            print("\(nojudges) - nojudges \n")
           
            if map[arr[1]]!.count == n - 1 { judge = arr[1] }
        }
        
        return !nojudges.contains(judge) ? judge : -1
    }
}

Solution().findJudge(3, [[1,3],[2,3]])

class TreeNode<Element> {
    var leftChild: TreeNode<Element>?
    var rightChild: TreeNode<Element>?
    var value: Element
    var hd: Int = 0 // Added for topview
   
    init(value: Element) {
        self.value = value
    }
    
    var leavel: Int?
    
   private var leavelDic: [Int:Bool] = [:]
    
    func treeTraverse1() {
        print(self.value)
        self.leftChild?.treeTraverse1()
        self.rightChild?.treeTraverse1()
    }
}

class BinaryTree<Element> {
    var root: TreeNode<Element>?
    var leavel = -1
    
    func printLeft(node: TreeNode<Element>?, level: Int) {
        guard let node = node else {return}
      
        if (self.leavel < level) {
            print("\(node.value) -  leavel = \(level) \n")
            self.leavel = level
        }
      
        printLeft(node: node.rightChild, level: level + 1)
        printLeft(node: node.leftChild, level: level + 1)
    }
    
    func printLeavelWise() {
        var queue: [TreeNode<Element>] = []
        guard let root = root else {
            return
        }
        
        queue.append(root)
        
        while queue.count > 0 {
            let current = queue.removeFirst()
            print(current.value)
            
            if let left = current.leftChild {
                queue.append(left)
            }
            
            if let right = current.rightChild {
                queue.append(right)
            }
        }
    }
    
    func printTopView() {
        var queue: [TreeNode<Element>] = []
        guard let root = root else {
            return
        }
        
        var hdMap: [Int: TreeNode<Element>] = [:]
        
        queue.append(root)
        
        while queue.count > 0 {
            let current = queue.removeFirst()
          
            if let k = hdMap[current.hd] {
                
            } else {
                print(current.value)
                hdMap[current.hd] = current
            }
            
            if let left = current.leftChild {
                left.hd = current.hd - 1
                queue.append(left)
            }
            
            if let right = current.rightChild {
                right.hd = current.hd + 1
                queue.append(right)
            }
        }
    }
    
    func heightOftree(node: TreeNode<Element>?) -> Int {
        guard let node = node else {return -1}
        
        let lh = heightOftree(node: node.leftChild)
        let rh = heightOftree(node: node.rightChild)
        
        if rh > lh {
            print("\(node)\n")
            print("\(rh)\n")
            return rh+1
        } else {
            print("\(node)\n")
            print("\(lh)\n")
            return lh + 1
        }
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


var testingTree1:TreeNode<Int> = {
    let zero = TreeNode(value: 0)
    let one = TreeNode(value: 1)
    let two = TreeNode(value: 2)
    let three = TreeNode(value: 3)
    let four = TreeNode(value: 4)
    let five = TreeNode(value: 5)
    let six = TreeNode(value: 6)
    let seven = TreeNode(value: 7)
    let eight = TreeNode(value: 8)
    let nine = TreeNode(value: 9)
    let ten = TreeNode(value: 10)
    let eleven = TreeNode(value: 11)
    let twelve = TreeNode(value: 12)
    let thirteen = TreeNode(value: 13)
    let fourteen = TreeNode(value: 14)
    
    zero.leftChild = one
    zero.rightChild = two
    
    one.leftChild = three
    one.rightChild = four
    
    two.leftChild = five
    two.rightChild = six
    
    three.leftChild = seven
    three.rightChild = eight
    
    four.leftChild = nine
    four.rightChild = ten
    
    five.leftChild = eleven
    five.rightChild = twelve
    
    six.leftChild = thirteen
    six.rightChild = fourteen
    
    return zero
}()


print(testingTree1.description)
let bt = BinaryTree<Int>()
bt.root = testingTree1
//bt.printLeft(node: bt.root, level: 0)
//bt.printTopView()
bt.heightOftree(node: bt.root)
