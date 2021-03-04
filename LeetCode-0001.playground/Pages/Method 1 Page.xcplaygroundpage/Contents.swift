//: [Previous](@previous)

/*:
 # 暴力法
 
 枚举数组中的每一个数 `x`，寻找数组中是否存在 `target - x`。一个元素不能被使用两次，因此每一个元素只需要匹配其后的元素。
 
 时间复杂度：`O(n ^ 2)`
 
 空间复杂度：`O(1)`
 
 其中 `n` 是数组中的元素数量
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int]
        let n = nums.count
        for i in 0 ..< n {
            for j in i + 1 ..< n {
                if nums[i] + nums[j] == target {
                    result = [i, j]
                }
            }
        }
        return result
    }
}

//: [Next](@next)
