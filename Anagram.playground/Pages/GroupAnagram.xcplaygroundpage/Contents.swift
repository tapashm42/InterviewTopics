//: [Previous](@previous)

import Foundation

/*
 Given an array of words, print all anagrams together.
 For example, if the given array is ["eat", "chair", "ate", "irach", "tea"], then output may be [["eat","tea","ate"], ["chair","irach"]
 */

func groupAnagrams(_ strings: [String]) -> [[String]] {
    
    var anagrams = [String: [String]]()
    
    for text in strings {
        let sortedString = String(text.sorted())
        
        if var arr = anagrams[sortedString] {
            arr.append(text)
            anagrams[sortedString] = arr
            continue
        }
        anagrams[sortedString] = [text]
    }
    
    let result: [[String]]  = anagrams.map { $0.value}
    return result
}

print(groupAnagrams(["eat", "chair", "ate", "irach", "tea"]))

