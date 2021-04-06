//: [Previous](@previous)

/*:
 # 方法一：直接删除元素
 
 ## 思路
 
 如果 `nums` 的长度小于 3，就直接返回其长度。如果长度大于等于 3，就遍历 `nums`，如果出现 `nums[p] == nums[p - 2]`，则至少有三个连续的数重复。因为 `nums` 是有序的，必有 `nums[p] == nums[p - 1] == nums[p - 2]`。此时可以删除 `p` 处的元素，再判断是否又出现 `nums[p] == nums[p - 2]` 的情况。因为删除元素后，相当于索引 `p` 向数组末尾走了一位，不用对 `p` 进行自增操作。
 
 ## 复杂度分析
 
 * 时间复杂度：不算 `remove(at:)` 的话是 `O(n)`，`n` 是数组长度
 * 空间复杂度：`O(1)`
 
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 3 {
            return nums.count
        }
        var p = 2
        while p < nums.count {
            if nums[p] == nums[p - 2] {
                nums.remove(at: p)
            } else {
                p += 1
            }
        }
        return nums.count
    }
}

//: [Next](@next)
