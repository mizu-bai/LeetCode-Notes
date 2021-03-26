//: [Previous](@previous)

/*:
 # 方法一
 
 ## 思路
 
 遍历链表，如果当前 `cur` 与 `cur.next` 对应的元素相同，就删除 `cur.next`，否则就直接向下走。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度；`O(1)`
 
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
        var dummy: ListNode? = ListNode(0, head)
        var cur: ListNode? = dummy?.next
        while cur?.val != nil {
            if cur?.val == cur?.next?.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return dummy?.next
    }
}
