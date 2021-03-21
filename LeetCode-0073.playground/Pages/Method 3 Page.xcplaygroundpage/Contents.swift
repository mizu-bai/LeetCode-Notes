//: [Previous](@previous)

/*:
 # 方法三：使用一个标记变量
 
 ## 思路和算法
 
 对方法二进行优化，只胜出一个标记变量记录第一列是否原本存在 0 。这样，第一列的第一个元素即可以标记第一行是否出现 0 。但为了防止第一列的第一个元素被提前更新，我们需要从最后一行开始倒序地处理矩阵元素。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(mn)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        var flag_col0 = 0
        for i in 0 ..< m {
            if matrix[i][0] == 0 {
                flag_col0 = 1
            }
            for j in 1 ..< n {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in (0 ..< m).reversed() {
            for j in 1 ..< n {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if flag_col0 != 0 {
                matrix[i][0] = 0
            }
        }
        return
    }
}


//: [Next](@next)
