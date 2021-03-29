//: [Previous](@previous)

/*:
 # 方法三：分治（仿归并）
  
 ## 思路
 
 把数字分成两半，然后交换这两半的数字，然后把前后两段再分成两半，再交换内部顺序……直到最后交换完成。
 
 与运算取对需要的位置上的数字，右移和左移移动位置。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(log2(k))`
 * 空间复杂度：`O(1)`
 
 其中 `k` 是二进制字符串的长度。
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var m: Int = n
        m = (m >> 16) | (m << 16)
        m = ((m & 0xff00ff00) >> 8) | ((m & 0x00ff00ff) << 8)
        m = ((m & 0xf0f0f0f0) >> 4) | ((m & 0x0f0f0f0f) << 4)
        m = ((m & 0xcccccccc) >> 2) | ((m & 0x33333333) << 2)
        m = ((m & 0xaaaaaaaa) >> 1) | ((m & 0x55555555) << 1)
        return m
    }
}

//: [Next](@next)
