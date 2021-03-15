//: [Previous](@previous)

/*:
 # 模拟
 
 ## 思路
 
 模拟按螺旋的方式遍历矩阵，大致可以分解为以下步骤：
 
 1. 添加当前元素到结果数组中，并将当前位置标记为已经走过；
 2. 判断是否「撞墙」：
    * 现在向右走, 右边没路了, 转变向下走；
    * 现在向下走, 下边没路了, 转弯向左走；
    * 现在向左走, 左边没路了, 转弯向上走；
    * 现在向上走, 上面没路了, 转弯向右走。
 3. 更新下一步要走到的位置
 
 然后就完成了遍历。
 
 需要创建一个大小为 `m * n` 的矩阵，保存当前位置是否走过，和一个长度为 `m * n` 的数组，保存遍历结果。
 
 ## 复杂度

 * 时间复杂度：`O(mn)`
 * 空间复杂度：`O(mn)`
 
 其中 `m` 和 `n` 分别为矩阵的 `col` 和 `row`。
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // 矩阵的尺寸
        let m = matrix.count
        let n = matrix[0].count
        // 判断有没有走过 (0 没走过, 1 走过)
        var flag = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        // 保存结果
        var res = [Int]()
        // 走到哪里了
        var col = 0
        var row = 0
        // 方向, [0, 1] 向右,[1, 0] 向下,[0, -1] 向左, [-1, 0] 向上
        var currentDirection = [0, 1]
        // 遍历
        for _ in 0 ..< m * n {
            // 添加到结果里去
            res.append(matrix[col][row])
            // 标记一下已经走过了
            flag[col][row] = 1
            // 判断要不要转弯
            if currentDirection == [0, 1] && (row == n - 1 || flag[col][row + 1] == 1) {
                // 现在向右走, 右边没路了, 转变向下走
                currentDirection = [1, 0]
            } else if currentDirection == [1, 0] && (col == m - 1 || flag[col + 1][row] == 1) {
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
        return res
    }
}
