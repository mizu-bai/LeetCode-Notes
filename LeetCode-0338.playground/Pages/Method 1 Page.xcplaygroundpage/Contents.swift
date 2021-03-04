//: [Previous](@previous)

/*:
 # 暴力法
 
 对从 `0` 到 `num` 的每个数直接计算「一比特数」。
 
 使用位运算计算：
 
 对任意整数 `x`，令 `x = x & (x - 1)`，可以让 `x` 的二进制最后一个 `1` 变成 `0`。对 `x` 重复操作，直到 `x` 变成 `0`，操作次数即 `x` 的「一比特数」。
 
 时间复杂度：`O(k * num)`，`k` 是 `Int` 类型的二进制位，`k = 32`
 
 空间复杂度：`O(1)`，返回一个长度为 `num` 的一维数组
 */

class Solution {
    /// 暴力法
    func countBits(_ num: Int) -> [Int] {
        var result = [Int]()
        for i in 0 ... num {
            result.append(countOnes(i))
        }
        return result
    }
    func countOnes(_ num: Int) -> Int{
        var num1 = num
        var result = 0
        while (num1 > 0) {
            num1 &= (num1 - 1)
            result += 1
        }
        return result
    }
}


//: [Next](@next)
