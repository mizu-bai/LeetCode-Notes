//: [Previous](@previous)

/*:
 # 栈
 
 ## 思路
 
 遇到数字就进栈，遇到符号出栈两个元素，运算后再压入栈中，直到遍历完表达式，此时栈中也只剩唯一一个元素。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 
 其中， `n` 是数组 `token` 的长度。
 
/ */
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var result: [Int] = [Int]()
        for item in tokens {
            if let v = Int(item) {
                result.append(v)
            } else {
                let num1: Int = result.popLast()!
                let num2: Int = result.popLast()!
                switch item {
                case "+":
                    result.append(num2 + num1)
                case "-":
                    result.append(num2 - num1)
                case "*":
                    result.append(num2 * num1)
                case "/":
                    result.append(num2 / num1)
                default:
                    break
                }
            }
        }
        return result.first!
    }
}
