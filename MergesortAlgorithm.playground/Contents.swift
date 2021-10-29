// Written by Tapash Mollick.

import UIKit

func mergeSort(_ array: inout [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let middleIndex = Int(array.count / 2 )
    let leftHalf = Array(array[0..<middleIndex])
    let rightHalf = Array(array[middleIndex..<array.count])
    
    return mergesortHelper(leftHalf, rightHalf)
}

func mergesortHelper(_ leftHalf: [Int], _ rightHalf: [Int]) -> [Int] {
    var sortedArray = Array(repeating: 0, count: leftHalf.count + rightHalf.count)
    var k = 0, i = 0, j = 0
    
    while i < leftHalf.count, j < rightHalf.count {
        if leftHalf[i] <= rightHalf[j] {
            sortedArray[k] = leftHalf[i]
            i += 1
        }
        else {
            sortedArray[k] = rightHalf[j]
            j += 1
        }
        
        k += 1
    }
    
    while i < leftHalf.count {
        sortedArray[k] = leftHalf[i]
        i += 1
        k += 1
    }
    
    while j < rightHalf.count {
        sortedArray[k] = rightHalf[j]
        j += 1
        k += 1
    }
    return sortedArray
}

//Time Complexity = O(nlog(n))
//Space Complexity = O(nlog(n))
