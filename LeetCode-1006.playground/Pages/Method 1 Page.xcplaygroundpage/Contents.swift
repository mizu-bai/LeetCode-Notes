//: [Previous](@previous)

/*:
 # 方法一：使用栈模拟
 
 ## 思路
 
 遇到乘除，将元素出栈，计算出结果再入栈，遇到加减就把数压入栈中，最后再累加即得到结果。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(N)`，从 `N` 到 `1` 每个元素进栈一次，出栈一次
 * 空间复杂度：`O(N)`
 */

class Solution {
    func clumsy(_ N: Int) -> Int {
        var n: Int = N
        var stack: [Int] = [Int]()
        stack.append(n)
        n -= 1
        var op = 0
        while n > 0 {
            if op % 4 == 0 {
                stack.append(stack.popLast()! * n)
            } else if op % 4 == 1 {
                stack.append(stack.popLast()! / n)
            } else if op % 4 == 2 {
                stack.append(n)
            } else {
                stack.append(-n)
            }
            op += 1
            n -= 1
        }
        var sum = 0
        while stack.count > 0 {
            sum += stack.popLast()!
        }
        return sum
    }
}

//: [Next](@next)
