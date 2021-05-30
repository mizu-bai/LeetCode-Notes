//: [Previous](@previous)

/*:
 # 方法一：位运算
 
 ## 思路
 
 `2` 的幂的二进制都符合首位是 `1`，其余位都是 `0` 的情况。因此若 `n & (n - 1) == 0` 则 `n` 为 `2` 的幂（`n > 0`）。
 
 ## 复杂度
 
 * 时间：`O(1)`
 * 空间：`O(1)`
 */

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n & (n - 1) == 0 && n > 0
    }
}

//: [Next](@next)
