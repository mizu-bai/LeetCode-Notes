//: [Previous](@previous)

/*:
 # 方法一：归并排序
 
 ## 思路
 
 就归并啊。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(m + n)`
 * 空间复杂度：`O(m + n)`
 
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var res = [Int](repeating: 0, count: m + n)
        var p1 = 0
        var p2 = 0
        var cur = 0
        while p1 < m || p2 < n {
            if p1 == m {
                cur = nums2[p2]
                p2 += 1
            } else if p2 == n {
                cur = nums1[p1]
                p1 += 1
            } else if nums1[p1] < nums2[p2] {
                cur = nums1[p1]
                p1 += 1
            } else {
                cur = nums2[p2]
                p2 += 1
            }
            res[p1 + p2 - 1] = cur
        }
        nums1 = res
    }
}

//: [Next](@next)
