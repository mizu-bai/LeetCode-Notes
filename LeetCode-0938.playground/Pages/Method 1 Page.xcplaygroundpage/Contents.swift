//: [Previous](@previous)

/*:
 # 方法一：中序遍历求和
 
 ## 思路
 
 如题
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(1)`
 */


/// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
    }
}

/// Solution
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        func dfs(_ node: TreeNode?) {
            if node?.val == nil {
                return
            }
            dfs(node?.left)
            if node!.val > high {
                return
            }
            if low <= node!.val && node!.val <= high {
                sum += node!.val
            }
            dfs(node?.right)
        }
        dfs(root)
        return sum
    }
}

//: [Next](@next)
