//: [Previous](@previous)

/*:
 # 方法一：按位比较
 
 ## 思路
 
 先按位异或，找位置不同的二进制位的位置，再累加计算。
 
 ## 复杂度分析
 
 * 时间：`O(k)`，`k` 是二进制位的位数
 * 空间：`O(1)`
 */

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var res = 0
        let xor = x ^ y
        for i in 0 ..< 32 {
            res += (xor >> i) & 1
        }
        return res
    }
}

//: [Next](@next)
