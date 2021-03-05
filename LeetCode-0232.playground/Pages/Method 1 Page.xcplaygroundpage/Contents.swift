//: [Previous](@previous)

/*:
 # 双栈
 
一个栈用于存放数据，另一个栈用于中转。
 
 * `push`：若 `stack1` 和`stack2`都为空，即为一个空队列，直接向 `stack1` 中  `push` 元素；若 `stack1` 不为空，先把 `stack1` 中的元素 `pop` 出并 `push` 进 `stack2`，再将元素 `push` 进`stack1`，最后将元素从 `stack2` 中 `pop` 出并 `push` 进`stack1`中。`stack1` 的开头即为队列的末尾，`stack1` 的末尾即为队列的开头。
 * `pop`：元素出队列，即把 `stack1` 最后的一个元素 `pop` 出即可。
 * `peek`：取 `stack1` 的最后一个元素的值。
 * `empty`：`stack1` 是否为空。
 
 */

class MyQueue {
    var stack1: [Int] = [Int]()
    var stack2: [Int] = [Int]()

    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        // Both stack1 and stack2 are empty
        if self.stack1.isEmpty && stack2.isEmpty {
            self.stack1.append(x)
        } else {
            // stack1 is Not Empty
            for _ in self.stack1 {
                self.stack2.append(self.stack1.popLast()!)
            }
            stack1.append(x)
            for _ in self.stack2 {
                self.stack1.append(self.stack2.popLast()!)
            }
        }
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return self.stack1.popLast()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return self.stack1.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return self.stack1.isEmpty
    }
}
