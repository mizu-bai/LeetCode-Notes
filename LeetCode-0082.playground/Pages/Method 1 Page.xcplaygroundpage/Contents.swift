//: [Previous](@previous)

/*:
 # 方法一：迭代
 
 ## 思路
 
 只要遍历数组一次。一边遍历，一边统计相邻节点的值是否相等，如果相等就继续后移到值不等的位置，然后删除值相等的区间。
 
 为了防止 `head` 被删除，要在开头增加一个 __dummy 节点__，让 `dummy?.next = head`，就算 `head` 被删了，让 `dummy?.next` 指向链表的头部，最后返回 `dummy?.next` 就可以了。
 
 __注__：用到了链表有序这一条件，即链表中相等的元素会挨在一起。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`，只对节点遍历了一遍
 * 空间复杂度：`O(1)`，只用了常量空间
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(0, head)
        var pre = dummy
        var cur = head
        while cur?.val != nil {
            while cur?.next != nil && cur?.val == cur?.next?.val {
                cur = cur?.next
            }
            if pre?.next === cur {
                pre = pre?.next
            } else {
                pre?.next = cur?.next
            }
            cur = cur?.next
        }
        return dummy?.next
    }
}

//: [Next](@next)
