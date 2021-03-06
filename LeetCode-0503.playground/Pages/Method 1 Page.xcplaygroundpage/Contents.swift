//: [Previous](@previous)

/*:
 # 单调栈
 
 我们可以使用单调栈解决本题。单调栈中保存的是下标，从栈底到栈顶的下标在数组 `nums` 中对应的值是单调不升的。
 
 每次我们移动到数组中的一个新的位置 `i`，我们就将当前单调栈中所有对应值小于 `nums[i]` 的下标弹出单调栈，这些值的下一个更大元素即为 `nums[i]`（证明很简单：如果有更靠前的更大元素，那么这些位置将被提前弹出栈）。随后我们将位置 `i` 入栈。
 
 另外这是个循环数组，要把这个数组拉直，可以复制该数组的前 `n - 1` 个元素排在后面，也可以循环两个数组长度，并对下标取模即可。
 
 时间复杂度：`O(n)`，遍历数组中各元素最多 2 次，每个元素最多入栈出栈各 2 次
 
 空间复杂度：`O(n)`，维护一个栈，栈的大小最大为 `2 * n - 1`
 
 其中，`n` 是数组的长度
 */
class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return [Int]()
        }
        let length: Int = nums.count
        var result: [Int] = [Int](repeating: -1, count: length)
        var stack: [Int] = [Int]()
        // 从 0 循环到 (2 * length - 1)，取模后被映射在 0 ... (length - 1) 内
        for i in 0 ... (2 * length - 1) {
            // 弹出所有小于当前元素的栈内元素
            while !stack.isEmpty && nums[stack.last!] < nums[i % length] {
                result[stack.popLast()!] = nums[i % length]
            }
            // 再把这个元素扔进栈去
            stack.append(i % length)
        }
        return result
    }
}
