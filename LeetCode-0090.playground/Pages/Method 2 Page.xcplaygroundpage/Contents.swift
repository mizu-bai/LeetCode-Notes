//: [Previous](@previous)

/*:
 # 方法二：递归法实现子集枚举
 
 ## 思路
 
 与方法一类似，在递归时，若发现没有选择上一个数，且当前数字与上一个数相同，则可以跳过当前生成的子集。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n * 2 ^ n)`，其中 `n` 是数组 `nums` 的长度。排序的时间复杂度为 `O(n * log(n))`，一共有 `2 ^ n` 个状态，每个状态要用 `O(n)` 的时间来构造子集，一共要 `O(n * 2 ^ n)` 的时间构造子集。
 * 空间复杂度：`O(n)`，构造子集使用的临时数组 `t` 的空间代价，递归时栈空间的代价也是 `O(n)`。
 */

class Solution {
    var t: [Int]
    var ans: [[Int]]
    init() {
        self.t = [Int]()
        self.ans = [[Int]]()
    }
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        dfs(false, 0, nums)
        return self.ans
    }
    func dfs(_ flag: Bool, _ cur: Int, _ nums: [Int]) {
        if cur == nums.count {
            self.ans.append(self.t)
            return
        }
        dfs(false, cur + 1, nums)
        if (!flag && cur > 0 && nums[cur - 1] == nums[cur]) {
            return
        }
        self.t.append(nums[cur])
        dfs(true, cur + 1, nums)
        t.removeLast()
    }
}

//: [Next](@next)
