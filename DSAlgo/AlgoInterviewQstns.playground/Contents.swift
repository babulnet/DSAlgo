import UIKit
import Darwin

var str = "Hello, playground"

//MARK: OLA
//N = 8 day
//Arr = [10, 21, 34, 25, 15, 40, 25, 35]

//1. Buy stock
//2. Sell all stocks
//3. Do nothing
//func maximizeProfit(partialrofilt: inout Int, list: [Int]) -> Int {
//
//    print(list)
//    if list.count < 2 {
//        return partialrofilt
//    }
//
//   // let profit
//    let sotedArray = list.sorted { (a, b) -> Bool in
//        a>b
//    }
//
//    print("max array is \(sotedArray) ")
//    let maximum = sotedArray[0]
//    guard let  maxIndex = list.firstIndex(of: maximum) else {
//        return partialrofilt
//    }
//
//    print("max index is \(maxIndex)")
//
//    print(maxIndex)
//    if list.count <= maxIndex {
//        return partialrofilt
//    }
//
//    for i in stride(from: 0, through: maxIndex, by: 1) {
//        let net = maximum - list[i]
//        partialrofilt = partialrofilt + net
//    }
//
//    let start = maxIndex + 1
//
//    if list.count <= start {
//        return partialrofilt
//    }
//
//    let secondArray = Array(list[start...  ])
//    print("secondArray is \(secondArray)")
//
//    return maximizeProfit(partialrofilt: &partialrofilt, list: secondArray)
//}
//
//
//
//let array = [100, 180, 260, 310, 40, 535, 695]
//
//var profit = 0
////maximizeProfit(partialrofilt: &profit, list: array)
//
////MARK: Walmart -1
//
//func checkIfArryIsSubset<T: Hashable> (array1: [T], array2: [T]) -> Bool {
//
//    if array2.count > array1.count {
//        return false
//    }
//
//    var isSubset = true
//    var dic: [T: Int] = [:]
//
//    for item in array1 {
//        dic[item, default: 0] += 1
//    }
//
//    for item in array2 {
//        if let _ = dic[item] {
//        } else {
//             isSubset = false
//        }
//    }
//
//    return isSubset
//}
//
//
//checkIfArryIsSubset(array1: [2,0,3], array2: [0,2])

//MARK: VIDA

func findMaxSubAarray(array: [Int]) -> Int {
    var currentSum = array[0]
    var actualSum = currentSum

    for item in array[1..<array.count] {
        currentSum = max(item, currentSum+item)
        actualSum = max(currentSum, actualSum)
    }

    return actualSum
}
//[-1,-2,-3,0,2,5,-1,-2,-5,9]
//[-1,-2,-3,3,-2,-5]

//findMaxSubAarray(array: [-1,-2,-3,0,2,5,-1,-2,-5,9])



//MARK: PAYPAL
//subarray with sum 0

func findSubArrayWithSumZero(arrray: [Int]) ->(Int,Int) {

    var dic: [Int:Int] = [:]
    var sum = 0
    dic[0] = -1

    for (key,value) in arrray.enumerated() {
        sum = sum + value
        print(dic)
        if let index = dic[sum] { // if a value is repeating in the dictinary, it means the sums in between those values are zero
            print("\(dic) ..yeahhh")
          return (index+1,key)
        }

        dic[sum] = key
    }

    return (-1,-1)
}
//[3,5,-1,-2,-1,-1]

