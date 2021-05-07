//: [Previous](@previous)

/*:
 # 方法一：模拟

 ## 思路
 
 按题目要求依次计算。
 
 ## 复杂度分析
 
 * 时间：`O(n)`
 * 空间：`O(1)`
 */

class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var res = start;
        for i in 1 ..< n {
            res ^= start + 2 * i
        }
        return res
    }
}

//: [Next](@next)

