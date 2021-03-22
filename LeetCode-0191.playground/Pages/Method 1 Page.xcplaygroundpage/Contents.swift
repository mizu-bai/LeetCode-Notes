//: [Previous](@previous)

/*:
 # 方法一：循环检查二进制位
 
 ## 思路及解法
 
 直接循环检查给定整数 `n` 的二进制位的每一位是否为 1。有两种方法：
 1. 检查第 `i` 位时，让 `n` 和 `2 ^ i` 进行与运算：
 2. 不断将 `n` 右移，检查 `n` 的最后一位，让 `n` 与 1 进行与运算。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(k)`，其中 `k` 是二进制位数
 * 空间复杂度：`O(1)`，只要常数空间保存结果
 */

class Solution {
    func hammingWeight1(_ n: Int) -> Int {
        /// 方法 1.1
        var res: Int = 0
        for i in 0 ..< 32 {
            if n & (1 << i) != 0 {
                res += 1
            }
        }
        return res
    }
    func hammingWeight2(_ n: Int) -> Int {
        /// 方法 1.2
        var m: Int = n
        var res: Int = 0
        while m != 0 {
            if m & 1 != 0 {
                res += 1
            }
            m >>= 1
        }
        return res
    }
}

//: [Next](@next)
