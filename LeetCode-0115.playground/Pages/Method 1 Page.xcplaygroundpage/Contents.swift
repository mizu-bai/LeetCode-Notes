//: [Previous](@previous)

/*:
 # 动态规划
 
 假设字符串 `s` 和 `t` 的长度分别为 `m` 和 `n`. 如果 `t` 是 `s` 的子序列, 则 `s` 的长度一定大于或等于 `t` 的长度, 即只有当 `m > n` 时, `t` 才可能是 `s` 的子列; 反之, 不是子列, 因此直接返回 0.
 
 当 `m ≥ n` 时, 可以通过动态规划的方法计算在 `s` 的子列中 `t` 出现的个数.
 
 创建二维数组 `dp`, 其中 `dp[i][j]` 表示在 `s[i:]` 的子列中 `t[j:]` 出现的个数.
 
 考虑动态规划的边界情况:
 
 * 当 `j = n` 时, `t[j:]` 为空串, 由于空串是任何字符串的子串, 因此对于任意 `0 ≤ i ≤ m`,  都有 `dp[i][j] = 1`;
 * 当 `i = m` 且 `j < n` 时, `s[i:]` 为空字符串, `t[j:]` 为非空, 因此对任意的 `0 ≤ j < n`, 都有 `dp[m][j] = 0`.
 
 当 `i < m` 且 ` j < n` 时,
 
 * 当 `s[i] = t[j]`, `dp[i][j]` 由两部分组成:
    * 如果 `s[i]` 和 `t[j]` 匹配, 则考虑 `t[j + 1 :]` 作为 `s[i + 1: ]` 的子序列, 子序列数为 `dp[i + 1][j + 1]`
    * 如果 不匹配, 则考虑 `t[j :]` 作为 `s[i + 1 :]` 的子序列, 子序列数为 `dp[i + 1][j]`.
    
    因此当 `s[i] = t[j]` 时, 有 `dp[i][j] = dp[i + 1][j + 1] + dp[i + 1][j]`.
 
 * 当 `s[i] ≠ t[j]` 时, `s[i]` 不能和 `t[j]` 匹配, 因此只考虑 `t[j :]` 作为 `s[i + 1 :]` 的子序列, 子序列数为 `dp[i + 1][j]`.
 
    因此当 `s[j] ≠ t[j]` 时, 有 `dp[i][j] = dp[i + 1][j]`.
 
 由此可得 `d[i][j] = `
 
 1. `dp[i + 1][j + 1] + dp[i + 1][j], s[i] = t[j]`
 2. `dp[i + 1][j], s[i] ≠ t[j]`
 
 最终计算得到 `dp[0][0]` 即为在 `s` 的子序列中 `t` 出现的个数.
 */

class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let m = s.count
        let n = t.count
        let arr_s = Array(s)
        let arr_t = Array(t)
        if m < n {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0 ... m {
            dp[i][n] = 1
        }
        for i in (0 ... m - 1).reversed() {
            for j in (0 ... n - 1).reversed() {
                if arr_s[i] == arr_t[j] {
                    dp[i][j] = dp[i + 1][j + 1] + dp[i + 1][j]
                } else {
                    dp[i][j] = dp[i + 1][j]
                }
            }
        }
        return dp[0][0]
    }
}
