//: [Previous](@previous)

/*:
 # 前缀和
 
 计算 `nums` 的前缀和，减少检索的时间，空间换时间
 
 `sumRange(i, j) = sum[j + 1] - sum[i]`
 
 * 时间复杂度：初始化 `O(n)`，检索 `O(1)`
 
 * 空间复杂度：`O(n)`
 
 其中，`n` 是数组 `nums` 的长度
 */

class NumArray {
    /// 前缀和
    var preSum: [Int] = [Int]()
    init(_ nums: [Int]) {
        let length = nums.count
        if length > 0 {
            self.preSum.append(nums[0])
            for i in 1 ..< length {
                preSum.append(nums[i] + preSum[i - 1])
            }
        }
    }
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return i == 0 ? preSum[j] : preSum[j] - preSum[i - 1]
    }
}
