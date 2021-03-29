//: [Previous](@previous)

/*:
 # 方法二：位运算

 ## 思路
 
 每次把 `res` 左移，把 `n` 的二进制末尾数字，拼接到 `res` 的末尾，然后把 `n` 右移。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(k)`
 * 空间复杂度：`O(1)`，仅使用常数个变量保存结果
 
 其中 `k` 是二进制字符串的长度。
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var m: Int = n
        var res: Int = 0
        for _ in 0 ..< 32 {
            res = (res << 1) | (m & 1)
            m >>= 1
        }
        return res
    }
}

//: [Next](@next)
