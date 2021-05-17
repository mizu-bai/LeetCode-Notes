//: [Previous](@previous)

/*:
 # 993. 二叉树的堂兄弟节点
 
 在二叉树中，根节点位于深度 `0` 处，每个深度为 k 的节点的子节点位于深度 `k+1` 处。

 如果二叉树的两个节点深度相同，但 父节点不同 ，则它们是一对堂兄弟节点。

 我们给出了具有唯一值的二叉树的根节点 `root` ，以及树中两个不同节点的值 `x` 和 `y` 。

 只有与值 `x` 和 `y` 对应的节点是堂兄弟节点时，才返回 `true` 。否则，返回 `false`。
 
 __示例 1：__
 
 ```
 输入：root = [1,2,3,4], x = 4, y = 3
 输出：false
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cousins-in-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//: 代码模板

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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        
    }
}

//: [Next](@next)
