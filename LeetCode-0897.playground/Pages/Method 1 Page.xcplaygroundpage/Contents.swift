//: [Previous](@previous)

/*:
 # 方法一：递归
 
 ## 思路
 
 用递归的方法中序遍历二叉搜索树，把遍历到的节点放在数组里，最后再遍历数组，改变节点的指向。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，其中 `n` 是数组中节点的个数，一共要遍历一次树，遍历一次数组。
 * 空间复杂度：`O(n)`，要开辟一个数组保存所有的节点。
 
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var arr = [TreeNode?]()
        dfs(root, &arr)
        let dummy: TreeNode? = TreeNode(-1)
        var cur: TreeNode? = dummy
        for node in arr {
            node?.left = nil
            node?.right = nil
            cur?.right = node
            cur = cur?.right
        }
        return dummy?.right
    }
    func dfs(_ root: TreeNode?, _ arr: inout [TreeNode?]) {
        if root?.val == nil {
            return
        }
        dfs(root?.left, &arr)
        arr.append(root)
        dfs(root?.right, &arr)
    }
}

//: [Next](@next)
