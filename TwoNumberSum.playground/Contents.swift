// Written by Tapash Mollick.

import UIKit

/*
 Find the two elements from the array which produces the target sum.
 
 Input:  Array [5,6,8,9,10], TargetSum = 13
 Output: [5,8]
 
 Input: [-1, -8, 10, 14, 3, -7], TargetSum = 13
 Output: [-1, 14]
 
 Time complexity is O(n)
 Space complexity is O(n)
 */

func findTwoNumberSum(_ array: inout [Int], targetSum: Int) -> [Int] {
    var hashMap: [Int: Bool] = [:]
    for item in array {
        let matchingElement = targetSum - item
        if let itemExists = hashMap[matchingElement], itemExists { ///for the 2nd time
            return [matchingElement,item]
        }
        else {/// First time onwards
             hashMap[item] = true
        }
    }
    return []
}

var array = [5,6,8,9,10]
debugPrint("two numbers are: \(findTwoNumberSum(&array, targetSum: 13))")

var array2 = [-1, -8, 10, 14, 3, -7]
debugPrint("\n two numbers are: \(findTwoNumberSum(&array2, targetSum: 13))")
