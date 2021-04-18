//: [Previous](@previous)

/*:
 # 方法一：双指针
 
 ## 思路
 
 定义一个慢指针 `p1`，一个快指针 `p2`，快指针表示当前遍历到的位置，慢指针表示下一个不同元素要填入的位置，初始化时都指向下标 `1`。
 
 因为数组 `nums` 是有序的，因此有 `nums[p2] != nums[p2 - 1]`时，说明 `nums[p2]` 和之前的元素都不同，因此将 `nums[p2]` 的值赋给 `nums[p1]`，然后将 `p1` 和 `p2` 的值都加一；如果 `nums[p2] == nums[p2 - 1]` 元素相同，不用重复填入，只将 `p2` 的值加一。
 
 遍历完成后，`0 ... (p1 - 1)` 范围内的元素即是所有不同元素构成的数组，返回长度 `p1` 即可。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(1)`
 
*/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        if n < 2 {
            return n
        }
        var p1 = 1; // 慢指针
        var p2 = 1; // 快指针
        while p2 < n {
            // 判断相邻两个元素是否相等
            if nums[p2] != nums[p2 - 1] {
                nums[p1] = nums[p2]
                p1 += 1
            }
            p2 += 1
        }
        return p1
    }
}

//: [Next](@next)

