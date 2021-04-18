//: [Previous](@previous)

/*:
 # 方法一：递归
 
 我爬了，只会这个。
 
 ## 思路
 
 不断分割字符串判断，会超时。
 
 ## 复杂度分析
 
 时间复杂度：`O(n!)`
 空间复杂度：`O(n!)`
 */

class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let n = s1.count
        if n == 0 {
            return true
        } else if n == 1 {
            return s1 == s2
        }
        
        let a1 = Array(s1);
        let a2 = Array(s2);
        
        if a1.sorted() != a2.sorted() {
            return false
        }
        
        for i in 1 ..< n {
            if self.isScramble(String(a1[0 ..< i]), String(a2[0 ..< i])) && self.isScramble(String(a1[i ..< n]), String(a2[i ..< n])) {
                return true
            } else if self.isScramble(String(a1[0 ..< i]), String(a2[(n - i) ..< n])) && self.isScramble(String(a1[i ..< n]), String(a2[0 ..< (n - i)])) {
                return true
            }
        }
        return false
    }
}

//: [Next](@next)
