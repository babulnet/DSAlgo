import UIKit

//#MARK: Tree

 class TreeNode<Element> {
    var leftChild: TreeNode<Element>?
    var rightChild: TreeNode<Element>?
    var value: Element
     var hd: Int = 0
    
    
    
     init(value: Element) {
        self.value = value
    }
     
     func traverseInOrder() {
         print(self.value)
         self.leftChild?.traverseInOrder()
         self.rightChild?.traverseInOrder()
     }
   
}

class Tree  {
    var root: TreeNode<Int>
    var level: Int = -1
    
    init(root: TreeNode<Int>) {
        self.root = root
    }
    
    func printLeft(inLevel: Int, node: TreeNode<Int>?) {
        guard let node = node else {return}
        
        if self.level < inLevel {
            print(node.value)
            self.level = inLevel
        }
        
        printLeft(inLevel: inLevel+1, node: node.leftChild)
        
        printLeft(inLevel: inLevel+1, node: node.rightChild)
    }
    
    func printlevelWise() {
      
        var array:[TreeNode<Int>] = []
        array.append(root)

        while array.count > 0 {
            
            guard let node = array.first else {return}
            print(node.value)
            array.removeFirst()
            
            if let left = node.leftChild {
                array.append(left)
            }
            
            if let right = node.rightChild {
                array.append(right)
            }
        }
    }
    
    func printTopView() {
        var queue: [TreeNode<Int>] = []
        queue.append(root)
        root.hd = 0
        var hdDic: [Int] = []
        
        while queue.count > 0 {
            guard let item = queue.first else {return}
            
            if hdDic.contains(item.hd) {
            } else {
                print(item.value)
            }
            
            hdDic.append(item.hd)
            queue.removeFirst()
            
            if let left = item.leftChild {
                queue.append(left)
                left.hd = item.hd - 1
            }
            
            if let right  = item.rightChild {
                queue.append(right)
                right.hd = item.hd + 1
            }
        }
    }
    
    func heightOfTree(root: TreeNode<Int>?) -> Int {
        guard let root = root else {return -1 }
        let leftHeight = heightOfTree(root: root.leftChild)
        let rightHeight = heightOfTree(root: root.rightChild)
        
        return max(leftHeight + 1, rightHeight + 1)
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
    
    let fifteen = TreeNode(value: 15)
    let sixteen = TreeNode(value: 16)
    
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
    
    seven.rightChild = fifteen
    fifteen.rightChild = sixteen
    
    return zero
}()

print(testingTree1.description)
//testingTree1.traverseInOrder()
let tree = Tree(root: testingTree1)
//tree.printLeft(inLevel: 0, node: tree.root)
//tree.printlevelWise()
//tree.printTopView()
//tree.heightOfTree(root: tree.root)

var arr = [2,8,3,5,9,7,4]

func sortArray( array: inout [Int]) {
    var freq = 0
    for i in 0..<array.count {
        var temp = i

        for j in i..<array.count {
            freq += 1
            print(freq)
            if array[j] < array[temp] {
                temp = j
            }
        }
        
        array.swapAt(temp, i)
    }
}

//sortArray(array: &arr)

func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else {return arr}
    let middle = arr.count/2
   // print("middle is \(middle)\n")
    let left = mergeSort(arr: Array(arr[0..<middle]))
    let right = mergeSort(arr: Array(arr[middle...]))
    return merge(left: left, right: right)
}

