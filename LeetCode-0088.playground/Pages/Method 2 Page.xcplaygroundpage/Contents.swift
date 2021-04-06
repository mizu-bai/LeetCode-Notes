//: [Previous](@previous)

/*:
 # 方法二：逆向双指针
 
 ## 思路
 
 上一个方法要用临时变量，防止 `nums1` 中的元素被覆盖。可以把指针从后向前遍历，每次取两都之中的较大都放在 `nums1` 的后面。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(m + n)`
 * 空间复杂度：`O(1)`
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var tail = m + n - 1
        var cur = 0
        while p1 >= 0 || p2 >= 0 {
            if p1 == -1 {
                cur = nums2[p2]
                p2 -= 1
            } else if p2 == -1 {
                cur = nums1[p1]
                p1 -= 1
            } else if nums1[p1] > nums2[p2] {
                cur = nums1[p1]
                p1 -= 1
            } else {
                cur = nums2[p2]
                p2 -= 1
            }
            nums1[tail] = cur
            tail -= 1
        }
    }
}

//: [Next](@next)
