//: [Previous](@previous)

/*:
 # 方法一：滑动窗口+有序集合
 
 爬了，学官方的吧。
 
 ## 思路
 
 对于序列中每一个元素 `x` 左侧的至多 `k` 个元素，如果这 `k` 个元素中存在一个元素落在区间 `[x−t,x+t]` 中，我们就找到了一对符合条件的元素。注意到对于两个相邻的元素，它们各自的左侧的 `k` 个元素中有 `k−1` 个是重合的。于是我们可以使用滑动窗口的思路，维护一个大小为 `k` 的滑动窗口，每次遍历到元素 `x` 时，滑动窗口中包含元素 `x` 前面的最多 `k` 个元素，我们检查窗口中是否存在元素落在区间 `[x−t,x+t]` 中即可。

 我们可以使用有序集合来支持这些操作。

 实现方面，我们在有序集合中查找大于等于 `x−t` 的最小的元素 `y`，如果 `y` 存在，且 `y≤x+t`，我们就找到了一对符合条件的元素。完成检查后，我们将 `x` 插入到有序集合中，如果有序集合中元素数量超过了 `k`，我们将有序集合中最早被插入的元素删除即可。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n * log(min(n, k)))`，其中 `n` 是给定数组的长度。每个元素至多被插入有序集合和从有序集合中删除一次
 * 空间复杂度：`O(min(n, k))`，其中 `n` 是给定数组的长度
 */

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        let n = nums.count
        var set = Set<Int>()
        for i in 0 ..< n {
            let ceiling: Int? = set.filter({$0 >= nums[i] - t}).min() // 实现 TreeSet 的 ceiling()
            if let v = ceiling, v <= nums[i] + t {
                return true
            }
            set.insert(nums[i])
            if i >= k {
                set.remove(nums[i - k])
            }
        }
        return false
    }
}

//: [Next](@next)
