//: [Previous](@previous)

/*:
 # 方法一：逐位计算
 
 ## 思路
 
 计算汉明距离时，考虑同一比特位上的值是否不同。如果长度为 `n` 的数组 `nums` 的所有元素二进制位的第 `i` 位共有 `c` 个 `1`，`n - c` 个 `0` ，那这些元素的第 `i` 位上的汉明距离之和为 `c * (n - c)`。
 
 ## 复杂度分析
 
 * 时间：`O(n * L)`，`n` 是数组 `nums` 的长度
 * 空间：`O(1)`
 */

class Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        var res = 0;
        let n = nums.count
        for i in 0 ..< 32 {
            var tmp = 0
            for num in nums {
                tmp += (num >> i) & 1
            }
            res += tmp * (n - tmp)
        }
        return res
    }
}

//: [Next](@next)
