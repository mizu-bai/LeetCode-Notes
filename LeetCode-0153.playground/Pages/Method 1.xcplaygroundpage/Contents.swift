//: [Previous](@previous)

/*:
 # 方法一：二分查找
 
 ## 思路
 
 由于旋转前的数组是严格单调的，那么数组中的所有元素均不相等。旋转后，如果和原数组不相等，那么两段数组内部严格单调，此时一定有 `nums[left] < nums[right]`。
 
 * 如果 `nums[left] < nums[mid]`，说明 `mid` 在旋转处到原数组结尾的范围内，即较大的一段内，最小元素一定在 `mid` 的右边，令 `mid = right`；
 * 如果 `nums[mid] > nums[right]`，那 `mid` 一定在原数组开头到旋转处之间，即较小的一段内，最小元素一定在 `mid` 的左边，令 `mid = left + 1`。
 
 如果 `left` 和 `right` 相邻，则此时 `nums[left]` 一定为 `nums` 中的最大值，`nums[right]` 一定为 `nums` 的最小值。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(log(n))`
 * 空间复杂度：`O(1)`
 
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0]
        }
        var left = 0
        var right = n - 1
        var res = 0
        var mid = 0
        while left <= right {
            if nums[left] < nums[right] {
                // 整个数组有序
                mid = (left + right) / 2
                right = mid - 1
            } else {
                // 旋转过
                if left + 1 == right {
                    mid = right
                    break
                }
                mid = (left + right) / 2
                if nums[left] <= nums[mid] {
                    // 左半段有序
                    left = mid + 1
                } else if nums[mid] <= nums[right] {
                    // 右半段有序
                    right = mid
                }
            }
        }
        res = nums[mid]
        return res
    }
}

//: [Next](@next)
