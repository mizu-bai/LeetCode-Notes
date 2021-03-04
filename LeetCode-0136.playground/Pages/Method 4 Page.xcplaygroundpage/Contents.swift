//: [Previous](@previous)

/*:
 # 异或运算
 
 异或运算的三个性质
 
 1. `a ^ 0 = a`
 2. `a ^ a = 0`
 3. `a ^ b ^ a = a ^ a ^ b = 0 ^ b = b`

 时间复杂度：`O(n)`
 
 空间复杂度：`O(1)`
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for item in nums {
            result ^= item
        }
        return result
    }
}
