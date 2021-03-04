//: [Previous](@previous)

/*:
 # 贪心 + 二分查找
 
 ## 官解
 
 考虑一个简单的贪心，如果我们要使上升子序列尽可能的长，则我们需要让序列上升得尽可能慢，因此我们希望每次在上升子序列最后加上的那个数尽可能的小。
 
 基于上面的贪心思路，我们维护一个数组 `d[i]` ，表示长度为 `i` 的最长上升子序列的末尾元素的最小值，用 `len` 记录目前最长上升子序列的长度，起始时 `len` 为 1，`d[1] = nums[0]`。同时这个 `d[i]` 是关于 `i` 单调的。
 
 依次遍历数组 `nums` 中的元素，并更新数组 `d` 和 `len` 的值。如果 `nums[i] > d[len]`，则更新 `len = len + 1`，否则在 `d[1 ... len] 中找满足 d[i - 1] < nums[j] < d[i]` 的下标 `i`，并更新 `d[i] = nums[j]`。
 
 根据 `d` 数组的单调性，我们可以使用二分查找寻找下标 `i`，优化时间复杂度。
 
 最后整个算法流程为：
 
 设当前已经求出的最长上升子序列的长度为 `len`（起始为 1），从前向后遍历数组 `nums`，在遍历到 `nums[i]` 时：
 
 * 如果 `nums[i] > d[len]`，则加入到数组 `d` 的末尾，并更新 `len = len + 1`
 * 否则，在数组 `d` 中二分查找，找到第一个比 `nums[i]` 小的数 `d[k]`，并更新 `d[k + 1] = nums[i]`
 
 ## 复杂度分析
 
 时间复杂度：`O(n log n)`
 
 空间复杂度：`O(n)`
 
 其中，`n` 为数组 `nums` 的长度
 */

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.first == nil {
            return 0
        }
        var d: [Int] = [Int]()
        for num in nums {
            if num > d.last ?? Int.min {
                d.append(num)
            } else {
                var left: Int = 0
                var right: Int = d.count - 1
                var loc = right
                while left <= right {
                    let mid = (left + right) / 2
                    if d[mid] >= num {
                        loc = mid
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                }
                d[loc] = num
            }
        }
        return d.count
    }
}
