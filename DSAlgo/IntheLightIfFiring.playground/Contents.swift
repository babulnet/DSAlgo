import UIKit

var greeting = "Hello, playground"
extension String {
    public subscript(_ value: Int) -> Character? {
        guard value <= self.count, value >= 0 else {return nil}
        let stringindex = self.index(self.startIndex, offsetBy: value)
        let char = self[stringindex]
        
        return char
    }
}

class LNode {
    var next:LNode?
    var value: Int
   
    init(value: Int, next: LNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension LNode:CustomStringConvertible {
    var description: String {
        return "\(value) -> \(next?.description ?? "nil")"
    }
}

class LinkedList {
    var head: LNode?
    var tail: LNode?
    
    init(array:[Int]) {
        var prev: LNode? = nil
        for (index,i) in  array.enumerated() {
            let node = LNode(value: i)
            
            if index == 0 {
                self.head = node
            } else if index == array.count - 1 {
                self.tail = node
            }
            
            if let prev = prev {
                prev.next = node
            }
            
            prev = node
        }
    }
    func append(val:Int) {
//        var temp = head
//
//        while temp?.next != nil {
//            temp = temp?.next
//        }
//
//        let node = LNode(value: val)
//        temp?.next = node
        
        guard let tail = tail else {
            let node = LNode(value: val)
            self.head = node
            self.tail = node
            return
        }
        
        tail.next = LNode(value: val)
    }
    
    func push(val:Int) {
        if let head = head {
            let temp = head
            self.head = LNode(value: val)
            self.head?.next = temp
        }
    }
    
    func insert(value:Int,after: Int) {
        var temp = head
        while temp?.value != after {
            temp = temp?.next
        }
        
        let node = LNode(value: value, next: temp?.next)
        temp?.next = node
    }
    
    func swap(value1: Int,value2:Int) {
        var temp1 = head
       
        while temp1?.next?.value != value1 {
            temp1 = temp1?.next
        }
        
        var temp2 = head
       
        while temp2?.next?.value != value2 {
            temp2 = temp2?.next
        }
        
        let temp = temp1?.next
        let nt1 = temp1?.next?.next
        let nt2 = temp2?.next?.next
       
        temp1?.next = temp2?.next
        temp2?.next = temp
        
        temp2?.next?.next = nt2
        temp1?.next?.next = nt1
        
    }
    
    func swapIndex(index1: Int, index2:Int) {
        guard let node1 = getNodeFor(index: index1),let node2 = getNodeFor(index: index2) else {return}
        
        var current1 = head
        
        while current1?.next !== node1 {
            current1 = current1?.next
        }
        
        var current2 = head
        
        while current2?.next !== node2 {
            current2 = current2?.next
        }
        
        let temp = node1.next
        current1?.next = node2
        current2?.next = node1
        node1.next = node2.next
        node2.next = temp
    }
    
    func reverse() {
        var current = head
        var prev: LNode? = nil
        
        while current?.value != nil {
           let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
    
    func getNodeFor(index: Int) -> LNode? {
        var current = head
        var currentIndex = 0
        while currentIndex != index {
            current = current?.next
            currentIndex = currentIndex + 1
        }
        
        return current
    }
}

extension LinkedList:CustomStringConvertible {
    var description: String {
        return head?.description ?? ""
    }
}

let ll = LinkedList(array: [1,2,3,4,5])
ll.description
ll.append(val: 6)
ll.description
ll.push(val: 0)
ll.description

ll.insert(value: 99, after: 3)
    
ll.description
ll.swap(value1: 3, value2: 5)
ll.description
//ll.swap(value1: 99, value2: 4)
//ll.description

let ll2 = LinkedList(array: [0,1,2,3,4,5,6])
//ll2.reverse()

//ll2.swapIndex(index1: 3, index2: 4)


//Tree

class TreeNode {
    var value:Int
    var leftChild:TreeNode?
    var rightChild:TreeNode?
    var leavel = 0
    var hd = 0
    
    init(value:Int,left:TreeNode? = nil, right:TreeNode? = nil) {
        self.value = value
        self.leftChild = left
        self.rightChild = right
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

class Tree {
    var root: TreeNode
    var level: Int = -1

    init(root:TreeNode) {
        self.root = root
    }
    
    func traverseInOrder(node: TreeNode?) {
        guard let node = node else {
            return
        }

        print(node.value)
       
        traverseInOrder(node: node.leftChild)
        traverseInOrder(node: node.rightChild)
    }
    
    func printLeftView(node: TreeNode?) {
        guard let node = node else {
            return
        }
        if level < node.leavel {
            print(node.value)
            level = level + 1

        }
        node.leftChild?.leavel = node.leavel+1
        printLeftView(node: node.leftChild)
        node.rightChild?.leavel = node.leavel+1
        printLeftView(node: node.rightChild)

    }
    
    func printTopView() {
        
//        guard let node = node else {
//            return
//        }
//
//        if !hdarray.contains(hd) {
//            print(node.value)
//            hdarray.append(hd)
//        }
//
//        printTopView(node: node.leftChild, hd: hd-1)
//        printTopView(node: node.rightChild, hd: hd+1)
        var queue: [TreeNode] = []
        var hdArray:[Int] = []
        root.hd = 0
        queue.append(root)
        
        while queue.count > 0 {
            guard let node = queue.first else {return}
           
            if hdArray.contains(node.hd) {
               
            } else {
                print(node.value)
                hdArray.append(node.hd)

            }


            if let left = node.leftChild {
                left.hd = node.hd - 1
                queue.append(left)
            }
            
            if let right = node.rightChild {
                right.hd = node.hd + 1
                queue.append(right)
            }
            
            queue.removeFirst()
        }
     }
    
    func printLevelWise() {
        var queue: [TreeNode] = []
        queue.append(root)
        
        while queue.count > 0 {
            guard let first = queue.first else { return }
            print(first.value)
            
            queue.removeFirst()
            if let left = first.leftChild {
                queue.append(left)
            }
            
            if let right = first.rightChild {
                queue.append(right)
            }
        }
    }
    
    func heightOfTheTree(node: TreeNode?) -> Int {
        guard let node = node else {
            return -1
        }
        
        return max(heightOfTheTree(node: node.leftChild) + 1, heightOfTheTree(node: node.rightChild) + 1)

    }
}

extension Tree: CustomStringConvertible {
    var description: String {
        return self.root.description
    }
}

var testingTree1:TreeNode = {
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

let tree1 = Tree(root: testingTree1)
//tree1.description
///print(tree1.description)
//tree1.traverseInOrder(node: tree1.root)
//tree1.printLeftView(node: tree1.root)

//tree1.printTopView(node: tree1.root, hd: 0)
print("***********************")

//tree1.printTopView()
//tree1.printLevelWise()

//tree1.heightOfTheTree(node: tree1.root)


// Sorting


func bubbleSort( array: inout [Int]) {
    var small = 0
    for i in 0..<array.count {
        small = i
        for j in i..<array.count  {

            if array[j] < array[small] {
                small = j
            }
        }
        
        array.swapAt(i, small)
    }
}

var array = [9,8,7,6,5,4,3,2,1]
bubbleSort(array: &array)
array


func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {return array}
    let middle = array.count/2
    let left = mergeSort(array: Array(array[0..<middle]))
    let right =  mergeSort(array: Array(array[middle...]))
    print("left-\(left), right-\(right)")
    return merge(left: left, right: right)
}

func merge(left:[Int], right:[Int]) -> [Int] {
    var result: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    
    while left.count >  0 && right.count > 0, leftIndex < left.count, rightIndex < right.count  {
        if left[leftIndex] > right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex = leftIndex+1
        } else {
            result.append(right[rightIndex])
            rightIndex = rightIndex+1
        }
    }
    
    if leftIndex <= left.count - 1 {
        result.append(contentsOf: Array(left[leftIndex...]))
    }
    
    if rightIndex <= right.count - 1 {
        result.append(contentsOf: Array(right[rightIndex...]))
    }
    
    print(result)
    return result
}


//mergeSort(array: [1,2,3,4,5,6,7,8])

func binarySearch(array:[Int], item: Int, actualArray: [Int]) -> Int {
    guard  array.count > 1 else {return 0}
    let middle = array.count/2
    
    if array[middle] == item {
        return actualArray.firstIndex(of: item) ?? 0
    } else if item < array[middle] {
        return binarySearch(array: Array(array[0..<middle]), item: item, actualArray: actualArray)
    } else {
        return binarySearch(array: Array(array[middle...]), item: item, actualArray: actualArray)
    }
}

//let arr =  [1,2,3,4,5,6,7,8,9,10,11,12]
//binarySearch(array: arr, item: 2, actualArray: arr)

class HeapSorter {
    var array: [Int] = []
    
    init(array: [Int]) {
        self.array = array
    }
    
    func maxHeap() -> [Int] {
        for i in stride(from: (array.count/2)-1, through: 0, by: -1) {
            siftDown(index: i)
        }
        
        return array
    }
    
    func heapSort() -> [Int] {
         _ = maxHeap()
        
        for i in 0..<array.count {
            array.swapAt(0, array.count-1 - i)
            siftDown(index: 0, upto: (array.count-1) - i)
        }
        
        return array
    }
    
    private func getLeftChild(index: Int) -> Int {
        return (2*index) + 1
    }
    
    private func getRightChild(index: Int) -> Int {
        return (2*index) + 2
    }
    
    func siftDown(index: Int, upto: Int? = nil) {
        var parent = index
        
        while true {
            print("parent = \(parent)")
            var potentialPrant: Int?
            let left = getLeftChild(index: parent)
            let right = getRightChild(index: parent)
            
            print("left-\(left) right -\(right)")
            if (left < upto ?? array.count && array[parent] < array[left]) {
                potentialPrant = left
            }
            
            if (right < upto ?? array.count &&  array[potentialPrant ?? parent] < array[right]) {
                potentialPrant = right
            }
            
            print("potential parent = \(potentialPrant)")
            if let potential = potentialPrant {
                array.swapAt(parent, potential)
                parent = potential
            } else {
                return
            }
        }
    }
}

let hs = HeapSorter(array: [9,8,7,6,5,4,3,2,1])
//hs.heapSort()

class Algorithms {
    var dic: [Int:Int] = [:]
    
    func findFactorial(limit: Int) -> Int {
        guard limit > 0 else {return 1}
        
        return limit * findFactorial(limit: limit-1)
    }
    
    func fibinacci(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        
        if n <= 0 {
            return 0
        }
        
        if let sum = dic[n] {
            return sum
        }
        
        var rightSum: Int
        var leftSum: Int
        
        leftSum = fibinacci(n: n-1)
        rightSum = fibinacci(n: n-2)
        
        dic[n] = leftSum + rightSum
        return leftSum+rightSum
    }
    
    func maxSubArray(array: [Int]) -> Int {
        var prevSum = array[0]
        var actualSum = prevSum
        
        for i in 1..<array.count {
            let item = array[i]
            let sum = max(prevSum+item, item)
            prevSum = sum
            actualSum = max(prevSum, actualSum)
        }
        
        return actualSum
    }
    
    func findSubArrayWithSum(array:[Int], val:Int) -> [Int]? {
        var dicc: [Int:Int] = [0:-1]
        var sum = 0
        
        for (index,item) in array.enumerated() {
            sum = sum+item
            
            if let value = dicc[sum-val] {
                return Array(array[value+1..<index+1])
            }
                                   
           dicc[sum] = index
            print(dicc)
        }
        
        
        return nil
    }
}

//Algorithms().findFactorial(limit: 5)
//Algorithms().fibinacci(n: 7)
//
//Algorithms().maxSubArray(array: [-2,1,-3,4,-1,2,1,-5,4])
//Algorithms().findSubArrayWithSum(array: [1,2,3,4,5,-4,-5,8,9], val: 17)
            
class LeetCode {
    class LInkedListSum {
        
        func findSum(l1: LNode?, l2:LNode?) -> LNode? {
            
            //            guard let l1 = l1, let l2 = l2 else {return nil}
            //
            //            findSum(l1: l1.next, l2: l2.next, remonder: remonder)
            //            print("first",l1.value,"    second",l2.value)
            //            let sum = (l1.value+l2.value + rem)
            //            rem = sum/10
            //            let ans: Int = sum%10
            //            let node = LNode(value: ans, next: futureNode)
            //            futureNode = node
            //            print("ans",answer.appending("\(ans)"))
            var node1 = l1
            var node2 = l2
            var array1:[Int] = []
            var array2:[Int] = []
            var reminder = 0
            var futureNode: LNode?
            
            while (node1 != nil || node2 != nil) {
                if let val1 = node1?.value {
                    array1.append(val1)
                }
                
                if let val2 = node2?.value {
                    array2.append(val2)
                }
                
                node1 = node1?.next
                node2 = node2?.next
            }
            
            print(array1,array2)
            while ((array1.count > 0) || (array2.count > 0) || reminder != 0) {
                
                var val1: Int = 0
                var val2: Int = 0
                
                if array1.count > 0 {
                    val1 = array1.removeLast()
                }
                
                if array2.count > 0 {
                    val2 = array2.removeLast()
                }
                
                print("array1" ,array1)
                print("array2" ,array2)
                print(val1,val2,reminder)
                let sum = val1+val2+reminder
                
                
                let digit = sum%10
                reminder = sum/10
                let node = LNode(value: digit)
                node.next = futureNode
                futureNode = node
            }
            
            return futureNode
        }
    }
    
    class Solutions {
        func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
            var str1 = ""
            var str2 = ""
            
            str1 = word1.reduce("") { partialResult, str in
                partialResult.appending(str)
            }
            
            str2 = word2.reduce("") { partialResult, str in
                partialResult.appending(str)
            }
            
            return str1 == str2
        }
        
        func isPalindrome(_ x: Int) -> Bool {
            var num = x
            var rem = 0
            var newNum = 0
            
            while num > 0 {
                rem = num%10
                newNum = newNum*10 + rem
                num = num/10
            }
            
            return newNum == x
        }
        
        
        func longestCommonPrefix(_ strs: [String]) -> String {
            var firstWorkd = strs.first ?? ""
            for word in strs {
                //                guard let first = firstWorkd, first.count > 0 else {return ans}
                //                ans = getPrefix(str1: first, str2: word)
                //                firstWorkd = ans
                
                while !word.hasPrefix(firstWorkd), firstWorkd.count > 0 {
                    firstWorkd.removeLast()
                }
            }
            
            
            
            return firstWorkd
        }
        
        func getPrefix(str1: String, str2: String) -> String {
            var ans = ""
            var minLength = min(str1.count, str2.count)
            for i in 0..<minLength {
                if str1[i] == str2[i] {
                    let ss = String(str1[i] ?? Character(""))
                    ans.append(ss)
                } else {
                    break
                }
            }
            
            print("str1-1",str1, "str1-2",str2, "ans-",ans)
            return ans
        }
        
        var currentNode: LNode?
        
        func isPalindrome1(_ head: LNode?) -> Bool {
            currentNode = head
            return checkIfPali(head: head)
        }
        
        func checkIfPali(head: LNode?) -> Bool {
            
            guard let node = head else {return true}
            
            if !checkIfPali(head: node.next) {
                return false
            }
            
            print(node.value)
            print(currentNode?.value ?? 99)
            if node.value != currentNode?.value {
                return false
            }
            currentNode = currentNode?.next
            
            return true
        }
        
        func middleNode(_ head: LNode?) -> LNode? {
            currentNode = head
            return getMiddle(node:head)
        }
        
        func getMiddle(node: LNode?) -> LNode? {
            guard let node = node else {return nil}
            
            if getMiddle(node: node.next) != nil {
                return currentNode
            }
            
            if node === currentNode {
                print("came again?", node)
                return currentNode
            } else if node === currentNode?.next {
                print("final", node)
                currentNode = node
                return node
            }
            
            currentNode = currentNode?.next
            print("omg",currentNode)
            return nil
        }
        
        func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
            
            let ans =  mat.reduce(into: [Int]()) { partialResult, intArray in
                let sum = intArray.reduce(0) { partialResult, item in
                    partialResult + item
                }
                
                partialResult.append(sum)
            }
            
            let ordered = ans.enumerated().sorted { ele1, ele2 in
                ele1.element < ele2.element
            }.map { element in
                element.offset
            }
            
            return ordered.dropLast(mat.count - k)
        }
        
        func reverse(_ x: Int) -> Int {
            var ans = 0
            var num = x
            var rem = 0
            while num != 0 {
                rem = num%10
                print(rem)
                ans = ans*10 + rem
                num = num/10
                
            }
            
            return ans
        }
       
        
        func lengthOfLongestSubstring(_ s: String) -> Int {
            var currentLength = 0
            var prevLength = 0
            var charDic:[String:Int] = [:]
            
            for (index,char) in s.enumerated() {
                print(charDic)
                if let indexPresent = charDic[String(char)] {
                    print("present", indexPresent)
                    prevLength = max(prevLength, currentLength)
                    charDic = charDic.filter { element in
                        element.value > indexPresent
                    }
                    charDic[String(char)] = index
                    currentLength = charDic.count
                    
                } else {
                    currentLength += 1
                    charDic[String(char)] = index
                }
            }
            
            return max(prevLength, currentLength)
        }

        func longestPalindrome(_ s: String) -> String {
            var length = 0
            var start = 0
            var end = 0
           
            for (index,_ )in s.enumerated() {
                let len1 = getLength(s: s, left: index, right: index)
                let len2 = getLength(s: s, left: index, right: index+1)
                length = max(len1, len2)
                
                if length > (end - start) {
                    start = index - ((length-1)/2)
                    end = index + length/2
                }
            }
            
            let startAns = s.index(s.startIndex, offsetBy: start)
            let endAns = s.index(s.startIndex, offsetBy: end)
            
            
            return String(s[startAns...endAns])
        }
        
        func getLength(s:String, left: Int, right:Int) -> Int {
            var left = left
            var right = right
           
            while left >= 0 && right < s.count && s[left] == s[right]  {
                left -= 1
                right += 1
            }
            
            return  (((right - 1) - (left + 1)) + 1)
        }
        
        func getLCS(s1: String, s2: String) -> String {
            var matrixDic: [[Int]:Int] = [:]
            let s1 = s1
            let s2 = s2
            var maxLength: (length:Int,index:Int) = (0,0)
            for (index1,i) in s1.enumerated() {
                for (index2,j) in s2.enumerated() {
                    if i == j {
                        let diagonal = getDiagoNalElement([index1,index2])
                        let val = matrixDic[diagonal] ?? 0
                        matrixDic[[index1,index2]] = val + 1
                        print(val + 1, terminator: "   ")
                        maxLength.index =  (val+1 > maxLength.length ) ? index2 : maxLength.index
                        maxLength.length = max(maxLength.length, val+1)
                    } else {
                        print("*", terminator: "   ")
                    }
                }
                
                print("\n")
            }
            
            print(maxLength)
            let end = s2.index(s2.startIndex, offsetBy: maxLength.index)
            let start = s2.index(s2.startIndex, offsetBy: maxLength.index-(maxLength.length-1))
            return String(s2[start...end])
        }
        
        func getDiagoNalElement(_ input:[Int]) -> [Int] {
            
            let first = input[0]-1
            let second = input[1] - 1
            
            return [first,second]
        }
    }
}

//let ans = LeetCode.LInkedListSum().findSum(l1: LinkedList(array: [5,5,5]).head, l2: LinkedList(array: [4,5]).head)
//ans
//
//LeetCode.Solutions().isPalindrome(1221)
//LeetCode.Solutions().lengthOfLongestSubstring("pwwkew")
//let ans1 = LeetCode.Solutions().longestCommonPrefix(["aa","ab"])
//ans1


//LeetCode.Solutions().isPalindrome1(LinkedList(array: [1,2,3,2,1]).head)
//let ans = LeetCode.Solutions().middleNode(LinkedList(array: [1,2]).head)
//ans

//LeetCode.Solutions().kWeakestRows([[1,1,0,0,0],
//                                   [1,1,1,1,0],
//                                   [1,0,0,0,0],
//                                   [1,1,0,0,0],
//                                   [1,1,1,1,1]], 3)

//LeetCode.Solutions().reverse(-123)
//LeetCode.Solutions().longestPalindrome("xymallamkmalayalam")
LeetCode.Solutions().getLCS(s1: "kkkkkkbbnins", s2: "wwwwwwwwwwbb")

