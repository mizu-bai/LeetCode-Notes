//: [Previous](@previous)

/*:
 # 对方法一代码的优化
 
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
        if root?.val == nil {
            return 0
        }
        if root!.val > high {
            return rangeSumBST(root?.left, low, high)
        }
        if root!.val < low {
            return rangeSumBST(root?.right, low, high)
        }
        return root!.val + rangeSumBST(root?.left, low, high) + rangeSumBST(root?.right, low, high)
    }
}

//: [Next](@next)
