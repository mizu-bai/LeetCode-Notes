//: [Previous](@previous)

/*:
 # 方法一（栈）
 
 ## 思路
 
 首先创建一个空栈，再遍历字符串。如果栈为空，则 `push` 字符入栈；如果栈不为空，则判断栈顶与当前字符是否相同，或者相同则 `pop` 出栈顶字符，且不把当前字符入栈，否则就将当前字符入栈。最后返回栈中字符组成的字符串。
 
 ## 复杂度分析
 
 1. 时间复杂度：`O(n)`
 2. 空间复杂度：`O(n)`，最坏情况下字符串中的所有字符都会被 `push` 进栈中
 
 其中，`n` 为字符串的长度。
 */

class Solution {
    func removeDuplicates(_ S: String) -> String {
        var charArr: [Character] = [Character]()
        for char: Character in S {
            if char == charArr.last {
                charArr.removeLast()
            } else {
                charArr.append(char)
            }
        }
        return String(charArr)
    }
}
