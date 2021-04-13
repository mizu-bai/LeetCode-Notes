//: [Previous](@previous)

/*:
 # 783. 二叉搜索树节点最小距离
 
 给你一个二叉搜索树的根节点 `root` ，返回 __树中任意两不同节点值之间的最小差值__ 。
 
 __示例 1：__
 
 ```
 输入：root = [4,2,6,1,3]
 输出：1
 ```
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        
    }
}

//: [Next](@next)
