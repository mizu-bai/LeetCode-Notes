//: [Previous](@previous)

/*:
 # 方法一：另一种形式
 
 可读性降低版本（函数式）
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        nums.map({dict[$0] = (dict[$0] ?? 0)! + 1})
        return dict.filter({$0.1 == 1}).map({$0.0}).first!
    }
}

//: [Next](@next)
