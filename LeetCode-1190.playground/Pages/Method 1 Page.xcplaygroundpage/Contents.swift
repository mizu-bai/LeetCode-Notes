//: [Previous](@previous)

/*:
 # 方法一：栈
 
 ## 思路
 
 遇到左括号把字符串进栈，同时清空字符串，遇到右括号把字符串反转，同时栈弹出一个元素，把字符串连接在它后面，如果是其他字符，就直接连接在字符串上。
 
 ## 复杂度分析
 
 * 时间：`O(n^2)`
 * 空间：`O(n)`
 */

class Solution {
    func reverseParentheses(_ s: String) -> String {
        var stack = [String]()
        var str = ""
        for char in s {
            if char == "(" {
                stack.append(str)
                str = ""
            } else if char == ")" {
                str = String(str.reversed())
                str = stack.popLast()! + str
            } else {
                str.append(char)
            }
        }
        return str
    }
}


//: [Next](@next)
