//: [Previous](@previous)

/*:
 # 方法一：动态规划
 
 ## 思路
 
 创建一个 `dp` 数组，数组的第 `i` 位表示以字符串的第 `i - 1` 结尾的字符串共有多少种解码方式。
 
 边界条件：`dp[0] = 1`，空串的解码方式是唯一的
 
 状态转移方程：
 
 * 考虑当前字符，如果字符不为 "0"，则可以得出一种合法的解码方案
 
    `dp[i] += dp[i - 1]`
 
 * 向前考虑一个字符，如果这两位组成的数值 `val <= 26`，则再得出一种合法的解码方式
 
    `dp[i] += dp[i - 2]`
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，要遍历一遍字符串 `s`
 * 空间复杂度：`O(n)`，要开辟一个长为 `n + 1` 的 `dp` 数组
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        let arr = Array(s)
        let n = arr.count
        if n == 1 {
            return s == "0" ? 0 : 1
        }
        var dp: [Int] = [Int](repeating: 0, count: n + 1);
        dp[0] = 1
        for i in 1 ... n {
            if arr[i - 1] != "0" {
                dp[i] += dp[i - 1]
            }
            if i > 1 && arr[i - 2] != "0" && Int(String(arr[(i - 2) ... (i - 1)]))! <= 26 {
                dp[i] += dp[i - 2]
            }
        }
        return dp[n]
    }
}

//: [Next](@next)
