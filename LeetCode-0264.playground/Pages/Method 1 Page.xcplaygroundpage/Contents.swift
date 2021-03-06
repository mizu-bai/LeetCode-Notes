//: [Previous](@previous)

/*:
 # 方法一：动态规划
 
 ## 思路
 
 要生成第 `n` 个丑数，必须从第一个丑数 `1` 开始向后找。丑数只包含 `2`，`3`，`5` 三个因数，所以生成的方式就是在已经生成的丑数集合中乘以这三个因数得到新的丑数。
 
 用还没乘过 `2` 的最小丑数乘以 `2`；用还没乘过 `3` 的最小丑数乘以 `3`；用还没乘过 `5` 的最小丑数乘以 `5`。然后在得到的数字中取最小，就是新的丑数。
 
 * 用三个指针，分别指向还没乘过 `2`，`3`，`5` 的丑数的位置；
 * 每次获取新的丑数，新的丑数即，当前指向 `2`，`3`，`5` 的指针所指的数与对应的因数相乘，得到的三个数中的最小值。
 * 这个数是哪个指针所指的数与其因数相乘得到的，就把对应的指针移动一位，表示当前数已经乘过，移动到下一个没有乘的数。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 */

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        var p2 = 1
        var p3 = 1
        var p5 = 1
        if n == 1 {
            return dp[n]
        }
        for i in 2 ... n {
            let num2 = dp[p2] * 2
            let num3 = dp[p3] * 3
            let num5 = dp[p5] * 5
            dp[i] = min(num2, num3, num5)
            if dp[i] == num2 {
                p2 += 1
            }
            if dp[i] == num3 {
                p3 += 1
            }
            if dp[i] == num5 {
                p5 += 1
            }
        }
        return dp[n]
    }
}

//: [Next](@next)
