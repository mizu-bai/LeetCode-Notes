//: [Previous](@previous)

/*:
 # 方法三：KMP 算法
 
 * 时间复杂度：`O(m + n)`
 * 空间复杂度：`O(m)`
 
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
        var pi = [Int](repeating: 0, count: m)
        var j = 0
        for i in 1 ..< m {
            while j > 0 && needle[i] != needle[j] {
                j = pi[j - 1]
            }
            if needle[i] == needle[j] {
                j += 1
            }
            pi[i] = j
        }
        j = 0
        for i in 0 ..< n {
            while j > 0 && haystack[i] != needle[j] {
                j = pi[j - 1]
            }
            if haystack[i] == needle[j] {
                j += 1
            }
            if j == m {
                return i - m + 1
            }
        }
        return -1
    }
}

//: [Next](@next)
