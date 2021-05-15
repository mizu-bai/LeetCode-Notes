//: [Previous](@previous)

/*:
 # 方法一：贪心
 
 ## 思路
 
 寻找不超过 `num` 的最大符号值，将 `num` 剪去后，在字符串中添加该符号，然后重复以上步骤，直到 `num = 0` 为止。
 
 ## 复杂度分析
 
 * 时间：`O(1)`，字符-数值对的出现次数均不会超过 3，因此循环有上限，该题最多循环 15 次。
 * 空间：`O(1)`
 */

class Solution {
    func intToRoman(_ num: Int) -> String {
        let encode = [
            ("M", 1000),
            ("CM", 900),
            ("D", 500),
            ("CD", 400),
            ("C" , 100),
            ("XC", 90),
            ("L" , 50),
            ("XL", 40),
            ("X" , 10),
            ("IX", 9),
            ("V" , 5),
            ("IV", 4),
            ("I" , 1),
        ]
        var num = num
        var roman = ""
        for (symbol, value) in encode {
            while num >= value {
                num -= value
                roman += symbol
            }
            if num == 0 {
                break
            }
        }
        return roman
    }
}

//: [Next](@next)
