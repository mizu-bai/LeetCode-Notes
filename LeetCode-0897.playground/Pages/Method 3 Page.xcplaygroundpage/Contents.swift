//: [Previous](@previous)

/*:
 # 方法三：在遍历中修改节点指向
 
 ## 思路
 
 因为只需要知道两个节点之间的相对关系，所以可以不用数组保存所有节点，只需要在遍历过程中改变节点指向即可。
 
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        let dummy: TreeNode? = TreeNode(-1)
        var cur: TreeNode? = dummy
        dfs(root, &cur)
        return dummy?.right
    }
    
    func dfs(_ node: TreeNode?, _ cur: inout TreeNode?) {
        if node?.val == nil {
            return
        }
        
        dfs(node?.left, &cur)
        
        cur?.right = node
        node?.left = nil
        cur = node
        
        dfs(node?.right, &cur)
    }
}

//: [Next](@next)
