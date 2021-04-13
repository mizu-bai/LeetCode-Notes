//: [Previous](@previous)

/*:
 # 方法二：栈

 # 思路
 
 用栈遍历。
 
 # 复杂度分析
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，因为要遍历树中的所有结点
 * 空间复杂度：`O(h)`，其中 `h` 为树的高度
 
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var ans = Int.max
        var pre = -1
        var stack = [TreeNode?]()
        var node = root
        while node?.val != nil || !stack.isEmpty {
            while node?.val != nil {
                stack.append(node)
                node = node?.left
            }
            node = stack.popLast()!
            if pre != -1 {
                ans = min(ans, node!.val - pre)
            }
            pre = node!.val
            node = node?.right
        }
        return ans
    }
}

//: [Next](@next)
