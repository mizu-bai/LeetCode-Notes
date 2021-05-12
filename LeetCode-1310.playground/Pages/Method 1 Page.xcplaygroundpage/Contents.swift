//: [Previous](@previous)

/*:
 # 方法一：前缀异或
 
 ## 思路
 
 可以先求出该数组的前缀异或，再查询的时候可以用 `preXor[begin] ^ preXor[end + 1]` 获得对应值。
 
 ## 复杂度分析
 
 * 时间复杂度：前缀和 `O(len(arr))`，查询 `O(len(queries))`
 * 空间复杂度：前缀和 `O(len(arr) + 1)`，结果 `O(len(queries)`
 */

class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        let nArr = arr.count
        var preXor = [Int](repeating: 0, count: nArr + 1)
        for i in 0 ..< nArr {
            preXor[i + 1] = preXor[i] ^ arr[i]
        }
        let nQ = queries.count
        var res = [Int](repeating: 0, count: queries.count)
        for i in 0 ..< nQ {
            res[i] = preXor[queries[i][0]] ^ preXor[queries[i][1] + 1]
        }
        return res
    }
}

//: [Next](@next)
