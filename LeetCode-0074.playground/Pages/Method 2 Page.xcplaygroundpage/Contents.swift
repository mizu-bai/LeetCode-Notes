//: [Previous](@previous)

/*:
 # 方法二：两次二分查找
 
 ## 思路
 
 先用二分找到 `target` 所在的行，然后在这行二分找到 `target`。具体是先找到 `matrix[i][0]` 小于 `target` 且 `matrix[i + 1][0] > target` 的第 `i` 行，然后在这行内二分找到 `target`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(log2(m) + log2(n)) = O(log2(mn))`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var col0 = [Int]()
        for row in matrix {
            col0.append(row[0])
        }
        var left = 0
        var right = m - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let cur = col0[mid]
            if cur == target {
                return true
            } else if cur < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        let row = right
        if right < 0 {
            return false
        }
        left = 0
        right = n - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let cur = matrix[row][mid]
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
