//: [Previous](@previous)

/*:
 # 方法二：迭代时计算 `next()` 节点
 
 ## 思路
 
 把 __递归__ 转成 __迭代__，基本思想就是用栈，而栈中只保留左节点。构造时，一路到底，把根节点和它的所有左节点放到栈中；调用 `next()` 方法时，弹出栈顶的左节点，如果这个节点有右子树，就对右子树一路到到底，把它和它的所有左节点压入栈中，然后再重复弹出-压入的过程。
 
 ## 复杂度分析
 
 * 时间复杂度：初始化和 `next()` 均摊是 `O(n)`
 * 空间复杂度：`O(h)`，`h` 为树的高度，因为栈中只保留左节点，栈中元素最多为树的高度。
 */

/// Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() {
        self.val = 0;
        self.left = nil;
        self.right = nil;
     }
     public init(_ val: Int) {
        self.val = val;
        self.left = nil;
        self.right = nil;
     }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 
/// Solution
class BSTIterator {
    
    var stack: [TreeNode?]

    init(_ root: TreeNode?) {
        self.stack = [TreeNode]()
        var node: TreeNode? = root
        while node?.val != nil {
            self.stack.append(node)
            node = node?.left
        }
    }
    
    func next() -> Int {
        let cur: TreeNode? = self.stack.popLast()!
        var node: TreeNode? = cur?.right
        while node?.val != nil {
            self.stack.append(node)
            node = node?.left
        }
        return cur!.val
    }
    
    func hasNext() -> Bool {
        return self.stack.count > 0
    }
}

//: [Next](@next)
