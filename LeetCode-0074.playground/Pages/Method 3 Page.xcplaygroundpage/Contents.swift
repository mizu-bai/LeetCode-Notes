//: [Previous](@previous)

/*:
 # 方法三：全局二分
 
 ## 思路
 
 把二维矩阵当成一维处理，把 `0 ..< m * n ` 的范围映射到二维，再进行二分。
 
 一维索引 `[i]` -> 二维索引 `[i / m, i % m]`
 
 
 ## 复杂度分析
 
 * 时间复杂度：` O(log2(mn))`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var left = 0
        var right = m * n - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let cur = matrix[mid / n][mid % n]
            if cur == target {
                return true
            } else if cur < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}

//: [Next](@next)
