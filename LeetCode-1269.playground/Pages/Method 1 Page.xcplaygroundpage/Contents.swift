//: [Previous](@previous)

/*:
 # 方法一：动态规划
 
 ## 思路
 
 定义 `f[i][j]` 代表当前剩余操作数为 `i`，所在位置为 `j` 的所有方案数。
 
 起始位置为 `0`，操作次数为 `step`，即有初始化条件 `f[step][0]=1`，`f[0][0]` 则是我们的最终答案。

 不失一般性的考虑 `f[i][j]` 可以由哪些状态转移而来：
 
 * 由「原地」操作到达当前状态，消耗一次操作，此时由状态 `f[i+1][j]` 转移而来
 * 由「向左」操作到达当前状态，消耗一次操作，此时由状态 `f[i+1][j+1]` 转移而来
 * 由「向右」操作到达当前状态，消耗一次操作，此时由状态 `f[i+1][j−1]` 转移而来

 求的是方案数，即最终的 `f[i][j]` 为三者累加值。
 
 同时我们发现 `f[i][x]` 依赖于 `f[i+1][y]`，因此我们需要按照「step 从大到小」的顺序进行转移。

 同时我们根据「最终回到下标 0 位置」可以推断出，最远到达的位置为
 `step/2`（再远就回不来了）。将最远到达位置与数组最大下标取 `min` 即可确定维度 `step` 的范围。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(step * max)`
 * 空间复杂度：`O(step * max)`
 */

class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        let mod = Int(10e9 + 7)
        let n = min(steps / 2, arrLen - 1)
        var dp = [[Int]](repeating:[Int](repeating: 0, count: n + 1), count:steps)
        dp[steps][0] = 1
        for i in stride(from: steps - 1, through: 0, by: -1) {
            for j in 0 ... n {
                dp[i][j] = (dp[i][j] + dp[i + 1][j]) % mod
                if j > 0 {
                    dp[i][j] = (dp[i][j] + dp[i + 1][j - 1]) % mod
                }
                if j < n {
                    dp[i][j] = (dp[i][j] + dp[i + 1][j + 1]) % mod
                }
            }
        }
        return dp[0][0]
    }
}

//: [Next](@next)
