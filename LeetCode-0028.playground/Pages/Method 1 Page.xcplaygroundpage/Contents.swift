//: [Previous](@previous)

/*:
 # 方法一：调 Swift 的 String API
 
 */

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        if let range: Range = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        }
        return -1
    }
}

//: [Next](@next)
