/*:
 # 61. 旋转链表
 
 给你一个链表的头节点 `head` ，旋转链表，将链表每个节点向右移动 `k` 个位置。
 
 __示例 1：__
 
 ```
 输入：head = [1,2,3,4,5], k = 2
 输出：[4,5,1,2,3]
 ```
 __示例 2：__
 
 ```
 输入：head = [0,1,2], k = 4
 输出：[2,0,1]
 ```
 */

//: 代码模板

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

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {

    }
}

//: [Next](@next)
