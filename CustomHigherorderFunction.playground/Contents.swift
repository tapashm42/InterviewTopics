import UIKit

/*
 Custom way of implementing Map function.
 */

let arr = [1,2]
arr.map {$0}

extension Array {
    
    func CustomMap<Transform>(_ transform: (Element) -> Transform) -> [Transform] {
        
        var result = [Transform]()
        forEach { element in
            result.append(transform(element))
        }
        return result
    }
    
    func CustomCompactMap<Transform>(_ transform: (Element) -> Transform?) -> [Transform] {
        
        var result = [Transform]()
        forEach { element in
            if let elem = transform(element) {
            result.append(elem)
            }
        }
        return result
    }
}

let values = [1, 2, 3, 4]
print(values.CustomMap{ $0 * 2})

let values2 = [1, 2, 3, 4, nil]
print(values2.CustomCompactMap{ $0})

