//: [Previous](@previous)

/*:
 # 穿针引线
 
 ## 算法步骤
 
 1. 先将待反转的区域反转
 2. 把 `pre` 的 `next` 指针指向反转以后的链表的头节点，把反转后的链表的尾节点的 `next` 指向 `succ`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(N)`
 * 空间复杂度：`O(1)`
 
 其中，`N` 是链表总节点数。最坏情况下，要遍历整个链表。
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

        // 走到 left 前的一个节点
        var pre: ListNode? = dummyNode
        for _ in 0 ..< left - 1 {
            pre = pre?.next
        }
        // 走到 right 节点
        var rightNode: ListNode? = pre
        for _ in 0 ..< right - left + 1 {
            rightNode = rightNode?.next
        }
        // 切断
        var leftNode: ListNode? = pre?.next
        let curr: ListNode? = rightNode?.next

        pre?.next = nil
        rightNode?.next = nil
        // 反转
        reverseLinkedList(&leftNode)
        // 接上
        pre?.next = rightNode
        leftNode?.next = curr
        return dummyNode?.next
    }
    func reverseLinkedList(_ head: inout ListNode?) {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            let next: ListNode? = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return
    }
}

//: [Next](@next)
