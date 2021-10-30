// Written by Tapash Mollick.

import UIKit

/*
 Find the index of a sorted rotated array element.
 Input: [4,5,1,2,3] & Index of element to be found 2
 Output: 3
 Expected Time Coplexity: O(log(n))
 */

var arr = [4,5,1,2,3]

func getIndex(_arr: [Int]) -> Int {
    for (idx, element) in arr.enumerated() {
    if element == 2 {
        return idx
    }
}
    return -1
}

//print(getIndex(_arr: arr))

//Time Complexity = O(n)
//Space Complexity = O(1)

/*
 [4,5,1,2,3]
 startIndex = 0
 endIndex = arr.count - 1 = 4
 middleIndex = (startIndex + endIndex) / 2 = 4/2 = 2
 middleElement = arr[middleIndex] = arr[2] = 1
 startElement = arra[startIndex] = arr[0] = 4
 endElement = arr[endIndex] = arr[4] = 3
 
 if middleElement == GivenElement { // 1 == 2 F
 return middleIndex
 }
 
 else if startElement < middleElement {//4 < 1 F
 
 if givenElement < middleElement && givenELement >= startElement {
 rightIndex = middleIndex - 1
 }
 
 else {
 leftIndex = middleIndex + 1
 }
 
 }
 
 else {
 
   if givenElement > middleElement && givenElement <= endElement { // 2 > 1 && 2 < = 3 {
  startIndex = middleIndex + 1
 }
 
 else {
 rightIndex = middleIndex -1
 }
 
 }
 [1]
 
 */

func getIndexOfGivenElement(_ arr: [Int], givenElement: Int) -> Int {
    var startIndex = 0
    var endIndex = arr.count - 1
    
    while startIndex <= endIndex {
        
        let middleIndex = Int((startIndex + endIndex) / 2)
        let middleElement = arr[middleIndex]
        let startElement = arr[startIndex]
        let endElement = arr[endIndex]
        
    if middleElement == givenElement { // 1 == 2 F
        return middleIndex
    }
    
    else if startElement < middleElement {//4 < 1 F
        if givenElement < middleElement && givenElement >= startElement {
            endIndex = middleIndex - 1
        }
        else {
            startIndex = middleIndex + 1
        }
    }
    
    else {
        if givenElement > middleElement && givenElement <= endElement { // 2 > 1 && 2 < = 3 {
            startIndex = middleIndex + 1
        }
        else {
            endIndex = middleIndex - 1
        }
    }
    }
    return -1
}

print(getIndexOfGivenElement([4,5,1,2,3], givenElement: 3))

// Time Complexity: O(log(n))
//Space Complexity: O(1)
