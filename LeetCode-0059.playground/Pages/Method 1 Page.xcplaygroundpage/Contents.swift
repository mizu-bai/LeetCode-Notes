//: [Previous](@previous)

/*:
 # 模拟
 
 ## 思路
 
 模拟从左上角走到右上角，再走到右下角，再走到左下角，再走到左上角……用一个 `n * n` 的矩阵保存结果，用另一个 `n * n` 的矩阵保存有没有走过。
 
 ## 复杂度
 
 * 时间复杂度：`O(n ^ 2)`
 * 空间复杂度：`O(n ^ 2)`
 */

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        // 矩阵
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        // 判断有没有走过 (0 没走过, 1 走过)
        var flag = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        // 走到哪里了
        var col = 0
        var row = 0
        // 方向, [0, 1] 向右,[1, 0] 向下,[0, -1] 向左, [-1, 0] 向上
        var currentDirection = [0, 1]
        // 遍历
        for i in 1 ... n * n {
            // 添加到结果里去
            matrix[col][row] = i
            // 标记一下已经走过了
            flag[col][row] = 1
            // 判断要不要转弯
            if currentDirection == [0, 1] && (row == n - 1 || flag[col][row + 1] == 1) {
                // 现在向右走, 右边没路了, 转变向下走
                currentDirection = [1, 0]
            } else if currentDirection == [1, 0] && (col == n - 1 || flag[col + 1][row] == 1) {
                // 现在向下走, 下边没路了, 转弯向左走
                currentDirection = [0, -1]
            } else if currentDirection == [0, -1] && (row == 0 || flag[col][row - 1] == 1) {
                // 现在向左走, 左边没路了, 转弯向上走
                currentDirection = [-1, 0]
            } else if currentDirection == [-1, 0] && (col == 0 || flag[col - 1][row] == 1) {
                // 现在向上走, 上面没路了, 转弯向右走
                currentDirection = [0, 1]
            }
            // 继续走
            col += currentDirection[0]
            row += currentDirection[1]
        }
        return matrix
    }
}
