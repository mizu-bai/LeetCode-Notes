//: [Previous](@previous)

/*:
 # 方法二：优化
 
 在状态转移方程中，`dp[i]` 的值只与 `dp[i - 1]` 和 `dp[i - 2]` 有关，因此可以使用三个变量进行状态转移，降低空间复杂度。
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        let arr = Array(s)
        let n = arr.count
        if n == 1 {
            return s == "0" ? 0 : 1
        }
        // tmp1 = dp[i - 2], tmp2 = dp[i - 1], tmp3 = dp[i - 2]
        var tmp1 = 0
        var tmp2 = 1
        for i in 1 ... n {
            var tmp3 = 0
            if arr[i - 1] != "0" {
                // dp[i] += dp[i - 1]
                tmp3 += tmp2
            }
            if i > 1 && arr[i - 2] != "0" && Int(String(arr[(i - 2) ... (i - 1)]))! <= 26 {
                // dp[i] += dp[i - 2]
                tmp3 += tmp1
            }
            tmp1 = tmp2
            tmp2 = tmp3
        }
        return tmp3
    }
}

//: [Next](@next)
