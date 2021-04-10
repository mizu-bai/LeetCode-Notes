//: [Previous](@previous)


/*:
 # 方法一：数学
 
 ## 思路
 
 一个数，如果
 
 1. 小于等于 `0`，一定不是丑数
 2. 大于 `0`，满足 `n = 2^a * 3^b * 5^c`，才为丑数，否则不是丑数
 
 因此，在小于等于 `0` 时，直接返回 `false`，大于 `0` 时，对它反复除以 `2`，`3` 和 `5`，直到不再含有这此因数。如果剩下的是 `1`，就返回 `true`，否则返回 `false`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(log(n))`，最坏情况是 `n` 为 `2` 的倍数，这样进行除法时，`n` 减小的最慢
 * 空间复杂度：`O(1)`
 */

class Solution {
    func isUgly(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        var n = n
        let factors = [2, 3, 5]
        for factor in factors {
            while n % factor == 0 {
                n /= factor
            }
        }
        return n == 1 ? true : false
    }
}
