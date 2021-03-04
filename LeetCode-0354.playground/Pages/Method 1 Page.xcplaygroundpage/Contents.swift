//: [Previous](@previous)

/*:
 # 动态规划
 
 先对信封进行排序，按 `w` 升序， `w` 相同时按 `h` 降序，就可以按 `h` 高度寻找。因为只有 `w1 < w2` 且 `h1 < h2` 才能放进去，这样就解决了 `w` 相同时候，`h` 小的不能放进 `h` 大的里的问题。
 
 接下来使用动态规划求解，具体见题「300. 最长递增子序列」。
 */

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        if envelopes.count == 0 {
            return 0
        }
        let envelopesSorted: [[Int]] = envelopes.sorted(by: {(item1: [Int], item2: [Int]) -> Bool in
            return item1[0] == item2[0] ? item1[1] > item2[1] : item1[0] < item2[0]
        })
        let length: Int = envelopesSorted.count
        var dp: [Int] = [Int](repeating: 1, count: length)
        var result: Int = 1;
        for i in 0 ..< length {
            for j in 0 ..< i {
                if envelopesSorted[j][1] < envelopesSorted[i][1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            result = max(dp[i], result)
        }
        return result
    }
}

//: [Next](@next)
