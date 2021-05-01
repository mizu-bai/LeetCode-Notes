//: [Previous](@previous)

/*:
 # 方法一：hash table

 ## 思路
 
 用 hash table 保存元素出现的个数，再遍历 hash table 找出出现次数为 `1` 的元素。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                dict[num] = dict[num]! + 1
            }
        }
        var res = 0
        for num in nums {
            if dict[num] == 1 {
                res = num
            }
        }
        return res
    }
}

//: [Next](@next)
