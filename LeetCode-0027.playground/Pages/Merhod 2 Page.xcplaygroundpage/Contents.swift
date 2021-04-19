//: [Previous](@previous)

/*:
 # 方法二：函数式
 
 使用 `filter` 筛选。
 
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter({$0 != val})
        return nums.count
    }
}

//: [Next](@next)
