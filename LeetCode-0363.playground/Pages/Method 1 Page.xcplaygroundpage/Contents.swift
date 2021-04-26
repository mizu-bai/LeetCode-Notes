//: [Previous](@previous)

/*:
 # 方法一：前缀合 + 暴力（会超时）
 
 ## 思路
 
 当成二维前缀和来做
 
 ## 复杂度分析
 
 * 时间复杂度：前缀和 `O(m * n)`，查找 `O((m * n) ^ 2)`
 * 空间复杂度：`O(m * n)`
 */

class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        // preSum
        // preSum[i, j] 表示以 matrix[i + 1][j + 1] 为右下角的
        var preSum = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0 ..< m {
            for j in 0 ..< n {
                preSum[i + 1][j + 1] = preSum[i + 1][j] + preSum[i][j + 1] - preSum[i][j] + matrix[i][j]
            }
        }
        var res = Int.min
        for i in 0 ..< m {
            for j in 0 ..< n {
                for p in i ..< m {
                    for q in j ..< n {
                        let tmp = preSum[p + 1][q + 1] - preSum[i][q + 1] - preSum[p + 1][j] + preSum[i][j]
                        if tmp <= k {
                            res = max(res, tmp)
                        }
                    }
                }
            }
        }
        return res
    }
}

//: [Next](@next)
