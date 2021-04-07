//: [Previous](@previous)

/*:
 # 方法一：二分查找
 
 ## 思路
 
 二分查找的思想就是找出某个条件，这个条件给了我们移动左右指针的参考，即要判断查找的 `target` 是在 `mid` 的左边还是右边。
 
 令 `pivot` 为旋转点的位置，那么：
 
 * 因为给出的数组是旋转有序的，如果 `mid` 指向的位置在于 `pivot` 之后，那么 mid 向后部分是有序的，这个时候需要判断 `target` 在 `mid` 左边还是右边，最简单的方法就是判断 `target` 是不是在 `[pivot,r]` 区间内，如果的话就向 `mid` 后半部分搜索，否则就向 mid 左半部分搜索；
 * 同理，当 `mid` 在 `pivot` 之前，那么 `mid` 前面部分是有序的，根据 `target` 判断下面要向 `mid` 的左边还是右边搜索。
 * 如果遇到了 `nums[left] == nums[right]` 的情况，直接向右移动 `left`，直到 `nums[left] != nums[right]`（在 `left <= right` 的前提下）。
 
 ## 复杂度分析
 
 * 时间复杂度：如果不出现重复数字，即严格单调，为 `O(log(n))`，如果所有数字相同，且 `target` 不在 `nums` 中，为 `O(n)`
 * 空间复杂度：`O(1)`
 
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let n = nums.count
        if n == 0 {
            return false
        } else if n == 1 {
            return nums[0] == target
        }
        var left = 0
        var right = n - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return true
            }
            if nums[left] == nums[right] {
                left += 1
                continue
            }
            if nums[mid] <= nums[right] {
                // target 在右边
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                if nums[left] <= target && target < nums[mid] {
                    // target 在左边
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return false
    }
}

//: [Next](@next)
