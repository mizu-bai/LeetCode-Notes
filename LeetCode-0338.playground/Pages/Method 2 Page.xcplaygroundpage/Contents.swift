//: [Previous](@previous)

/*:
 # 最高有效位
 
 如果一个整数 `y` 满足 `y & (y - 1) == 0`，则这个整数为 `2`的整数次幂，其二进制的最高位是 `1`，其他位都是 `0`。对于一个数 `x`，其最大的 `y` 是其最高有效位。
 
 有关系式 `bits[x] = bits[x - y] + bits[y] = bits[x - y] + 1`，因此可以将当前 `x` 的比特数转化为之前已经求出的某一 `x` 的比特数 `+ 1`。
 
 
 时间复杂度：`O(num)`
 
 空间复杂度：`O(1)`
 
 */

class Solution {
    func countBits(_ num: Int) -> [Int] {
        var result: [Int] = [Int](repeating: 0, count: num + 1)
        if num == 0 {
            return result
        }
        var highBit = 0
        for i in 1 ... num {
            if (i & (i - 1) == 0) {
                highBit = i
            }
            result[i] = result[i - highBit] + 1
        }
        return result
    }
}

//: [Next](@next)
