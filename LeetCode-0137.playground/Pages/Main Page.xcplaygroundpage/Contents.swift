//: [Previous](@previous)

/*:
 # 137. 只出现一次的数字 II
 
 给你一个整数数组 `nums` ，除某个元素仅出现 __一次__ 外，其余每个元素都恰出现 __三次__ 。请你找出并返回那个只出现了一次的元素。
 
 __示例 1：__
 
 ```
 输入：nums = [2,2,3,2]
 输出：3
 ```
 */

//: 代码模板

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        // var dict = [Int: Int]()
        // for num in nums {
        //     if dict[num] == nil {
        //         dict[num] = 1
        //     } else {
        //         dict[num] = dict[num]! + 1
        //     }
        // }
        // var res = 0
        // for num in nums {
        //     if dict[num] == 1 {
        //         res = num
        //     }
        // }
        // return res
        var dict = [Int: Int]()
        nums.map({dict[$0] = (dict[$0] ?? 0)! + 1})
        return dict.filter({$0.1 == 1}).map({$0.0}).first!
    }
}

//: [Next](@next)
