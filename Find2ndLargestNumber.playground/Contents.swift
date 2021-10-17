// Written by Tapash Mollick.

import UIKit

/*
 Find the second largest number from a given array.
 
 Input:  [5,6,8,9,10]
 Output: 9
 
 Input: [-10, -8, -1, 3, -7]
 Output: -1
 
 Time complexity is O(n)
 Space complexity is O(1)
 */

func findSecondLargest(for array: [Int]) -> Int {
    var firstLargest = Int.min
    var secondLargest = Int.min
    
    for element in array {
        if element > firstLargest {
            secondLargest = firstLargest
            firstLargest = element
        }
        else if element > secondLargest && element != firstLargest {
            secondLargest = element
        }
    }
    return secondLargest
}

let array = [5,6,8,9,10]
debugPrint("Second largest Number: \(findSecondLargest(for: array))")
let array2 = [-10, -8, -1, 3, -7]
debugPrint("\nSecond largest Number: \(findSecondLargest(for: array2))")
let array3 = [9,5,6,8,9,10,5]
debugPrint("Second largest Number: \(findSecondLargest(for: array3))")
let array4 = [-10, -8, -1, 3, -7, -1]
debugPrint("\nSecond largest Number: \(findSecondLargest(for: array4))")
let array5 = [-10, -8, -1, -7, -13]
debugPrint("\nSecond largest Number: \(findSecondLargest(for: array5))")
