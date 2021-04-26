//: [Previous](@previous)

/*:
 # 方法二：栈
 
 ## 思路
 
 和方法一差不多，但是用栈来遍历树。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：栈 `O(n)`，
 
 */

import Foundation

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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var root = root
        var stack = [TreeNode?]()
        var arr = [TreeNode?]()
        while root?.val != nil || !stack.isEmpty {
            while root?.val != nil {
                stack.append(root)
                root = root?.left
            }
            root = stack.popLast()!
            arr.append(root)
            root = root?.right
        }
        let dummy: TreeNode? = TreeNode(-1)
        var cur = dummy
        for node in arr {
            node?.left = nil
            node?.right = nil
            cur?.right = node
            cur = cur?.right
        }
        return dummy?.right
    }
}

//: [Next](@next)
