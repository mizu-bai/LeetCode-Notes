//: [Previous](@previous)

/*:
 # 二维前缀和
 
 假设 `m` 和 `n` 分别是矩阵 `matrix` 的行数和列数，定义当 `0 ≤ i ≤ m` 且 `0 ≤ j ≤ n` 时， `f(i, j)` 为矩阵 `matrix` 的以 `(i, j)` 为右下角的子矩阵元素之和。
 
 ```
 f(i, j) = f(i - 1, j) + f(i, j - 1) - f(i - 1, j - 1) + matrix[i][j]
 ```
 
 因此，要创建一个 `(m + 1) * (n + 1)` 的二维数组存储二维前缀和
 
 时间复杂度：`O(mn)`（初始化），`O(1)`（检索）
 
 空间复杂度：`O(mn)`，二维前缀和数组
 */

class NumMatrix {
    var preSum: [[Int]] = [[Int]]()
    init(_ matrix: [[Int]]) {
        let m = matrix.count
        if m > 0 {
            let n = matrix[0].count
            self.preSum = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
            for i in 0 ..< m {
                for j in 0 ..< n {
                    self.preSum[i + 1][j + 1] = self.preSum[i + 1][j] + self.preSum[i][j + 1] - self.preSum[i][j] + matrix[i][j]
                }
            }
        }
    }
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return self.preSum[row2 + 1][col2 + 1] - self.preSum[row2 + 1][col1] - self.preSum[row1][col2 + 1] + self.preSum[row1][col1]
    }
}
