//: [Previous](@previous)

/*:
 # 滑动窗口（双指针）
 
 1. 我们使用两个指针表示字符串中的某个子串（或窗口）的左右边界，其中左指针代表着「枚举子串的起始位置」，而右指针即为「枚举子串的结束位置」
 
 2. 在每一步的操作中，将左指针向右移动一格，表示__开始枚举下一个字符作为起始位置__，然后不断地向右移动右指针，但需要保证这两个指针对应的子串中没有重复的字符。在移动结束后，这个子串就对应着__以左指针开始的，不包含重复字符的最长子串__。记录下这个子串的长度；
 
 3. 在枚举结束后，找到的最长的子串的长度即为答案。

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/wu-zhong-fu-zi-fu-de-zui-chang-zi-chuan-by-leetc-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        // 使用 dict 存储子串中的字符，确保不重复
        var dict = [Character: Int]()
        // 子串起始
        var start = 0
        for (index, char) in s.enumerated() {
            // 字典中不存在 char 时，preIndex = -1，永远小于 start
            let preIndex = dict[char] ?? -1
            if preIndex >= start {
                // 存在重复字符，重新选取 start
                start = preIndex + 1
            }
            let length = index - start + 1
            result = max(result, length)
            // 记录字符 char 在字符串中上次出现的索引 index
            dict[char] = index
        }
        return result
    }
}
