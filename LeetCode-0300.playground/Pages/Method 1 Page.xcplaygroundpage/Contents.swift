//: [Previous](@previous)

/*:
 # 动态规划
 
 ## 官解
 
 定义 `dp[i]` 为考虑前 `i` 个元素，以第 `i` 个数字结尾的最长上升子序列长度，包含 `nums[i]`。
 
 从小到大计算 `dp` 数组的值，在计算 `dp[i]` 之前，已经计算出了 `dp[0 ... (i - 1)]` 的值，则状态转移方程为：
 
 `dp[i] = max(dp[j] + 1), when 0 ≤ j ≤ i and nums[j] < nums[i]`
 
 即考虑往 `dp[0 ... (i - 1)]` 中最长的上升子序列后面再接一个 `nums[i]`。由于 `dp[j]` 代表 `nums[0 ... j]` 中以 `nums[j]` 结尾的最长上升子序列，所以如果能从 `dp[j]` 这个状态转移过来，那么 `nums[i]` 必大于 `nums[j]`，才能链接形成更长的上升子序列。
 
 最后，整个数组的最长上升子序列即所有 `dp[i]` 中的最大值。
 
 ## 人话
 
 当前这个位置的值要去前面找比它矮的中最高的，这样才能接在那个后面，然后接上它有多少个数，就是那个比它矮的中最高的能组成的单调列个数 + 1。就给每一个数都算出来一个接上它后单调列的长度，找最大的值就是最大单调列了。
 
 时间复杂度：`O(n ^ 2)`
 
 空间复杂度：`O(n)`
 */

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let length: Int = nums.count
        var dp: [Int] = [Int](repeating: 1, count: length)
        var result: Int = 1
        for i in 0 ..< length {
            for j in 0 ..< i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            result = max(dp[i], result)
        }
        return result
    }
}

//: [Next](@next)
