//: [Previous](@previous)

/*:
 # 方法一：使用标记数组
 
 ## 思路与方法
 
 我们可以用两个标记数组分别每一行和每一列是否有零出现。

 
 ## 复杂度分析
 
 * 时间复杂度：`O(mn)`，其中 `m` 是矩阵的行数，`n` 是矩阵的列数。最多遍历两次矩阵。
 * 空间复杂度：`O(m + n)`，其中 `m` 是矩阵的行数，`n` 是矩阵的列数。我们需要分别记录每一行或每一列是否有零出现。
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        var row = [Int](repeating: 0, count: m)
        var col = [Int](repeating: 0, count: n)
        for i in 0 ..< m {
            for j in 0 ..< n {
                if matrix[i][j] == 0 {
                    row[i] = 1
                    col[j] = 1
                }
            }
        }
        for i in 0 ..< m {
            for j in 0 ..< n {
                if row[i] == 1 || col[j] == 1 {
                    matrix[i][j] = 0
                }
            }
        }
        return
    }
}

//: [Next](@next)
