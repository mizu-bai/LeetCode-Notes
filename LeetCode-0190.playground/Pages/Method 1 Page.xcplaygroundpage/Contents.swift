//: [Previous](@previous)

/*:
 # 方法一：模拟
 
 ## 思路
 
 十进制转二进制，最智障的方法。
 
## 复杂度分析
 
 * 时间复杂度：`O(k)`
 * 空间复杂度：`O(k)`
 
 其中 `k` 是二进制字符串的长度。
 
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var bin: [Int] = [Int]()
        var m: Int = n
        while m != 0 {
            bin.append(m % 2)
            m /= 2
        }
        while bin.count != 32 {
            bin.append(0)
        }
        var res: Int = 0
        while bin.count > 0 {
            res *= 2
            res += bin.removeFirst()
        }
        return res
    }
}

//: [Next](@next)
