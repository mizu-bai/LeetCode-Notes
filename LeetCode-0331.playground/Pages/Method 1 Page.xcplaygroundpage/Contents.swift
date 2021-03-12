 //: [Previous](@previous)

/*:
 # 栈
  
 ## 思路
  
 先把字符串按 `,` 分割成数组，在对其遍历。先把这个元素放入栈中，如果栈满足以下条件：
  * 栈内的元素数量 > 2
  * 栈的最后三个元素为 `["number", "#", "#"]`
 就移除这最后三个元素，然后压入一个 `#`，直到栈的元素数量不能再减少。
  
 最后判断栈是否是 `["#"]`，如果是则返回 `true`，否则为 `false`。
  
 ## 例
  
  ```
  preorder = "9,3,4,#,#,1,#,#,2,#,6,#,#"
  stack =
  ["9"]
  ["9", "3"]
  ["9", "3", "4"]
  ["9", "3", "4", "#"]
  ["9", "3", "#"]
  ["9", "3", "#", "1"]
  ["9", "3", "#", "1", "#"]
  ["9", "#"]
  ["9", "#", "2"]
  ["9", "#", "2", "#"]
  ["9", "#", "2", "#", "6"]
  ["9", "#", "2", "#", "6", "#"]
  ["#"] -> true
  ```
 */
 
import Foundation

class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        let arr = preorder.components(separatedBy: ",")
        var stack = [String]()
        for item in arr {
            stack.append(item)
            while stack.count > 2 && stack[stack.count - 2 ... stack.count - 1] == ["#", "#"] && Int(stack[stack.count - 3]) != nil {
                stack.removeLast(3)
                stack.append("#")
            }
        }
        return stack == ["#"] ? true : false
    }
}
