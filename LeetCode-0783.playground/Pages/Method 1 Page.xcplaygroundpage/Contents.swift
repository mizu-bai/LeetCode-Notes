//: [Previous](@previous)

/*:
 # 方法一：递归
 
 ## 思路
 
 由于二叉搜索树符合以下性质：如果一个节点有左结点，那左结点的值一定小于该节点，如果有右结点，那右结点的值一定大于该节点。中序遍历二叉搜索树得到的数组一定是单调递增的，因此只要遍历并判断对其当前节点值与上一个节点值是的差值是否小于当前遍历到的最小差值即可。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，因为要遍历树中的所有结点
 * 空间复杂度：`O(1)`，只要常数空间保存节点间的差值
 
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
        dfs(root, &ans, &pre)
        return ans
    }
    func dfs(_ node: TreeNode?, _ ans: inout Int, _ pre: inout Int) {
        if node == nil {
            return;
        }
        dfs(node?.left, &ans, &pre)
        if pre == -1 {
            pre = node!.val
        } else {
            ans = min(ans, node!.val - pre)
            pre = node!.val
        }
        dfs(node?.right, &ans, &pre)
    }
}

//: [Next](@next)
