//: [Previous](@previous)

/*:
 # 方法一：迭代法实现子集枚举
 
 ## 思路
 
 考虑数组 `[1, 2, 2]`，选择前两个数，或者第一、第三个数，都会得到相同的子集。也就是说，对于当前选择的数 `x`，若前面有与之相同的数 `y`，且没有选择 `y`，此时包含 `x` 的子集，必然会出现在包含 `y` 的所有子集中。
 
 代码实现时，可以先将数组排序，迭代时，若发现没有选择上一个数，且当前数字与上一个数相同，可以路过当前生成的子集。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n * 2 ^ n)`，其中 `n` 是数组 `nums` 的长度。排序的时间复杂度为 `O(n * log(n))`，一共有 `2 ^ n` 个状态，每个状态要用 `O(n)` 的时间来构造子集，一共要 `O(n * 2 ^ n)` 的时间构造子集。
 * 空间复杂度：`O(n)`，构造子集使用的临时数组 `t` 的空间代价。
 */

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = [[Int]]()
        let nums = nums.sorted()
        let n = nums.count
        for mask in 0 ..< (1 << n) {
            var t: [Int] = [Int]()
            var flag: Bool = true
            for i in 0 ..< n {
                if mask & (1 << i) != 0 {
                    if i > 0 && mask >> (i - 1) & 1 == 0 && nums[i] == nums[i - 1] {
                        flag = false
                        break
                    }
                    t.append(nums[i])
                }
            }
            if flag {
                ans.append(t)
            }
        }
        return ans
    }
}

//: [Next](@next)
