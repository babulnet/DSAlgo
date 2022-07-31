import UIKit
import os

var greeting = "Hello, playground"

public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public var description: String {
        return "\(self.val) -> \(self.next?.description ?? "")"
    }
}

class LL: CustomStringConvertible {
    var head: ListNode
    
    init(array: [Int]) {
        self.head = ListNode(array[0])
        var prev: ListNode = head
        
        for i in (1..<array.count) {
            let node = ListNode(array[i])
            prev.next = node
            prev = node
        }
    }
    
    var description: String {
        return self.head.description
    }
}
extension String {
    public subscript(_ value: Int) -> Character? {
        guard value <= self.count, value >= 0 else {return nil}
        let stringindex = self.index(self.startIndex, offsetBy: value)
        let char = self[stringindex]
        
        return char
    }
}

func justRandonShit(input: String) {
    for (index, _ ) in input.enumerated() {
        if input[index] == "l" {
           // print("next is \(input[index+1] ?? "blah")")
        }
    }
    
}

//justRandonShit(input: "i love you")

let sasa = "hi hello"
let ff = sasa.startIndex



class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
       if magazine.count <  ransomNote.count {return false}
        
        var dic: [Character:Int] = [:]
        
        for item in magazine {
            dic[item,default: 0] += 1
        }
        
        for item in ransomNote {
            if let count = dic[item], count > 0 {
                dic[item] = count - 1
            } else {
                return false
            }
        }
        
        return true
    }
}


class LCS {
    var first: String
    var second: String
    var valDic: [[Int]:Int] = [:]
    var maximum = 0
    var resultString = ""
    var maxPoint: [Int] = []
    init(first:String, second: String) {
        self.first = first
        self.second = second
        
        findLCS()
    }
    
    func findLCS() {
        for (firstIndex,iVal) in first.enumerated() {
            for (secondIndex, jVal) in second.enumerated() {
                if iVal == jVal {
                    let prev = getPrevValue(first: firstIndex, second: secondIndex)
                    valDic[[firstIndex,secondIndex]] = prev + 1
                    maximum = max(maximum, prev+1)
                    print("\(prev + 1)  ", terminator: "")
                    
                    if maximum > prev+1 {
                        resultString = ""
                        resultString.append(jVal)
                    } else {
                       maxPoint = [firstIndex,secondIndex]
                        resultString.append(jVal)
                    }
                } else {
                    print("0  ", terminator: "")
                }
            }
            
            print("\n")
         
        }
        
        
        print(maximum)
        print(resultString)
    }
    
    func getPrevValue(first: Int,second: Int) -> Int {
        if (first == 0 || second == 0 ) {
            return 0
        } else {
            return valDic[[first-1,second-1]] ?? 0
        }
    }
}

//LCS(first: "i love you ", second: "i loker you ")


class Solution1 {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let reduced =  mat.reduce(into: [Int]()) { partialResult, arrayInt in
            let sum = arrayInt.reduce(0) { partialResult, val in
                return partialResult + val
            }
            
            partialResult.append(sum)
        }
        
        let ans =  reduced.enumerated().sorted { item1, item2 in
            item1.element < item2.element
        }.map { item in
            item.offset
        }
        
        return ans.dropLast(ans.count - k)
    }
}

Solution1().kWeakestRows([[1,1,0,0,0],[1,1,1,1,0],[1,0,0,0,0],[1,1,0,0,0],[1,1,1,1,1]], 3)


class Solution2 {
    var steps = 0
   
    func numberOfSteps(_ num: Int) -> Int {
        if num == 0 {
            return steps
        }
        
        steps += 1
        if (num % 2 == 0) {
            return numberOfSteps(num/2)
        } else {
            return numberOfSteps(num-1)
        }
    }
}

Solution2().numberOfSteps(8)

class Solution3 {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        let reduced = accounts.reduce(into: [Int]()) { partialResult, item in
            partialResult.append(item.reduce(0) { partialResult, val in
                partialResult+val
           })
        }.max()
        
        return reduced ?? 0
    }
    
    func maximumWealth1(_ accounts: [[Int]]) -> Int {
        let reduced = accounts.compactMap { array in
            array.reduce(0, +)
        }
        
        return reduced.max() ?? 0
    }
}



