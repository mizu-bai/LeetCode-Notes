//: [Previous](@previous)

/*:
 # 方法一：暴力
 
 ## 思路
 
 暴力遍历，会超时。
 
 ## 复杂度
 
 * 时间：`O(n ^ 2)`
 * 空间：`O(1)`
 */

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0] ^ nums[0]
        }
        var res = Int.min
        for i in 0 ..< n {
            for j in i ..< n {
                res = res < nums[i] ^ nums[j] ? nums[i] ^ nums[j] : res
            }
        }
        return res
    }
}

//: [Next](@next)
