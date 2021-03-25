//: [Previous](@previous)

/*:
 # 方法三：哈希表
 
 ## 思路
 
 维护一个 hash table，记录链表中各值出现的次数。第一次遍历链表统计各节点的值，第二次遍历时检索各节点的值，如果出现次数大于一，就说明需要删除这个节点。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 
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
        var dict = [Int: Int]()
        var cur: ListNode? = head
        while cur?.val != nil {
            if dict[cur!.val] != nil {
                dict[cur!.val]! += 1
            } else {
                dict[cur!.val] = 1
            }
            cur = cur?.next
        }
        cur = dummy
        while cur?.val != nil && cur?.next?.val != nil {
            if dict[cur!.next!.val]! > 1 {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return dummy?.next
    }
}