func merge(left:[Int],right:[Int]) -> [Int] {
    print("left Array is \(left)\n")
    print("\n")
    print("right Array is \(right)\n")
    print("\n")
    var result: [Int] = []
    
    var leftIndex = 0
    var rightIndex = 0
    
    while (leftIndex < left.count && rightIndex < right.count) {
       // print("loooool")
       
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
           /// print("leftIndex is \(leftIndex)\n")
        } else if right[rightIndex] < left[leftIndex]  {
            result.append(right[rightIndex])
            rightIndex += 1

        } else {
            result.append(left[leftIndex])
            result.append(right[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
   // print("leftIndex is \(leftIndex)\n")
   // print("rigghtIndex is \(rightIndex)\n")
   
    if leftIndex < left.count {
       // print("leftIndex less that left count \(left.count)\n")
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
       // print("rightIndex less that right count \(right.count)\n")
        result.append(contentsOf: right[rightIndex...])
    }
    
    print("return result is \(result)\n")
    return result
}

//let haha = mergeSort(arr: [2,1,4,3,6,5])
//print(haha)


func binarySearch(arr: [Int], item: Int) -> Int {
    guard arr.count > 1 else {return arr[0]}
    
    let middle = arr.count/2
    
    if item == arr[middle] {
        return item
    } else if item < arr[middle] {
        return binarySearch(arr: Array(arr[0..<middle]), item: item)
    } else {
        return binarySearch(arr: Array(arr[middle...]), item: item)
    }
}

//binarySearch(arr: [2,4,6,10,18,25], item: 25)



// lINKED lIST

class LNode {
    var value: Int
    var next: LNode?
    
    init(value: Int, next: LNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension LNode: CustomStringConvertible {
    var description: String {
        guard let next = self.next else {
            return "\(self.value)"
        }
        return "\(self.value) -> \(String(describing: next.description))"
    }
}

class LinkedList {
    var head: LNode?
    var tail: LNode?
    
    func getNodeWith(value: Int) -> LNode? {
        var start = head
        while start?.value != nil {
            guard let valueLoc = start?.value else {return nil}
            print(valueLoc)
            if (valueLoc == value) {
                break
            }
            
            start = start?.next
        }
        
        return start
    }
    
    init(_ array:[Int]) {
        var prev: LNode?
       
        for item in array {
            if let _ = head {
                let new = LNode(value: item)
                prev?.next = new
                prev = new
            } else {
                self.head = LNode(value: item)
                prev = self.head
            }
        }
        
        self.tail = prev
    }
    
    func append(_ item: Int) {
        guard let _ = self.tail else {
            let new = LNode(value: item)
            self.head = new
            self.tail = self.head
            
            return
        }
        
        let new = LNode(value: item)
        self.tail?.next = new
        self.tail = self.tail?.next
    }
    
    func push(item: Int) {
        guard let _ = head else {
            self.head = LNode(value: item)
            self.tail = self.head
            return
        }
        
        let new = LNode(value: item, next: self.head)
        self.head = new
    }
    
    func insert(item: Int, after: Int) {
        guard let node = getNodeWith(value: after) else {return}
        
        let newnode = LNode(value: item, next: node.next)
        node.next = newnode
    }
    
    func swap(_ item1: Int, _ item2: Int) {
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
    
    func reverseLL() {
        var current = head
        var prev: LNode? = nil
        
        while current !== nil {
            let temp = current?.next
            current?.next = prev
            prev = current
            current = temp
        }
        
        head = prev
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        return head?.description ?? "list is empty"
    }
}


let l1 = LinkedList([1,2,3,4,5,6,7,8])
l1.description
l1.append(9)
l1.description
l1.push(item: 0)
//l1.insert(item: 20, after: 7)
l1.tail
l1.head

l1.description

l1.reverseLL()
//l1.description

class HeapSorter {
    var array: [Int] = []
    var compare: (Int,Int)->(Bool)
   
    init(_ array :[Int], compare:@escaping (Int,Int)->(Bool)) {
        self.array = array
        let leaf = (array.count/2) - 1
        self.compare = compare
       
        for index in stride(from: leaf, through: 0, by: -1) {
            self.hepify(index: index)
        }
        
        for i in (0..<array.count) {
            self.array.swapAt(0, (array.count - 1) - i)
            self.hepify(index: 0, upto: (array.count - i) - 1)
        }
    }
    
    private func hepify(index: Int, upto: Int? = nil) {
        var parent = index
        let upTo  = upto ?? array.count
        while true {
            let children = getChildren(of: parent)
            var potentialParent: Int? = nil
            let leftIndex = children.left
            let rightIndex = children.right
            
            
            if (leftIndex < upTo) && compare(array[leftIndex],array[parent]) {
                potentialParent = leftIndex
            }
            
            if (rightIndex < upTo) && compare(array[rightIndex],array[potentialParent ?? parent]) {
                potentialParent = rightIndex
            }
            
            if let newParent = potentialParent {
                array.swapAt(parent, newParent)
                parent = newParent
            } else {
                return
            }
        }
    }
    
    private func getChildren(of index: Int) -> (left: Int, right: Int) {
        
        let left = (2*index) + 1
        let right = left + 1
        
        return (left,right)
    }
}
let sortter = HeapSorter([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], compare: >)
print(sortter.array)

func getChildern(arr:[Int],index:Int,upto: Int) -> (leftChild:Int?,rightChild:Int?) {
    var left: Int?
    var right:Int?
   
    if (2*index)+1 < upto {
         left = arr[(2*index)+1]
    }
    
    if (2*index)+2 < upto {
         right = arr[(2*index)+2]
    }
    
    return (left,right)
}

func getChildernIndices(arr:[Int],index:Int) -> (leftIndex:Int,rightIndex:Int) {
 
    return ((2*index)+1,(2*index)+2)
}

func maxHeap(array: inout [Int]) {
    for i in stride(from: (array.count/2)-1, through: 0, by: -1) {
        print("i is \(i)" )
        heapify(arr: &array, index: i, upto: array.count)
    }
}

func heapify(arr: inout [Int], index:Int, upto: Int) {
    
    var rootIndex = index
    print("index is \(index)" )
    
    while true {
        
        var parentIndex: Int? = nil
        let root = arr[rootIndex]
        print("root element is \(root)" )
        let leftindex = getChildernIndices(arr: arr, index: rootIndex).leftIndex
        let righrIndex = getChildernIndices(arr: arr, index: rootIndex).rightIndex
        
        if let  leftChild = getChildern(arr: arr, index: rootIndex, upto: upto).leftChild {
            if root < leftChild {
                parentIndex = leftindex
            }
        }
        
        if let rightChild = getChildern(arr: arr, index: rootIndex, upto: upto).rightChild {
            
            if arr[parentIndex ?? rootIndex] < rightChild {
                parentIndex = righrIndex
            }
        }
        
        if let parentIndexActual = parentIndex {
            arr.swapAt(parentIndexActual, rootIndex)
            rootIndex = parentIndexActual
            print("swapped - newrootIndex is \(rootIndex)")
        } else {
            return
        }
    }
}

var array1 = [6,3,8,5,4,0,1]
//maxHeap(array: &array1)

func heapSort(array: inout [Int]) {
    maxHeap(array: &array)
    
    for i in 0..<array.count {
        array.swapAt(0, (array.count-1)-i)
        heapify(arr: &array, index: 0, upto: ((array.count)-i)-1)
    }
}

//heapSort(array: &array1)








func findFactorial(n: Int) -> Int {
    if n < 1 {
        return 0
    } else {
        return findFactorial(n: n-1) + n
    }
}

//findFactorial(n: 5)


func fibinacci(n: Int) -> Int {
    if (n < 0) {
       return 0
    }
    
    if (n == 1) {
        return 1
    }
    
    return (fibinacci(n: n-1) + fibinacci(n: n-2))
}

fibinacci(n: 6)

func fibinacci(n: Int, dic: inout [Int:Int]) -> Int {
    var result: Int

    if let answer = dic[n] {
        return answer
    }
    
    if (n < 0) {
       return 0
    }
    
    if (n == 1) {
        return 1
    }
       
    result = fibinacci(n: n-1, dic: &dic) + fibinacci(n: n-2, dic: &dic)

    dic[n] = result
    print("\(result)\n")
    return result
}


var dic: [Int:Int] = [:]
fibinacci(n: 6, dic: &dic)


func facorialWithLoop(n: Int) -> Int {
    var result = 1
   
    for i in 1...n {
        result = result+i
    }
    
    return result
}

//facorialWithLoop(n: 10)

func checkIfSubset(arr1: [Int], arr2: [Int]) -> Bool {
    if arr2.count > arr1.count {return false}
    
    var dic: [Int:Int] = [:]
    
    for item in arr1 {
        dic[item,default: 0] += 1
    }
    
    print(dic)
    
    for item in arr2 {
        if let _ = dic[item] {
            
        } else {
            return false
        }
    }
    
    return true
}

//checkIfSubset(arr1: [1,2,3,4,3], arr2: [1,2,3,3,3])

func maximumSubArray(arr: [Int]) -> Int {
    var sum = arr[0]
    var prevSum = sum
    
    for item in arr[1..<arr.count] {
            sum = max(item, sum+item)
            prevSum = max(sum, prevSum)
    }
    
    return prevSum
}

maximumSubArray(arr: [-1,-2,-3,0,2,5,-1,-2,-5,9])

func findSubArrayWithSumZero(array: [Int]) -> (Int,Int)? {
    var sumDic: [Int:Int] = [:]
    sumDic[0] = -1
    var sum = 0
    
    for (index,item) in array.enumerated() {
        sum = sum + item
        
        
        if let startIndex = sumDic[sum] {
            return (startIndex + 1,index)
        }
        
        sumDic[sum] = index
    }
    
    return nil
}

findSubArrayWithSumZero(array: [3,-1,-2,8,2,3,7,8,9])


func findFactoria1l(n: Int) -> Int {
    if (n == 0) {return 1}
    
    return findFactoria1l(n: n-1)*n
}


//findFactoria1l(n: 5)

func findSubArrayWithSum(array: [Int], sum: Int) -> (Int,Int)? {
    guard array.count > 0 else {return nil}
    
    var sumDic: [Int:Int] = [:]
    var sumLoc = 0
    sumDic[0] = -1
    
    for (index,item) in array.enumerated() {
        sumLoc = sumLoc+item
       
        if let startIndex = sumDic[sumLoc-sum] {
            return (startIndex+1,index)
        }
        
        sumDic[sumLoc] = index
        print(sumDic)
    }
    
    return nil
}

//findSubArrayWithSum(array: [0,2,4,6,9,11,12], sum: 6)


let arrayyy = [1,2,3,4,5,6]

func findAllSubArrays(array: [Int]) -> Int {
    var prevSum: Int = array[0]
    for i in (0..<array.count) {
        for j in (i..<array.count) {
           // let array = Array(array[i...j])
            var sum = 0
           
            for item in array {
                sum = sum + item
            }
            
            prevSum = max(sum, prevSum)
           // print("\(array) - sum = \(sum)")
            print(array[j])
        }
    }
    
    return prevSum
}

findAllSubArrays(array: arrayyy)

func findMaxSumIn(array: [Int]) -> Int {
    var sum = array[0]
    var prevSum = sum
    
    for item in Array(array[1..<array.count]) {
        if ((sum + item) < item) {
            sum = item
            prevSum = max(prevSum, item)
        } else {
            sum = sum + item
            prevSum = max(sum, prevSum)
        }
    }
    
    return prevSum
}

findMaxSumIn(array: arrayyy)


func findAllSubStrings(input: String) {
    for i in 0..<input.count {
        for j in 0..<input.count - i {
            
        }
    }
}
