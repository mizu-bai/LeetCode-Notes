//: [Previous](@previous)

/*:
 # 方法一：提前保留全部节点

 ## 思路
 
 提前把二叉树的所有节点按中序遍历一次，保存结果到队列里，每次调用 `next()` 方法时，就弹出一个元素。
 
 ## 复杂度分析
 
 * 时间复杂度：初始化遍历的时候是 `O(n)`，调用的时候 `next()` 的是 `O(1)`
 * 空间复杂度：`O(n)`，因为存储了整个树的元素
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

    var queue: [Int]

    init(_ root: TreeNode) {
        self.queue = [Int]()
        self.inOrder(root)
    }
    
    func next() -> Int {
        return self.queue.removeFirst()
    }
    
    func hasNext() -> Bool {
        return self.queue.count > 0
    }
    
    func inOrder(_ root: TreeNode?) {
        if root?.val != nil {
            self.inOrder(root?.left)
            self.queue.append(root!.val)
            self.inOrder(root?.right)
        }
    }
}

//: [Next](@next)
