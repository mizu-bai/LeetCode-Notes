//: [Previous](@previous)

/*:
 # 1269. 停在原地的方案数
 
 有一个长度为 `arrLen` 的数组，开始有一个指针在索引 `0` 处。

 每一步操作中，你可以将指针向左或向右移动 `1` 步，或者停在原地（指针不能被移动到数组范围外）。

 给你两个整数 `steps` 和 `arrLen` ，请你计算并返回：在恰好执行 `steps` 次操作以后，指针仍然指向索引 `0` 处的方案数。

 由于答案可能会很大，请返回方案数 __模__ `10^9 + 7` 后的结果。
 
 __示例 1：__

 ```
 输入：steps = 3, arrLen = 2
 输出：4
 解释：3 步后，总共有 4 种不同的方法可以停在索引 0 处。
 向右，向左，不动
 不动，向右，向左
 向右，不动，向左
 不动，不动，不动
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-ways-to-stay-in-the-same-place-after-some-steps
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//: [Next](@next)
