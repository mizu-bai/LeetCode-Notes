//: [Previous](@previous)

/*:
 # 一维前缀和
 
 存储每一个 `row` 的前缀和，即一个 `m * (n + 1)` 的二维数组
 
 时间复杂度：`O(mn)`（初始化），`O(m)`（检索）
 
 空间复杂度：`O(mn)`，创建一个 `m * (n + 1)` 的二维数组用于存储前缀和
 
 其中，`m` 和 `n` 分别为 `matrix` 的 `row` 和 `col` 长度
 */

class NumMatrix {
    /// 一维前缀和
    var preSum: [[Int]] = [[Int]]()
    init(_ matrix: [[Int]]) {
        let m = matrix.count    // row
        if m > 0 {
            let n = matrix[0].count // col
            self.preSum = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m)
            for row in 0 ..< m {
                for col in 0 ..< n {
                    self.preSum[row][col + 1] = self.preSum[row][col] + matrix[row][col]
                }
            }
        }
        print(preSum)
    }
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum: Int = 0
        for row in row1 ... row2 {
            sum += self.preSum[row][col2 + 1] - self.preSum[row][col1]
        }
        return sum
    }
}

//: [Next](@next)
