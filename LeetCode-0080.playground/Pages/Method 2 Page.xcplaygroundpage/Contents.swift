//: [Previous](@previous)

/*:
 # 方法二：双指针
 
 ## 思路
 
 使用双指针，快指针遍历所有元素，慢指针指向将要放置元素的位置。因为最多只能放两个相同的元素，所以让 `nums[fast]` 和 `nums[slow - 2]` 进行比较。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，`n` 是数组长度
 * 空间复杂度：`O(1)`
 */

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let m = nums.count
        var p0 = 0 // fast
        var p1 = 0 // slow
        for _ in 0 ..< m {
            if p1 < 2 || nums[p0] != nums[p1 - 2] {
                nums[p1] = nums[p0]
                p1 += 1
            }
            p0 += 1
        }
        return p1
    }
}
