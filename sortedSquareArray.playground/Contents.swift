// Written by Tapash Mollick.

import UIKit

///Find the sorted Square array from given sorted integer array.
/*
 Input : [1,2,3,4,5]
 Output: [1,4,9,16,25]
 
 Input: [-6, -5, 1, 3, 4]
 Output: [36,25,1,9,16]
 Expected Order: [1,9,16,25,36]
 */

let arr = [1,2,3,4,5]
let arr2 = [-6, -5, 1, 3, 4]

//********************  Brute force Solution  ****************************//

func findSortedSquare(_ arr:  [Int]) -> [Int] {
var arrSquare:[Int] = []

for element in arr {
    let square = element * element
    arrSquare.append(square)
}
    arrSquare.sort()
    return arrSquare
}

print(findSortedSquare(arr))
print(findSortedSquare(arr2))

//// TC = O(n) + O(nlogn) = O(nlogn)
/// SC = O(n)

//********************  Optimized Solution  ****************************//
func findOptimizedSortedSquare(_ arr:  [Int]) -> [Int] {
    var arrSquare:[Int] = Array(repeating: 0, count: arr.count)
    
    var smallIndex = 0
    var higestIndex = arr.count - 1
    
    for index in stride(from: arr.count - 1, through: 0, by: -1) {
        let smallestValue = abs(arr[smallIndex])
        let higestVlalue = abs(arr[higestIndex])
        
        if smallestValue > higestVlalue {
            let smallestSquare = smallestValue * smallestValue
            arrSquare[index] = smallestSquare
            smallIndex += 1
        }
        else {
            let hiegstSquareValue = higestVlalue * higestVlalue
            arrSquare[index] = hiegstSquareValue
            higestIndex -= 1
        }
    }
    return arrSquare
}

print(findOptimizedSortedSquare([-10,-9,-8,-7,-5,0,1]))
//// TC = O(n)
/// SC = O(n)


