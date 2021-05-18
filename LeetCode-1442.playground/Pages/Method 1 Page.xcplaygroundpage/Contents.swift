//: [Previous](@previous)

/*:
 # 方法一：三重循环
 
 ## 思路
 
 直接按题目意思，枚举 `i`，`j` 和 `k` 的值。
 
 ## 复杂度
 
 * 时间：`O(n^3)`
 * 空间：`O(n)`
 */

class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        var count = 0
        let n = arr.count
        var preXOR = [Int](repeating: 0, count: n + 1)
        for i in 0 ..< n {
            preXOR[i + 1] = preXOR[i] ^ arr[i]
        }
        for i in 0 ..< n {
            for j in i + 1 ..< n {
                for k in j ..< n {
                    if preXOR[i] == preXOR[k + 1] {
                        count += 1
                    }
                }
            }
        }
        return count
    }
}

//: [Next](@next)
