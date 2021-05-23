//: [Previous](@previous)

/*:
 # 方法一：数学
 
 ## 思路
 
 1. 假设 `nums` 的长度为偶数，先手 Alice 总能找到一个数字，在擦掉这个数字之后剩余的所有数字结果异或结果不为 0。在 Alice 擦掉这个数字后，黑板上剩下奇数个数字，无论 Bob 擦掉哪个数字，留给 Alice 的一定是偶数个，此时 Alice 要么获胜，要么还可以找到一个数字，重复以上操作；
 2. 假设 `nums` 的长度是奇数，Alice 在擦掉一个数组之后，留给 Bob 的数字一定有偶数个，则 Bob 必胜。
 
 ## 复杂度分析
 
 * 时间：`O(n)`
 * 空间：`O(1)`
 */

class Solution {
    func xorGame(_ nums: [Int]) -> Bool {
        return nums.reduce(0) {$0 ^ $1} == 0 || nums.count % 2 == 0
    }
}

//: [Next](@next)
