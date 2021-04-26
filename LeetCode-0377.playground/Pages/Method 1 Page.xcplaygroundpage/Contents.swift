//: [Previous](@previous)

/*:
 # 方法一：动态规划
 
 ## 思路
 
 创建一个长度为 `target + 1` 的 `dp` 数组，用 `dp[x]` 表示选取的元素之和等于 `x` 的方案数，目标是求 `dp[target]`。
 
 边界：`dp[0] = 1`，只有不选取任何元素时，元素之和才为 `0`，因此只有一种方案。
 
 转移：当 `1 <= i <= target` 时，如果存在一种排列，其中的元素之和等于 `i`，则该排列的最后一个元素一定是 `nums` 中的一个元素。假设该排列的最后一个元素是 `num`，则一定有 `num <= i`，对于元素之和等于 `i - num` 的每一种排列，在最后添加 `num` 之后即可得到一个元素之和等于 `i` 的排列，因此在计算 `dp[i]` 时，应计算所有的 `dp[i - num]` 之和。
 
 结果：返回 `dp[target]`
 
 ## 复杂度分析
 
 * 时间复杂度：`O(target * n)`
 * 空间复杂度：`O(target)`
 
 */

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = [Int](repeating: 0, count: target + 1)
        dp[0] = 1
        for i in 1 ... target {
            for num in nums {
                if num <= i {
                    dp[i] &+= dp[i - num] // 溢出运算符
                }
            }
        }
        return dp[target]
    }
}

//: [Next](@next)


var a = UInt8.min
a &- 1

