//: [Previous](@previous)

/*:
 # 方法一：两重循环
 
 ## 思路
 
 要求从 `i` 异或到 `j - 1` 的值与从 `j` 异或到 `k` 和值相等，即从 `i` 异或到 `k` 的值为 `0`，此时的方案数是 `k - i` 个。
 
 ## 复杂度
 
 * 时间：`O(n^2)`
 * 空间：`O(1)`
 */

class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        var count = 0
        let n = arr.count
        for i in 0 ..< n {
            var tmp = arr[i]
            for k in i ..< n {
                tmp ^= arr[k]
                if tmp == 0 {
                    count += k - i
                }
            }
        }
        return count
    }
}

//: [Next](@next)
