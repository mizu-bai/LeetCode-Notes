//: [Previous](@previous)
/*:
 # 方法一：暴力法（会超时）
 
 ## 思路

「木桶原理」，每个位置能放多少水，是由两边最短的木板限制的。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n ^ 2)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count < 3 {
            return 0
        }
        var res = 0
        for i in 0 ..< height.count - 1 {
            let heightRight = height[i + 1 ..< height.count].max()
            let heightLeft = height[0 ... i].max()
            let h = min(heightRight!, heightLeft!) - height[i]
            if h > 0 {
                res += h
            }
        }
        return res
    }
}

//: [Next](@next)
