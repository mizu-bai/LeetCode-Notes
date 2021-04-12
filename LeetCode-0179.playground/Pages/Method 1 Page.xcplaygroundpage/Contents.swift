//: [Previous](@previous)

/*:
 # 方法一：转成字符串，拼接并比较
 
 ## 思路
 
 1. 先把 `nums` 中的数字转字符串
 2. 比较两个字符串 `a` 和 `b` 拼接的结果 `Int(a + b)` 和 `Int(b + a)` 谁大，确定 `a` 和 `b` 谁在前面
 3. 把整个数组排序的结果拼接面一个字符串返回
 
 特殊情况：如果输入的 `nums` 中只有 `0` 时，可能会出现 `00` 的情况，因为是降序排列，如果排序后数组中第一个元素就是 `"0"`，直接返回 "0"。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n * log(n))`
 * 空间复杂度：`O(n)`
 */

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        // 讲人话
        // var arr: [String] = [String]()
        // for num in nums {
        //     arr.append(String(num))
        // }
        // arr.sort(by: {(a: String, b: String) in
        //     return Int(a + b)! > Int(b + a)!
        // })
        // if arr[0] == "0" {
        //     return "0"
        // }
        // var res: String = ""
        // for item in arr {
        //     res += item
        // }
        // return res
        
        // 不讲人话
        let arr = nums.map({String($0)}).sorted(by: {Int($0 + $1)! > Int($1 + $0)!})
        return arr[0] == "0" ? arr[0] : arr.joined()
    }
}

//: [Next](@next)
