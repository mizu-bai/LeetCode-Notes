//: [Previous](@previous)

/*:
 # 方法一：贪心
 
 ## 思路
 
 两只相同颜色的兔子看到的其他同色兔子数必然是相同的。反之，若两只兔子看到的其他同色兔子数不同，那么这两只兔子颜色也不同。
 
 因此，将 `answers` 中值相同的元素分为一组，对于每一组，计算出兔子的最少数量，然后将所有组的计算结果累加，就是最终的答案。
 
 一般地，如果有 x 只兔子都回答 y，则至少有 $ \lceil \frac{x}{y + 1} \rceil $ 种不同的颜色，且每种颜色有 $ y + 1 $， 只兔子，因此兔子数至少为
 
 $$
 \lceil \frac{x}{y + 1} \rceil \cdot (y + 1)
 $$
 
 我们可以用哈希表统计 `answers` 中各个元素的出现次数，对每个元素套用上述公式计算，并将计算结果累加，即为最终答案。

 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 
 其中，`n` 是数组 `answers` 的长度。
 */

class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        var dict = [Int: Int]()
        var ans = 0
        for item in answers {
            dict[item] = 1 + (dict[item] ?? 0)!
        }
        for (y, x) in dict {
            ans += (x + y) / (y + 1) * (y + 1)
        }
        return ans
    }
}

//: [Next](@next)
