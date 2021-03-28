//: [Previous](@previous)

/*:
 # 方法一：快慢指针
 
 ## 思路
 
 将链表每个节点向右移动 `k` 个位置即移动 `k % n` 个位置，其中 `n` 是链表的长度。实际操作可以将链表在倒数 `k` 个节点和倒数 `k + 1` 个节点处断开，将后面一段链表的尾部接在前一段链表的头部。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(1)`
 
 */

/// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0;
        self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}

/// Solution
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 不改动的情况
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        // 计算长度
        var count: Int = 0
        var cur: ListNode? = head
        while cur != nil {
            count += 1
            cur = cur?.next
        }
        // 实际移动的次数
        let m = k % count
        if m == 0 {
            return head
        }
        // 拆分成 (count - m, m) 两段
        var fast: ListNode? = head
        var slow: ListNode? = head
        for _ in 0 ..< m {
            fast = fast?.next
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        // new head
        let newHead: ListNode? = slow?.next
        // 在 count - m 和 m 之间切
        slow?.next = nil
        // 连到头上去
        fast?.next = head
        return newHead
    }
}

//: [Next](@next)
