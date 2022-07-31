//
//  Heap.swift
//  Lessons2.0
//
//  Created by Babul Raj on 25/03/22.
//

import Foundation

class Heap: ObservableObject, CustomStringConvertible {
    @Published var heapArray: [Int] = []
    
    init() {
        var arr1 = [3,2,5,4,9,6]
        heapArray = arr1.heapSort()
    }
    var description: String {
        var str = ""
        for item in self.heapArray {
            str.append("\(item), ")
        }
        
        return str
    }
}

extension Array where Element: Comparable {
    
    
    mutating func heapSort() -> [Element] {
        self.heapify()
         print("****************************************************** \n")
        for ind in self.indices.reversed() {
            if ind < 1 {
                return self
            }
            
            swapAt(ind, 0)
            print("count is \(ind)\n")
            self.heapify(parentIndex: 0, upto: ind)
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
