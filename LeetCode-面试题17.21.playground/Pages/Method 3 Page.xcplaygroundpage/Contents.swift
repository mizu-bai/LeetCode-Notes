//: [Previous](@previous)

/*:
 # 方法三：双指针
 
 ## 思路
 
 分别使用两个指针 `left` 和 `right` 指向左右两个端点的柱子。另外分别记录左右两个指针遇到过的最高的柱子。
 
 双指针移动的思想就是看 `left` 和 `right` 两个柱子哪个更矮，因为蓄水时的瓶颈是更矮的柱子，而更高的柱子其实是不用考虑的。所以每次把更矮的那个柱子向中间移动。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        if n < 3 {
            return 0
        }
        var left = 0
        var right = n - 1
        var heightLeft = 0
        var heightRight = 0
        var res = 0
        while left < right {
            if height[left] < height[right] {
                if height[left] < heightLeft {
                    res += heightLeft - height[left]
                } else {
                    heightLeft = height[left]
                }
                left += 1
            } else {
                if height[right] < heightRight {
                    res += heightRight - height[right]
                } else {
                    heightRight = height[right]
                }
                right -= 1
            }
        }
        return res
    }
}

//: [Next](@next)
