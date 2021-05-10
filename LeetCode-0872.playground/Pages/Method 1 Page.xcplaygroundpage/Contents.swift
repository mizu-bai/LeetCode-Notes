//: [Previous](@previous)

/*:
 # 方法一：DFS
 
 ## 思路
 
 DFS 遍历出叶节点，将其值保存到数组中，再比较数组。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n1 + n2)`
 * 空间复杂度：`O(n1 + n2)`
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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var arr1 = [Int]()
        var arr2 = [Int]()
        dfs(root1, &arr1)
        dfs(root2, &arr2)
        return arr1 == arr2

    }
    func dfs(_ node: TreeNode?, _ arr: inout [Int]) {
        if node?.val == nil {
            return
        }
        if node?.left == nil && node?.right == nil {
            arr.append(node!.val)
        }
        dfs(node?.left, &arr)
        dfs(node?.right, &arr)
    }
}

//: [Next](@next)
