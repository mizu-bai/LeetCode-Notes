//: [Previous](@previous)

/*:
 # 938. 二叉搜索树的范围和
 
 给定二叉搜索树的根结点 `root`，返回值位于范围 `[low, high]` 之间的所有结点的值的和。
 
 __示例 1：__
 
 ```
 输入：root = [10,5,15,3,7,null,18], low = 7, high = 15
 输出：32
 ```
 */

//: 代码模板

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
        
    }
}

//: [Next](@next)