findSubArrayWithSumZero(arrray: [1,-1,4,1,2,3,7,8,9] )
//
//// two elements with sum x in the array
//
//func findElementsWithSum(n:Int, array: [Int]) -> (Int,Int){
//    var dic:[Int:Int] = [:]
//    var sum = 0
//
//    for (key,item) in array.enumerated() {
//        sum = sum+item
//
//        print("\(sum)\n")
//
//        if let index = dic[sum-n] {
//            return (index+1,key)
//        }
//
//        dic[sum] = key
//        print(dic)
//
//
//    }
//
//   return (-1,-1)
//}
//
////findElementsWithSum(n: 29, array: [2,6,7,9,5,8])
//
//func printAllSubArrays(array: [Int]) {
//    for i in 0..<array.count {
//        for j in i..<array.count {
//            var sum = 0
//
//            for k in i...j {
//                print("\(array[k]) ")
//                sum = sum + array[k]
//            }
//             print("******")
//            print("sum is \(sum)")
//            print("\n")
//
//        }
//    }
//}
//
////printAllSubArrays(array: [1,2,3,4])
//
//func subArraySumsWithTwoLoops(array:[Int]) {
//    for i in 0..<array.count {
//        var sum = 0
//        for j in i..<array.count {
//            sum = sum + array[j]
//            print(sum)
//        }
//    }
//}
//
////subArraySumsWithTwoLoops(array: [1,2,3,4])
//
//
//func findSumZero(array: [Int]) -> (Int,Int) {
//
//    var dic: [Int:Int] = [:]
//    var sum = 0
//
//    for (key,item) in array.enumerated() {
//        sum = sum + item
//
//        if let index = dic[sum] {
//           return(index+1,key)
//        }
//
//        dic[sum] = key
//    }
//
//    return(-1,-1)
//}
//
////findSumZero(array: [1,3,2,3,1,-6,2])
//
//
//func maxSubArray(arr: [Int]) -> Int {
//    var sum = 0
//    var currentSum = 0
//    var prevSum = currentSum
//
//    for item in arr {
//        sum = sum + item
//        currentSum = max(sum, item)
//        prevSum = max(currentSum, prevSum)
//
//    }
//
//    return prevSum
//}
//
//
/////maxSubArray(arr: [1,-2,3,-4])
/////
/////
//func findTownJudge(_ n: Int, _ trust: [[Int]]) -> Int {
//
//    guard !(trust.isEmpty) else { return n == 1 ? 1 : -1 }
//
//    var map: [Int:Set<Int>] = [:] // trust hash
//    var nojudges: Set<Int> = []
//    var judge = -1
//
//    for arr in trust {
//        map[arr[1], default: []].insert(arr[0])
//        nojudges.insert(arr[0])
//        print(map)
//        if map[arr[1]]!.count == n - 1 { judge = arr[1] }
//    }
//
//    return !nojudges.contains(judge) ? judge : -1
//}
//
//func findTownJudge1(_ n:Int, _ array: [[Int]]) -> Int {
//    var dic: [Int:Set<Int>] = [:]
//    var noJudges: Set<Int> = []
//    var judge = -1
//
//    for item in array {
//        dic[item[1],default: []].insert(item[0])
//        noJudges.insert(item[0])
//        if dic[item[1]]?.count == n - 1 {
//            judge = item[1]
//        }
//    }
//
//    print(dic)
//    print(noJudges)
//
//    print(dic.keys)
//
//    if noJudges.contains(judge) {
//        return -1
//    } else {
//        return judge
//    }
//
//}
//
//findTownJudge1(3, [[1,3],[2,3]])
//
//let rr1 = [0,1,2,3]
//let rr2 = rr1.map { item -> [[Int]] in
//    var array1: [[Int]] = []
//    for i in 0...(rr1.count-1) {
//        array1.append([item,i])
//    }
//
//    return array1
//}
//
//rr2
//
//rr2[0]
//rr2[1]
//rr2[3]
//
//
//var arr = Array(repeating: Array(repeating: 0, count: 2), count: 3)
//
//func createMaze(n: Int) -> [[Int]] {
//    var arr: [[Int]] = []
//
//    for i in 0...n-1 {
//        for j in 0...n-1 {
//            arr.append([i,j])
//        }
//    }
//
//    return arr
//}
//
//
//let maze = createMaze(n: 5)
//maze[0]
//maze[5]
//maze[6]
//maze[8]
//maze[9]
//maze[10]
//
//func findRatPath(n:Int, bloacks:[[Int]]) {
//    print("*********************************** \n")
//    let maze = createMaze(n: n)
//    var answer: Set<[Int]> = [[0,0]]
//    findPath(point: maze[0], count: n, blocks: bloacks, answer: &answer)
//    print(answer)
//
//}
//
//func findPath(point: [Int],count:Int, blocks:[[Int]], answer:inout Set<[Int]>) -> Bool {
//    print("point is \(point) \n")
//    if (point[0] == count - 1 && point[1] == count - 1) {
//        print("The end***************\n")
//        print(answer)
//        return true
//    }
//
//    if isPointSafe(point: point, count: count, blocks: blocks) {
//
//    } else {
//        return false
//    }
//
//    let newXPoint = [point[0],point[1] + 1]
//    answer.insert(newXPoint)
//    print("New x point is \(newXPoint) \n")
//
//    let xSafe = findPath(point: newXPoint, count: count, blocks: blocks, answer: &answer)
//    if !xSafe {
//        answer.remove(newXPoint)
//        print("Removing  x point is \(newXPoint) \n")
//    }
//
//    let newYPoint = [point[0]+1,point[1]]
//    answer.insert(newYPoint)
//    print("New Y point is \(newYPoint) \n")
//
//    let ySafe = findPath(point: newYPoint, count: count, blocks: blocks, answer: &answer)
//
//    if  !ySafe {
//        answer.remove(newYPoint)
//        print("Removing  Y point is \(newYPoint) \n")
//    }
//
//    if !ySafe && !xSafe {
//        answer.remove(point)
//    }
//
//    return true
//}
//
//func isPointSafe(point: [Int], count:Int, blocks:[[Int]]) -> Bool {
//    print("is point Safe:  point is \(point) count is \(count) blocks are \(blocks) \n")
//    if (point[0] < count && point[1] < count && !blocks.contains(point)) {
//        return true
//    }
//
//    return false
//}
//
//
//findRatPath(n: 4, bloacks: [[0,1],[3,0],[2,1],[2,3]])
//
//
//let set1: Set<Int> = [1,2,3]
//let set2: Set<Int> = [3,2,1]
//set1.contains(4)
//
//set1 == set2
//
//
//let arr1 = [1,2,3]
//let arr2 = [3,2,1]
//arr2.contains(5)
//
//arr1 == arr2
//
//
//let firstString = "hi hello how are you"
//let secondString = "i know you are good"
//
//func findAllSubStrings(input: String)  -> [String] {
//    var subArrays: [String] = []
//    for i in 0..<input.count {
//        for j in 0..<input.count - i {
//            let startIndex = input.index(input.startIndex, offsetBy: i)
//            let endIndex = input.index(input.endIndex, offsetBy: -(j))
//           // guard startIndex <= endIndex else {return subArrays}
//            let ans = input[startIndex..<endIndex]
//            print("\(ans)\n")
//            subArrays.append("\(ans)")
//        }
//    }
//
//    return subArrays
//}
//
//
//let subArray1 = findAllSubStrings(input: firstString)
//
//let subArray2 = findAllSubStrings(input: secondString)
//
//let ans = subArray1.filter { str in
//    subArray2.contains(str)
//}
//
//ans
//
//let final = ans.max { str1, str2 in
//    str1.count < str2.count
//}
//
//
//
//
//// if difference is equal forwad diagonal and sum is equal backward diagonal
//func findlcs(firstString: String, secondString: String) -> Int {
//    var resultDic:[[Int]:Int] = [:]
//    print(resultDic)
//    var maximum = 0
//    var maxPoint: [Int] = []
//    var resultString = ""
//
//    for (i, iVal) in firstString.enumerated() {
//        for (j, jVal) in secondString.enumerated() {
//            if (iVal == jVal) {
//                print("1  ", terminator: "")
//
//                if i == 0 || j == 0 {
//                    resultDic[[i,j]] = 1
//                } else {
//                    if let prev = (resultDic[[i-1,j-1]]), prev > 0 {
//                        resultDic[[i,j]] = prev+1
//                        maximum = max(maximum, prev+1)
//
//                        if maximum > prev+1 {
//                            resultString = ""
//                            resultString.append(jVal)
//                        } else {
//                           maxPoint = [i,j]
//                            resultString.append(jVal)
//                        }
//                    } else {
//                        resultDic[[i,j]] = 1
//                    }
//                }
//
//            } else {
//                print("0  ", terminator: "")
//            }
//        }
//
//        print("\n")
//    }
//
//    print(maxPoint)
//    print(resultString)
//    return maximum
//
//   // print(arr)
//    //checkIfElementsAreDiagonal(m: firstString.count, n: secondString.count, arr: arr)
//
//}
//
//
//findlcs(firstString: firstString, secondString: secondString)
//
//
//
//func fibinacci(n: Int, dic: inout [Int:Int]) -> Int {
//    var result: Int
//
//    if let answer = dic[n] {
//        return answer
//    }
//
//    if (n == 1 || n == 0) {
//        result = 1
//    } else {
//        result = fibinacci(n: n-1, dic: &dic) + fibinacci(n: n-2, dic: &dic)
//    }
//
//    dic[n] = result
//    print("\(result)\n")
//    return result
//}
//
//var dic: [Int:Int] = [:]
//fibinacci(n: 8, dic: &dic)
//
//func factorial(_ n:Int) -> Int {
//    if n == 0 {
//        return 1
//    } else {
//        let result = (n * (factorial(n-1)))
//        print(result)
//        return result
//    }
//}
//
//
//factorial(4)
//
//
//func calculatefib(n: Int) {
//    let arr = [0,1,2,3,4,5,6,7,8]
//    var dic: [Int: Int] = [:]
//
//    let ans = fibNew(arr: arr, dic: &dic)
//    print("algo ans is = \(ans)")
//
//}
//
//func fibNew(arr: [Int], dic: inout [Int: Int]) -> Int {
//    if arr.count == 1 {
//        print("ayyo \(arr[0]) \n")
//        return arr[0]
//    } else {
//        let left = Array(arr[0..<arr.count/2])
//        let right = Array(arr[(arr.count/2)...])
//        let sum = fibNew(arr: left, dic: &dic) + fibNew(arr: right, dic: &dic)
//
//
//
//        return sum
//    }
//}
//
//calculatefib(n: 9)
