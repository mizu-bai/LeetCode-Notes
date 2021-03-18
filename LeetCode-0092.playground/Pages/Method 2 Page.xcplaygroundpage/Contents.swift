//: [Previous](@previous)

/*:
 # 一次遍历（头插法）
 
 ## 算法步骤
 
 在需要反转的区间里，每遍历到一个节点，让这个新节点来到反转部分的初始位置。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(N)`
 * 空间复杂度：`O(1)`
 */

/// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        // 添加虚拟头节点
        let dummyNode: ListNode? = ListNode.init(-1, head)
        // 开始头插
        // 移动到 left 前一个节点
        var pre: ListNode? = dummyNode
        var next: ListNode? = nil
        for i in 0 ..< left - 1 {
            pre = pre?.next
        }
        // 从 left 遍历到 right
        var cur = pre?.next
        for i in 0 ..< right - left {
            // 头插
            next = cur?.next
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        return dummyNode?.next
    }
}

//: [Next](@next)
