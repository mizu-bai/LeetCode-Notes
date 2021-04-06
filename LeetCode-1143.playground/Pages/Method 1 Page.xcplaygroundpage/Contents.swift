//: [Previous](@previous)

/*:
 # 方法一：二维动态规划
 
 ## 思路
 
 定义 `dp[i][j]` 表示 `text1[0 ..< i]` 和 `text2[0 ..< j]` 的最长公共子序列。
 
 状态转移方程
 
 * 当 `text1[i - 1] == text2[j - 1]` 时，说明两个子串的最后一位相等，所以最长公共子序列又增加了 1，`dp[i][j] = dp[i - 1][j - 1] + 1`；
 * 当 `text1[i - 1] != text2[j - 1]` 时，说明两个子串的最后一位不相等，所以当前最长公共子序列长度 `dp[i][j]` 为 `dp[i - 1][j]` 和 `dp[i][j - 1]` 的最大值
 
 状态初始化
 
 * 当 `i = 0` 时，`dp[0][j]` 表示的是 `text1` 中取空字符串跟
 `text2` 的最长公共子序列，结果肯定为 0；
 * 当 `j = 0` 时，`dp[i][0]` 表示的是 `text2` 中取空字符串跟 `text1` 的最长公共子序列，结果肯定也为 0。
 
 综上，当 `i = 0` 或者 `j = 0` 时，`dp[i][j]` 初始化为 0。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(mn)`
 * 空间复杂度：`O(mn)`
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1 ... m {
            for j in 1 ... n {
                if arr1[i - 1] == arr2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}

//: [Next](@next)
