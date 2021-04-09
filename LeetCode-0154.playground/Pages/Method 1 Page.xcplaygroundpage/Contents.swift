//: [Previous](@previous)

/*:
 # 方法一：二分查找
 
 ## 思路
 
 同前三天的题。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(log(n))`， 最坏情况所有元素相等时为 `O(n)`
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
        if nums[left] < nums[right] {
            // 没旋转过
            return nums[0]
        }
        while left < right {
            // 如果旋转过，一定有 nums[left] >= nums[right]
            let mid = (left + right) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[right] {
                right = mid
            } else {
                right -= 1 // 退化到 O(n)
            }
        }
        return nums[left]
    }
}

//: [Next](@next)
