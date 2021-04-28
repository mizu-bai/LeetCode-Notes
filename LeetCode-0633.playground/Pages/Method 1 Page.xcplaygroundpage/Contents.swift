//: [Previous](@previous)

/*:
 # 方法一：双指针
 
 ## 思路
 
 创建两个变量 `min` 和 `max`，`min` 从 `0` 变大，`max` 从 `sqrt(c)` 变小，如果这两个数平方的和：
 
 * 等于 `c`，返回 `true`；
 * 大于 `c`，`max` 自减 `1`；
 * 小于 `c`，`min` 自增 `1`；
 
 当 `min > max` 时，退出循环，返回 `false`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(sqrt(c))`
 * 空间复杂度：`O(1)`
 
 */

import Foundation

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var min = 0
        var max = Int(sqrt(Double(c)))
        while min <= max {
            let sum = min * min + max * max
            if sum == c {
                return true
            }
            if sum > c {
                max -= 1
            } else {
                min += 1
            }
        }
        return false
    }
}

//: [Next](@next)
