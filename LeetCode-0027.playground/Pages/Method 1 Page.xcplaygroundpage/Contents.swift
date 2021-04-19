//: [Previous](@previous)

/*:
 # 方法一：双指针
 
 ## 思路
 
 和之前两道一样。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        var p1 = 0
        var p2 = 0
        while p2 < n {
            if nums[p2] != val {
                nums[p1] = nums[p2]
                p1 += 1
            }
            p2 += 1
        }
        return p1
    }
}

//: [Next](@next)
