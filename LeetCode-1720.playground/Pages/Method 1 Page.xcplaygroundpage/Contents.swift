//: [Previous](@previous)

/*:
 # 方法一：异或的性质
 
 ## 思路
 
 异或运算的性质如下：
 
 1. `a ^ 0 = a`
 2. `a ^ a = 0`
 3. `(a ^ b) ^ c = a ^ (b ^ c)`
 
 又
 
 `encoded[i] = arr[i] ^ arr[i - 1]`
 
 则

 `encoded[i] ^ arr[i - 1] =  arr[i] ^ arr[i - 1] ^ arr[i - 1] = arr[i] ^ 0 = arr[i]`
 
 ## 复杂度分析
 
 * 时间：`O(n)`
 * 空间：`O(n)`
 */

class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        let n = encoded.count
        var arr = [Int](repeating: 0, count: n)
        arr[0] = first
        for i in 1 ... n {
            arr[i] = arr[i - 1] ^ encoded[i - 1]
        }
        return arr
    }
}

//: [Next](@next)
