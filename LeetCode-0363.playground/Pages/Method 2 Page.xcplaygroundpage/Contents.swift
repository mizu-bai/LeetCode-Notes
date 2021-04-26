//: [Previous](@previous)

/*:
 # 方法二：前缀和 + 二分
 
 ## 思路
 
 枚举矩形的上下边界，并计算出该边界内每列元素之和，则原问题换成了如下的一维问题：
 
 > 给定一个数组的一个数 `k`，计算该数组的最大敬意和，要求区间和不超过 `k`。
 
 区间 `[l, r)` 的区间和 `a_l + a_(l + 1) + ... + a_(r - 1)` 即为 `preSum_r - preSum_l`。
 
 枚举 `r`，上述问题的约束可以转换为 `preSum_l > preSum_r - k`。要使 `preSum_r - preSum_l` 尽可能大，则要寻找最小满足 `preSum_l >= preSum_r - k` 的 `S_l`。我们可以在枚举 `r` 的同时，维护一个存储 `S_i (i < r)` 的有序集合，则可以在 `O(log(n))` 的时间内二分找到符合要求的 `S_l`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(m ^ 2 * n * log(n))`
 * 空间复杂度：`O(n)`
 */

class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var ans = Int.min
        for i in 0 ..< m {
            var sum: [Int] = [Int](repeating: 0, count: n)
            for j in i ..< m {
                for c in 0 ..< n {
                    sum[c] += matrix[j][c]
                }
                var sumSet = Set<Int>()
                sumSet.insert(0)
                var s = 0
                for v in sum {
                    s += v
                    if let ceil = sumSet.filter({$0 > s - k}).sorted().first {
                        ans = max(ans, s - ceil)
                    }
                    sumSet.insert(s)
                }
            }
        }
        return ans
    }
}

//: [Next](@next)
