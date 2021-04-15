//: [Previous](@previous)

/*:
 # 方法一：动态规划
 
 ## 思路
 
 房屋为环状排列，而相邻的两个不能偷，可以把它拆成不偷最后一个房间和不偷第一个房间的两种情况。
 
 ### 状态定义
 
 创建动态规划数组 `dp`，`dp[i]` 代表前 `i` 个房子在满足条件下能盗窃到的最高金额。
 
 ### 状态转移方程
 
 边界条件
 
 * `i = start` 时， `dp[i] = nums[i]`
 * `i = start + 1` 时， `dp[i] = max(nums[i - 1], nums[i])`
 
 转移方程
 
 `dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])`
 
 最终返回两种情况下各自的 `dp` 数组最大值中较大的那个。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，要遍历两次数组
 * 空间复杂度:`O(n)`，要创建两个 `dp` 数组
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n < 3 {
            return nums.max()!
        }
        return max(robRange(nums, 0, n - 2), robRange(nums, 1, n - 1))
    }
    func robRange(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        for i in start ... end {
            if i == start {
                dp[i] = nums[i]
            } else if i == start + 1 {
                dp[i] = max(nums[i - 1], nums[i])
            } else {
                dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
            }
        }
        return dp.max()!
    }
}

//: [Next](@next)
