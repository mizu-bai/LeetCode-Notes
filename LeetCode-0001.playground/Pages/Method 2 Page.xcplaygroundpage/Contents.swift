//: [Previous](@previous)

/*:
 # 哈希表
 
 创建一个哈希表，对于每一个 `x`，我们首先查询哈希表中是否存在 `target - x`，然后将 `x` 插入到哈希表中，即可保证不会让 `x` 和自己匹配。
 
 时间复杂度：`O(n)`
 
 空间复杂度：`O(n)`
 
 其中 `n` 是数组中的元素数量
 
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [Int: Int]()
        for i in 0 ..< nums.count {
            if dict.keys.contains(target - nums[i]) {
                return [dict[target - nums[i]]!, i]
            }
            dict.updateValue(i, forKey: nums[i])
        }
        return [Int]()
    }
}

//: [Next](@next)
