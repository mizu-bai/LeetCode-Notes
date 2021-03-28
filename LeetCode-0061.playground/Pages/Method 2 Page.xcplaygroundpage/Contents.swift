//: [Previous](@previous)

/*:
 # 方法二：循环链表
 
 ## 思路
 
 先将给定的链表连接成环，然后在指定位置断开。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，最坏情况要遍历两次
 * 空间复杂度：`O(1)`，只需要常数空间保存当前节点位置
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
        if k == 0 || head?.val == nil || head?.next?.val == nil {
            return head
        }
        
        var count: Int = 1
        var cur: ListNode? = head
        while cur?.next?.val != nil {
            count += 1
            cur = cur?.next
        }
        print(count)

        let m: Int = count - k % count
        if m == count {
            return head
        }
        
        cur?.next = head
        for _ in 0 ..< m {
            cur = cur?.next
        }
        
        let newHead: ListNode? = cur?.next
        cur?.next = nil
        return newHead
    }
}