Solution3().maximumWealth1([[1,2,3],[3,2,1]])

class Solution4 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (i,iVal) in nums.enumerated() {
            for (j,jVal) in nums.enumerated() {
                if i == j {break}
                if iVal+jVal == target {
                    return [i,j]
                }
            }
        }
        
        return []
    }
    
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int:Int] = [:]
        for (i,iVal) in nums.enumerated() {
            if let index = dic[iVal] {
                return [index,i]
            }
            
            dic[target-iVal] = i
        }
        
        return []
    }
}

let kk = Solution4().twoSum1([3,2,4], 6)

class Solution5 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var cn1 = l1
        var cn2 = l2
        var reminder = 0
        
        var prev: ListNode? = nil
        var head: ListNode? = nil
       
        while (cn1 != nil || cn2 != nil ) {
            let val1: Int = cn1?.val ?? 0
            let val2: Int = cn2?.val ?? 0
            
            let currentSum = (val1+val2+reminder)
            reminder = currentSum/10
            
            print(val1,val2,currentSum,reminder)
            let node = ListNode(currentSum%10)
            
            if prev == nil {
                head = node
            }
            
            print(node)
            prev?.next = node
            prev = node
            
            cn1 = cn1?.next
            cn2 = cn2?.next
        }
       
        if reminder > 0 {
           let node = ListNode(reminder)
            prev?.next = node
        }
        
        return head
    }
}

//let bb = Solution5().addTwoNumbers(LL(array: [9,9,9,9,9]).head, LL(array: [9,9,9]).head)


class Solution6 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var prev = 0
        var current = prev
        var subString = ""
        
        for (char) in s {
            if !subString.contains(char) {
                subString.append(char)
                current = max(prev, subString.count)
            } else {
                let start = subString.firstIndex(of: char) ?? subString.startIndex
                let next = subString.index(start, offsetBy: 1)
                subString = subString.substring(from: next)
                subString.append(char)
                prev = current
            }
        }
        
        return max(current, prev)
    }
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var set: [Int:Character] = [:]
        var i = 0
        var j = 0
        var answer = 0
        
        while j < s.count {
            if !set.values.contains(s[j] ?? Character("")) {
                set[j] = s[j]
                j += 1
                answer = max(answer, set.count)
            } else {
                set.removeValue(forKey: i)
                i += 1
            }
        }
       
        return answer
    }
}

let vv = Solution6().lengthOfLongestSubstring1("fxqabcdaefg")

class Solution7 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {return s}
        var strArray: [String] = []
        for i in (0..<s.count) {
            for j in stride(from: s.count-1, through: i, by: -1) {
                if (s[i] == s[j]) {
                    let start = s.index(s.startIndex, offsetBy: i)
                    let end = s.index(s.startIndex, offsetBy: j)
                    let range = start...end
                    let sub = String(s[range])
//                    print(sub)
//                    print("\n")
//
                    if checkForPali(sub) {
                        strArray.append(sub)
                        if ((j - i ) > (s.count - 1) - j) {
                            return strArray.sorted { a, b in
                                a.count > b.count
                            }.first ?? "blahh"
                        }
                        continue
                    }
                }
            }
            
        }
       
        return strArray.sorted { a, b in
            a.count > b.count
        }.first ?? "blahh"
    }
    
    func checkForPali(_ string: String) -> Bool {
        var ans = true
        for i in (0..<string.count) {
            if string[i] != string[(string.count - 1) - i] {
                return false
            }
        }
        
        return ans
    }
    
    var maximum = 0
    var index = 0
    var valDic: [[Int]:Int] = [:]

    func longestPalindrome1(_ s: String) -> String {
        for (i,iVal) in s.enumerated() {
            for (j,jVal) in s.reversed().enumerated() {
                if iVal == jVal {
                    let val = getPrevValue(first: i, second: j)
                    valDic[[i,j]] = val + 1
                    index = val+1 > maximum ? i : index
                    maximum = max(maximum, val + 1)
                    print("\(val + 1)",terminator: " ")
                } else {
                    print("0",terminator: " ")
                }
            }
            
            print("\n")
        }
        
        print(maximum,index)
        print(valDic)
        let end = s.index(s.startIndex, offsetBy: index)
        let start = s.index(s.startIndex, offsetBy: (index-maximum) + 1)
        let sub = s[start...end]
        return String(sub)
    }
    
    func getPrevValue(first: Int,second: Int) -> Int {
        if (first == 0 || second == 0 ) {
            return 0
        } else {
            return valDic[[first-1,second-1]] ?? 0
        }
    }
    
    func longestPalindrome2(_ s: String) -> String {
        var start = 0
        var end = 0
        
        for (index,_) in s.enumerated() {
            let len1 = getLength(string: s, left: index, right: index)
            let len2 = getLength(string: s, left: index, right: index+1)
            let len = max(len1, len2)
            
            if len > (end - start) {
               start = index - ((len-1)/2)
                end = index + (len/2)
            }
        }
        
        print(start,end)
        let start1 = s.index(s.startIndex, offsetBy: start)
        let end1 = s.index(s.startIndex, offsetBy: end)
        return String(s[start1...end1])
    }
    
    func getLength(string: String, left: Int,right: Int) -> Int {
        print(string,left,right)
        var left = left
        var right = right
        
        while(left >= 0 && right < string.count && string[left] == string[right]) {
            left = left - 1
            right = right + 1
        }
        
        print((right - left) - 1)
        return (right - left) - 1 // loop exist after incrimenting left and right so..
    }
}

