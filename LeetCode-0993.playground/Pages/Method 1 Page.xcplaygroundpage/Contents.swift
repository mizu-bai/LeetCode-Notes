//: [Previous](@previous)

/*:
 # 方法一：dfs
 
 ## 思路
 
 DFS 遍历，找到值与 `x` 和 `y` 相同的结点，并保存其深度和父结点。判断是深度是否相同，父节点是否不同。
 
 ## 复杂度分析
 
 * 时间：`O(n)`
 * 空间：变量 `O(1)`，递归栈 `O(n)`
 */

/// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

/// Solition
class Solution {
    var x: Int = 0
    var y: Int = 0
    var xDepth: Int? = nil
    var xParent: TreeNode? = nil;
    var yDepth: Int? = nil
    var yParent: TreeNode? = nil;
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        self.x = x
        self.y = y
        self.dfs(root, 0, nil)
        if self.xDepth == self.yDepth && self.xParent !== self.yParent {
            return true
        }
        return false
    }
    func dfs(_ node: TreeNode?, _ depth: Int, _ parent: TreeNode?) {
        if node?.val == nil {
            return
        }
        if xDepth != nil && xParent != nil && yDepth != nil && yParent != nil {
            return
        }
        self.dfs(node?.left, depth + 1, node)
        if node?.val == self.x {
            self.xDepth = depth
            self.xParent = parent
        }
        if node?.val == self.y {
            self.yDepth = depth
            self.yParent = parent
        }
        self.dfs(node?.right, depth + 1, node)
    }
}

//: [Next](@next)
