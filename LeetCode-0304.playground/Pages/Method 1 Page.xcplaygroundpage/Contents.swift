//: [Previous](@previous)

/*:
 # 暴力法（超时）
 
 保存 `matrix` 的值，每次调用 `sumRegion` 方法时，循环累加。
 
 时间复杂度：`O(mn)`
 
 其中，`m` 和 `n` 分别为 `matrix` 的 `row` 和 `col` 长度
 */

class NumMatrix {
    /// 暴力法
    var matrix: [[Int]] = [[Int]]()
    init(_ matrix: [[Int]]) {
        self.matrix = matrix;
    }
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum: Int = 0;
        for row in row1 ... row2 {
            for col in col1 ... col2 {
                sum += self.matrix[row][col]
            }
        }
        return sum
    }
}

//: [Next](@next)