//Solution7().longestPalindrome1("abcmalapqr")
//let bbbb = Solution7().longestPalindrome2("abba")

class Solution8 {
   func convert(_ s: String, _ numRows: Int) -> String {
       print("****************************")
        var dic: [Int:String] = [:]
      var  index = 0
       let s = NSString(string: s)
       
       var stringIndex = 0
       while index < s.length {
           var k = 0
           let limit = 2*numRows - 3
           
           while k <= (limit/2) + 1 && stringIndex < s.length {
               let s = s.substring(with: NSRange(location: stringIndex, length: 1))
               dic[k, default: ""].append(s)
               print("\n")
               k += 1
               stringIndex += 1
           }
    
           k = k-2
       
           while k>0 && stringIndex < s.length {
               let s = s.substring(with: NSRange(location: stringIndex, length: 1))
               dic[k, default: ""].append(s)
               k -= 1
               stringIndex += 1
           }
           
       
           index = index + 2*numRows - 2
       }
       
       print(dic)
        
       let ans = dic.sorted { $0.key <  $1.key}.reduce("") { partialResult, result in
            partialResult.appending(result.value)
        }
       
        return ans
    }
}

let sol = Solution8()
//let ans = sol.convert("PAYPALISHIRING", 4)


class Solution9 {
    func reverse(_ x: Int) -> Int {
        var val = x

        var reversed = 0
        
        while val != 0 {
            let rem = val%10
            val = val/10
            if(reversed > Int.max || (reversed == Int.max && rem > 7)) {
                return 0
            }
            
            if(reversed < Int.min || (reversed == Int.min && rem > -8)) {
                return 0
            }
            reversed = (reversed*10) + rem
        }
        
        return reversed
    }
}

let dsd = Solution9().reverse(-321)

class Solution10 {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var aP = 0
        var bP = height.count - 1
        
        while aP < bP {

            if height[aP] < height[bP] {
                print(aP,bP)
                maxArea = max(maxArea, height[aP] * (bP-aP))
                print("\n")
                print(maxArea)
                aP += 1
            } else {
                print(aP,bP)
                maxArea = max(maxArea, height[bP] * (bP-aP))
                print("\n")
                print(maxArea)
                bP -= 1
            }
        }
       
        return maxArea
    }
}


let cc =  Solution10().maxArea([1,8,6,2,5,4,8,3,7])

class Solution11 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var ref = strs.first ?? ""
        for item in strs {
            while !item.hasPrefix(ref) && ref.count > 0 {
                ref.removeLast()
            }
        }
        
        return ref
    }
}

let ansss = Solution11().longestCommonPrefix(["c","acc","ccc"])

class Dummy1 {
   var flag = 0
    func numberOfSteps(_ num: Int) -> Int {
        var n = num
        var count = 0
        while n != 0 {
            if n%2 == 0 {
                n = n/2
            } else {
                n = n - 1
            }
            
            count += 1
        }
        
        return count
    }
    
