//: [Previous](@previous)

/*:
 # 方法二：暴力匹配
 
 ## 思路
 
 让字符串 `needle` 与字符串 `haystack` 的所有长度为 `m` 的子串均匹配一次。
 
 为了减少不必要的匹配，我们每次匹配失败即立刻停止当前子串的匹配，对下一个子串继续匹配。如果当前子串匹配成功，我们返回当前子串的开始位置即可。如果所有子串都匹配失败，则返回 `-1`。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n * m)`
 * 空间复杂度：`O(1)`
 
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystack = Array(haystack)
        let needle = Array(needle)
        let n = haystack.count
        let m = needle.count
        if m == 0 {
            return 0
        }
        if n == 0 || n < m {
            return -1
        }
        for i in 0 ... (n - m) {
            var flag: Bool = true
            for j in 0 ..< m {
                if haystack[i + j] != needle[j] {
                    flag = false
                    break
                }
            }
            if flag {
                return i
            }
        }
        return -1
    }
}

//: [Next](@next)
