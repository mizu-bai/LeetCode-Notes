//: [Previous](@previous)

/*:
 # 872. 叶子相似的树
 
 请考虑一棵二叉树上所有的叶子，这些叶子的值按从左到右的顺序排列形成一个 __叶值序列__ 。

 举个例子，如上图所示，给定一棵叶值序列为 `(6, 7, 4, 9, 8)` 的树。

 如果有两棵二叉树的叶值序列是相同，那么我们就认为它们是 叶相似 的。

 如果给定的两个根结点分别为 `root1` 和 `root2` 的树是叶相似的，则返回 `true`；否则返回 `false` 。
 
 __示例：__
 
 ```
 输入：root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
 输出：true
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/leaf-similar-trees
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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        
    }
}

//: [Next](@next)
