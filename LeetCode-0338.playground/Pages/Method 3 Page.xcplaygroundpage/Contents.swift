//: [Previous](@previous)

/*:
 # 最低有效位
 
 对于正整数 `x`，将其二进制右移一位，可以将其二进制的最后一位去掉，得到的数是 $ \floor \frac{x}{2} \rfloor $。如果 $ bits[\floor \frac{x}{2} \rfloor] $ 的值已知，则可以得到 `bits[x]` 的值：
 
 * 如果 `x` 是偶数，则 $ bits[x] = bits[\floor \frac{x}{2} \rfloor] $
 
 * 如果 `x` 是奇数，则 $ bits[x] = bits[\floor \frac{x}{2} \rfloor] + 1 $
 
 则 `bits[x] = bits[x >> 1] + (x & 1)`
 
 时间复杂度：`O(mn)`
 
 空间复杂度：`O(1)`
 */

class Solution {
    func countBits(_ num: Int) -> [Int] {
        var result = [Int](repeating: 0, count: num + 1)
        if num == 0 {
            return result
        }
        for i in 1 ... num {
            result[i] = result[i >> 1] + (i & 1)
        }
        return result
    }
}

//: [Next](@next)
