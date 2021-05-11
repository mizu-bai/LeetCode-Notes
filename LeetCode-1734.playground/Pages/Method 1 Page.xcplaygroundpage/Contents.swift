//: [Previous](@previous)

/*:
 # 方法一：数学
 
 ## 思路
 
 这题没说 `first` 是什么，要自己求。
 
 令
 
 `total = perm[0] ^ perm[1] ^ perm[2] ^ perm[3] ^ perm[4]`
 
 `suff = perm[1] ^ perm[2] ^ perm[3] ^ perm[4] = encode[1] ^ encode[3]`，即 `encode` 的偶数项连续异或
 
 则有
 
 `first = total ^ suff`
 
 即可求出 `perm` 数组
 
 ## 复杂度分析
 
 * 时间：`O(n)`
 * 空间：`O(n)`
 */

class Solution {
    func decode(_ encoded: [Int]) -> [Int] {
        let n = encoded.count
        var first = 0
        for i in 0 ... n {
            first ^= i + 1
        }
        for i in stride(from: 1, to: n, by: 2) {
            first ^= encoded[i]
        }
        var perm = [Int](repeating: 0, count: n + 1)
        perm[0] = first
        for i in 0 ..< n {
            perm[i + 1] = perm[i] ^ encoded[i]
        }
        return perm
    }
}

//: [Next](@next)