    func numberOfSteps1(_ num: Int) -> Int {
       
        if num == 0 {return flag}
        
        flag += 1

        if num%2 == 0 {
            numberOfSteps1(num/2)
        } else {
            numberOfSteps1(num-1)
        }
        
        return flag
    }
}


Dummy1().numberOfSteps1(14)

class Boom {
    
    func longestPalindrome(input: String) -> String {
        var length = 0
        var start = 0
        var end = 0
       
        for (i,_ )in input.enumerated()  {
            let l1 = self.getLength(string: input, left: i, right: i)
            let l2 = self.getLength(string: input, left: i, right: i+1)
            let maxLength = max(l1, l2)
            
            if maxLength > length {
                length = maxLength
                 start = i - ((length - 1) / 2)
                 end = i + (length/2)
            }
        }
        
        let startIndex = input.index(input.startIndex, offsetBy: start)
        let endIndex = input.index(input.startIndex, offsetBy: end)
        return String(input[startIndex...endIndex])
    }
    
    func getLength(string: String ,left: Int, right: Int) -> Int {
        print(left,right)
        var start = left
        var end = right
       
        while (start >= 0 && end < string.count && string[start] == string[end]) {
           start -= 1
            end += 1
        }
        
        print("start", start)
        print("end" , end)
        print((end - start) - 2)
        return (end - 1 - start - 1) + 1
    }
}

let ans = Boom().longestPalindrome(input: "cbbd")


class Solution12 {
    
    func sum3 (_ nums: [Int], _ target: Int) -> [[Int]] {
        var answer: [[Int]] = []
        for (_,item) in nums.enumerated() {
            let newArray = nums.filter { element in
                element != item
            }
            
            var bb = twoSum(newArray, target-item)
            guard bb.count>0 else {continue}
            bb.append(item)
          
            answer.append(bb.sorted())
        }
       
        let set: Set<[Int]> = Set(answer)
        return Array(set)
    }

     func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
         var dic: [Int:Int] = [:]
         
         for (index, item )in nums.enumerated() {
             
             if let index = dic[item] {
                 return [nums[index],item]
             } else {
                 dic[target-item] = index
             }
         }
     
         return []
     }
    
    func sum3sorted (_ nums: [Int], _ target: Int) -> [[Int]] {
        var answer: [[Int]] = []
        let sorted = nums.sorted()
        for index in 0..<sorted.count - 2 {
            if index>0,sorted[index] == sorted[index - 1] {
                continue
            }
            
            var low = index + 1
            var high = sorted.count - 1
            let sum = target - sorted[index]
            
            while low < high {
                if (sorted[low] + sorted[high] == sum) {
                    answer.append([sorted[index],sorted[low],sorted[high]])
                    while (low < high) && (nums[low] == nums [low+1]) {
                        low += 1
                    }
                    
                    while (low < high) && (nums[high] == nums [high-1]) {
                        high -= 1
                    }
                    
                    low += 1
                    high -= 1
                } else if sorted[low] + sorted[high] > sum {
                    high -= 1
                } else {
                    low += 1
                }
            }
        }
       
        return answer
    }
    
    func twoSumWithSorted(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.sorted()
        var low = 0
        var high = nums.count-1
        let sum = target
        var ans: [Int] = []
        
        while low < high {
            if (sorted[low] + sorted[high] == sum) {
                ans.append(contentsOf: [sorted[low],sorted[high]])
                while (low < high) && (nums[low] == nums [low+1]) {
                    low += 1
                }
                
                while (low < high) && (nums[high] == nums [high-1]) {
                    high -= 1
                }
                
                low += 1
                high -= 1
            } else if sorted[low] + sorted[high] > sum {
                high -= 1
            } else {
                low += 1
            }
        }
        
        return ans
    }
}


let sol12 = Solution12()
sol12.sum3sorted([34,55,79,28,46,33,2,48,31,-3,84,71,52,-3,93,15,21,-43,57,-6,86,56,94,74,83,-14,28,-66,46,-49,62,-11,43,65,77,12,47,61,26,1,13,29,55,-82,76,26,15,-29,36,-29,10,-70,69,17,49], 0)
//sol12.twoSumWithSorted([-3,-2,-3,-1,0,1,2,3], 0)

//sol12.twoSum(<#T##nums: [Int]##[Int]#>, <#T##target: Int##Int#>)
