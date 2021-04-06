//: [Previous](@previous)

/*:
 # 方法二：动态规划
 
 ## 思路
 
 先提前遍历一次，求出每个位置左右最高的木板，把结果保存到数组里，避免在求接雨水的 `for` 中计算高度了。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        if n < 3 {
            return 0
        }
        var heightLeft = [Int](repeating: 0, count: n)
        heightLeft[0] = height[0]
        var heightRight = [Int](repeating: 0, count: n)
        heightRight[n - 1] = height[n - 1]
        for i in 1 ..< n {
            heightLeft[i] = max(heightLeft[i - 1], height[i])
        }
        for i in (0 ..< n - 1).reversed() {
            heightRight[i] = max(heightRight[i + 1], height[i])
        }
        var res = 0
        for i in 1 ..< n {
            let h = min(heightRight[i], heightLeft[i]) - height[i]
            if h > 0 {
                res += h
            }
        }
        return res
    }
}

//: [Next](@next)
