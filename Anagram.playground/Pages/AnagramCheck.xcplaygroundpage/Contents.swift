import UIKit

/*
 An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 Write a program to check whether two strings are anagram or not?
 
 Input: "eat", "tea"
 Output: true
 
 Input: "Ball", "allB"
 Output: true
 
 Input: "Ball", "allb"
 Output: false
 */

func isAnagram(for first: String, second: String) -> Bool {
    if first.count != second.count {
        return false
    }
    let (dict, dict2) = (findAppearenceOfCharacter(for: first), findAppearenceOfCharacter(for: second))
    return dict == dict2
}

func findAppearenceOfCharacter(for string: String)-> [Character: Int] {
    var hashMap: [Character: Int] = [:]
    for char in string {
        if let _ = hashMap[char] {
            hashMap[char]! += 1
        }
        else {
            hashMap[char] = 1
        }
    }
    return hashMap
}

print(isAnagram(for: "eat", second: "tea"))
print(isAnagram(for: "eat", second: "eatt"))
print(isAnagram(for: "Ball", second: "allb"))
