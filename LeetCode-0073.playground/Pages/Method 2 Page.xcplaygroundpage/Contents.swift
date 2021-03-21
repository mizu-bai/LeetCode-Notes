//: [Previous](@previous)

/*:
 # 方法二：使用两个标记变量
 
 ## 思路和算法
 
 可以用矩阵的第一行和第一列代替方法一中的两个标记数组，  以达到 `O(1)` 的额外空间。
 
 在实际代码中，我们首先预处理出两个标记变量，接着使用其他行与列去处理第一行与第一列，然后反过来使用第一行与第一列去更新其他行与列，最后使用两个标记变量去更新第一行和第一列即可。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(mn)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        var flag_col0 = 0
        var flag_row0 = 0
        for i in 0 ..< m {
            if matrix[i][0] == 0 {
                flag_col0 = 1
            }
        }
        for j in 0 ..< n {
            if matrix[0][j] == 0 {
                flag_row0 = 1
            }
        }
        for i in 1 ..< m {
            for j in 1 ..< n {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1 ..< m {
            for j in 1 ..< n {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        if flag_col0 != 0 {
            for i in 0 ..< m {
                matrix[i][0] = 0
            }
        }
        if flag_row0 != 0 {
            for j in 0 ..< n {
                matrix[0][j] = 0
            }
        }
        return
    }
}

//: [Next](@next)
