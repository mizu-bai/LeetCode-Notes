//: [Previous](@previous)

/*:
 # 集合（2）
 
 使用集合存储数组中出现的所有数字，并计算数组中的元素之和。由于集合保证元素无重复，因此计算集合中的所有元素之和的两倍，即为每个元素出现两次的情况下的元素之和。由于数组中只有一个元素出现一次，其余元素都出现两次，因此用集合中的元素之和的两倍减去数组中的元素之和，剩下的数就是数组中只出现一次的数字。
 
 时间复杂度：`O(n)`
 
 空间复杂度：`O(n)`
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var tmp = Set(nums)
        var result = 0
        for item in tmp {
            result += item * 2
        }
        for item in nums {
            result -= item
        }
        return result
    }
}

//: [Next](@next)
