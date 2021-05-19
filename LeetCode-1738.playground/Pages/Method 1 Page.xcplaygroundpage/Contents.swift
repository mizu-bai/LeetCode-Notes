//: [Previous](@previous)

/*:
 # 方法一：二维前缀异或
 
 ## 思路
 
 利用二维前缀异或计算矩阵的累计异或值。
 
 二维前缀异或计算公式：`preXOR[i][j] = preXOR[i - 1][j] ^ preXOR[i][j - 1] ^ preXOR[i - 1][j - 1] ^ matrix[i][j]`
 
 ## 复杂
 
 * 时间：`O(n^2)`
 * 空间：`O(n^2)`
 */

class Solution {
    func kthLargestValue(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var res = [Int]()
        var preXOR = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1 ... m {
            for j in 1 ... n {
                preXOR[i][j] = preXOR[i - 1][j] ^ preXOR[i][j - 1] ^ preXOR[i - 1][j - 1] ^ matrix[i - 1][j - 1]
                res.append(preXOR[i][j])
            }
        }
        res.sort(by: {$0 > $1})
        return res[k - 1]
    }
}

//: [Next](@next)
