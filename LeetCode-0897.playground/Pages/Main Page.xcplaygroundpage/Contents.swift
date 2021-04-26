//: [Previous](@previous)

/*:
 # 897. 递增顺序搜索树
 
 给你一棵二叉搜索树，请你 __按中序遍历__ 将其重新排列为一棵递增顺序搜索树，使树中最左边的节点成为树的根节点，并且每个节点没有左子节点，只有一个右子节点。
 
 __示例 1：__
 
 ```
 输入：root = [5,3,6,2,4,null,8,1,null,null,null,7,9]
 输出：[1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
 ```
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/increasing-order-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        
    }
}

//: [Next](@next)
