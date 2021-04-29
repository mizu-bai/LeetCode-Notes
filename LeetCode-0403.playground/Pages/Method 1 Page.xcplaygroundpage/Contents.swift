//: [Previous](@previous)

/*:
 # 方法一：动态规划
 
 ## 思路
 
 创建 `dp` 数组，令 `dp[i][k]` 表示青蛙能否到达第 `i` 个石头的位置且跳跃距离为 `k` 的状态。
 
 初始化：第一次已经在石头上，则 `dp[0][0] = true`
 
 转移方程：`dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1]`，如果青蛙可以在上一步跳跃 `k` 步长的情况下从 `j` 跳到 `i`，则只要跳到上一个石头 `j` 时，跳跃步长为 `k - 1`，`k` 或 `k + 1`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n ^ 2)`
 * 空间复杂度：`O(n ^ 2)`
 */

class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        let n = stones.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        dp[0][0] = true
        for i in 1 ..< n {
            for j in (0 ..< i).reversed() {
                let k = stones[i] - stones[j]
                if k > j + 1 {
                    break
                }
                dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1]
                if i == n - 1 && dp[i][k] {
                    return true
                }
            }
        }
        return false
    }
}

//: [Next](@next)
