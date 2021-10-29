// Written by Tapash Mollick.

import UIKit
/*
 Find the list of triplets which producess the target sum from an array of postive integer
 */

func findThreeNumberSum(_ array: inout [Int], targetSum: Int) -> [[Int]] {
    array.sort()
    var triplets: [[Int]] = []
    
    for i in 0..<array.count - 2 {
        var startIndex = i + 1
        var endIndex = array.count - 1
        debugPrint("\n i: \(i)    startIndex: \(startIndex)  endIndex:\(endIndex)")
        debugPrint("\n array[i]:   \(array[i])    array[startIndex]:   \(array[startIndex])    array[endIndex]:    \(array[endIndex])")
        while startIndex < endIndex {
            let actualSum = array[i] + array[startIndex] + array[endIndex]
            if actualSum == targetSum {
                triplets.append([array[i], array[startIndex], array[endIndex]])
                startIndex += 1
                endIndex -= 1
            }
            else if actualSum < targetSum {
                startIndex += 1
            }
            else if actualSum > targetSum {
                endIndex -= 1
            }
        }
    }
    return triplets
}

var arr = [12, 3, 4, 1, 6, 9, 17]
debugPrint(findThreeNumberSum(&arr, targetSum: 24))
debugPrint("**************************************")
var arr2 = [12, 3, 4, 1, 6, 9, 17]
debugPrint(findThreeNumberSum(&arr, targetSum: 25))

/// Time complexity: O(n^2)
///Space Complexity: O(n)

