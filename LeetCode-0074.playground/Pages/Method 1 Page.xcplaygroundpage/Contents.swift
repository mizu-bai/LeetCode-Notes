//: [Previous](@previous)

/*:
 # 方法一：按行查找
 
 ## 思路
 
 这个矩阵中，每行的元素都是递增的，并下一行的元素比本行的更大。如果 `target` 大于这行的末尾元素，那 `target` 一定不在此行中。如果 `target < matrix[i][n - 1]`，则 `target` 可能在本行中出现，就在这一行中查找。
 
 ## 复杂度分析
 
 * 时间复杂度：顺序查找是 `O(m + n)`，二分查找是 `O(m + log2((n))`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        for i in 0 ..< m {
            if target > matrix[i][n - 1] {
                continue
            }
            for elem in matrix[i] {
                if elem == target {
                    return true
                }
            }
        }
        return false
    }
}

//: [Next](@next)
