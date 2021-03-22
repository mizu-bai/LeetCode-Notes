//: [Previous](@previous)

/*:
 # 方法二：位运算优化
 
 ## 思路及解法
 
 `n & (n - 1)` 的结果即为把 `n` 的二进制位中的最低一位的 `1` 变成 `0`。因此可以不断让当前的 `n` 与 `n - 1` 做位运算，直到 `n` 变成 `0` 为止。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(log n)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var m: Int = n
        var res: Int = 0
        while m != 0 {
            m &= m - 1
            res += 1
        }
        return res
    }
}
