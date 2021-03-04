//: [Previous](@previous)

/*:
 # Hash 表
 
 使用哈希表存储每个数字和该数字出现的次数。遍历数组即可得到每个数字出现的次数，并更新哈希表，最后遍历哈希表，得到只出现一次的数字。
 
 时间复杂度：`O(n)`
 
 空间复杂度：`O(n)`
 
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        var dict = [Int: Int]()
        for num in nums {
            dict[num] = 1 + (dict[num] ?? 0)!
        }
        for (key, value) in dict {
            if value == 1 {
                result = key
                break
            }
        }
        return result
    }
}

//: [Next](@next)
