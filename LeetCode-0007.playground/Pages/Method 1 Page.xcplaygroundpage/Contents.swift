//: [Previous](@previous)

/*:
 # 方法一：模拟
 
 ## 思路
 
 注意条件 __只能用  32 位整数__
 
 ## 复杂度分析
 
 * 时间：`O(log|x|)`
 * 空间：`O(1)`
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var x: Int32 = Int32(x)
        var y: Int32 = 0
        while x != 0 {
            if y < Int32.min / 10 || y > Int32.max / 10 {
                return 0
            }
            y = x % 10 + y * 10
            x /= 10
        }
        return Int(y)
    }
}

//: [Next](@next)
